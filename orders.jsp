<%@ page import="java.sql.*" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>User Information</title>
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
            }

            th,
            td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #a596e6;
            }

            th {
                background-color: #f3f49d;
            }
        </style>
    </head>

    <body>
        <h2>Orders</h2>
        <table>
            <tr>
                <th>Username</th>
                <th>Product ID</th>
                <th>Product Name</th>
                <th>Product Price</th>
                <th>Confirmation</th>
            </tr>
            <% 
            try
            { 
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system" , "manager" );
                Statement stmt=conn.createStatement(); ResultSet rs=stmt.executeQuery("SELECT mail,pid,name,price FROM botorder");
                while (rs.next())
                { 
                    %>
                    <tr>
                        <td>
                            <%= rs.getString(1) %>
                        </td>
                        <td>
                            <%= rs.getString(2) %>
                        </td>
                        <td>
                            <%= rs.getString(3) %>
                        </td>
                        <td>
                            <%= rs.getLong(4) %>
                        </td>
                        <td>
                            <form name="f1" action="confirm.jsp" method="post">
                                <input type="hidden" name="u" value="<%= rs.getString(1) %>" >
                                <input type="hidden" name="pid" value="<%= rs.getString(2) %>" >
                                <input type="submit" value="Confirm">
                            </form>
                        </td>
                    </tr>
                <%
             }
             } 
             catch (Exception e)
              { e.printStackTrace();
             } %>
        </table>
    </body>

    </html>