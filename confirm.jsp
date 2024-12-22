<%@ page import="java.sql.*, java.io.*, java.util.*, jakarta.servlet.*, jakarta.servlet.http.*" %>
<%
try {
    // Connect to the database
    String u=request.getParameter("u");
    String t=request.getParameter("pid");
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "manager");

    // Prepare SQL statement to update status in cart32
    String sql = "UPDATE botorder SET status = ? WHERE mail = ? AND pid = ?";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, "Delivered");
    pstmt.setString(2, u);
    pstmt.setString(3,t);

    // Execute the SQL statement
    int rowsAffected = pstmt.executeUpdate();
    if (rowsAffected > 0) {
        response.sendRedirect("admin_home.html");
    } else {
        out.println("Failed to update status.");
    }
}
 catch (Exception ex) {
    out.println(ex);
}

%>