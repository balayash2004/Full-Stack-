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
                border-bottom: 1px solid #add987;
            }

            th {
                background-color: #8abed3;
            }
        </style>
    </head>

    <body>
        <h2>User Information</h2>
        <table>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Phone Number</th>
                <th>Gender</th>
            </tr>
            <% 
            try
             { Class.forName("oracle.jdbc.driver.OracleDriver");
              Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system" , "manager" );
                Statement stmt=conn.createStatement(); ResultSet rs=stmt.executeQuery("SELECT name, mail, phno, gender FROM register");
                while (rs.next())
                { %>
                <tr>
                    <td>
                        <%= rs.getString(1) %>
                    </td>
                    <td>
                        <%= rs.getString(2) %>
                    </td>
                    <td>
                        <%= rs.getLong(3) %>
                    </td>
                    <td>
                        <%= rs.getString(4) %>
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