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
                border-bottom: 1px solid #0f0202;
            }

            th {
                background-color: #f768d6;
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
                <th>Status</th>
            </tr>
            <% 
            try
            { 
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system" , "manager" );
                String email = "";
                if (request.getCookies() != null) {
                    Cookie[] cookies = request.getCookies();
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("username")) {
                        email = cookie.getValue();
                        break;
                        }
                    }
                }
                Statement stmt=conn.createStatement(); ResultSet rs=stmt.executeQuery("SELECT mail,pid,name,price,status FROM botorder");
                while (rs.next())
                { 
                    if(email.equals(rs.getString(1)))
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
                            <%= rs.getString(5) %>
                        </td>
                    </tr>
                <%
                    }
             }
             } 
             catch (Exception e)
              { e.printStackTrace();
             } %>
        </table>
    </body>

    </html>