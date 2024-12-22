<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
// Retrieve data from the form submission
String cartItems = request.getParameter("cartItems");
double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));

// SQL query for inserting data into the orders1 table
String insertQuery = "INSERT INTO orders1 (order_id, cart_items, total_amount) VALUES (order_id_seq.NEXTVAL, ?, ?)";

Connection connection = null;
PreparedStatement preparedStatement = null;

try {
    // Establishing database connection
    Class.forName("oracle.jdbc.driver.OracleDriver");
    connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system", "manager");

    // Creating prepared statement
    preparedStatement = connection.prepareStatement(insertQuery);
    preparedStatement.setString(1, cartItems);
    preparedStatement.setDouble(2, totalAmount);

    // Executing the query
    int rowsAffected = preparedStatement.executeUpdate();

    // Check if insertion was successful
    if (rowsAffected > 0) {
        out.println("Order placed successfully.");
    } else {
        out.println("Failed to place order.");
    }
} catch (Exception e) {
    e.printStackTrace();
} finally {
    // Closing resources
    try {
        if (preparedStatement != null)
            preparedStatement.close();
        if (connection != null)
            connection.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>
