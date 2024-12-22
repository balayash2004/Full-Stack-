<%@ page errorPage="one.jsp" %>
<%@ page import="java.sql.*" %>
<%
String[] productIds = request.getParameterValues("pid");
String[] srcs = request.getParameterValues("src");
String[] titles = request.getParameterValues("name");
String[] prices = request.getParameterValues("price");

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "manager");

PreparedStatement pst = con.prepareStatement("insert into botorder values (?,?,?,?,?,?)");


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

for (int i = 0; i < productIds.length; i++) {
        int pr=Integer.parseInt(prices[i]);
        pst.setString(1, email);
        pst.setString(2, productIds[i]);
        pst.setString(3, titles[i]);
        pst.setString(4, srcs[i]);
        pst.setInt(5, pr);
        pst.setString(6, "Not Delivered");
        pst.addBatch(); // Add to batch for batch insertion
    }


int[] batchResult = pst.executeBatch(); 
    %><script>alert("CheckOut Succesfull");
    window.location.href = "add.html";</script><%

con.commit(); // Commit the transaction

%>



</body>
</html>
