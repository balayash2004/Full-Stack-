<%@page import="java.sql.*, jakarta.servlet.*, jakarta.servlet.http.*" %>

<%
String u = request.getParameter("t1");
String p = request.getParameter("t2");
int flag = 0;

try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "manager");
    
    // Using parameterized queries to prevent SQL injection
    PreparedStatement pst1 = con.prepareStatement("SELECT * FROM register WHERE username = ? AND password = ?");
    pst1.setString(1, u);
    pst1.setString(2, p);
    ResultSet rs1 = pst1.executeQuery();

    if (rs1.next()) {
        flag = 1;
    }
    
    PreparedStatement pst2 = con.prepareStatement("SELECT * FROM admin_login WHERE username = ? AND password = ?");
    pst2.setString(1, u);
    pst2.setString(2, p);
    ResultSet rs2 = pst2.executeQuery();

    if (rs2.next()) {
        flag = 2;
    }
    
    con.close();

    if (flag == 1) {
        Cookie c1 = new Cookie("name", u);
        response.addCookie(c1);
        session.setAttribute("uname",u);
        response.sendRedirect("jsp/home.jsp");
    } else if (flag == 2) {
        response.sendRedirect("admin_home.html");
    } else {
        RequestDispatcher rd = request.getRequestDispatcher("/login.html");
        rd.forward(request, response);
    }
} catch (Exception e) {
    // Handle exceptions appropriately
    e.printStackTrace();
}
%>
