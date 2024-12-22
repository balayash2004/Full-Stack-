<%@page import="java.sql.*" %>
<%
String name=request.getParameter("name");
String mail=request.getParameter("mail");
long ph=Long.parseLong(request.getParameter("phone"));
String pass=request.getParameter("pass");
String gender=request.getParameter("gender");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
String qry="insert into register values(?,?,?,?,?)";
PreparedStatement st=con.prepareStatement(qry);
st.setString(1,name);
st.setString(2,mail);
st.setLong(3,ph);
st.setString(4,pass);
st.setString(5,gender);
int x=st.executeUpdate();
if(x==1)
    out.println("Success");
else
    out.println("Failed");
con.close();
%>
<%@page errorPage="one.jsp" %>