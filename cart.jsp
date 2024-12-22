<!DOCTYPE html>
<html>
<head>
    <title>Shopping Cart</title>
</head>
<body>
    <h1>Products</h1>
    <c:forEach var="product" items="${products}">
        <div class='box'>
            <div class='img-box'>
                <img class='images' style='align-items:center;' src="${product.image}"/>
            </div>
            <div class='bottom'>
                <p>${product.title}</p>
                <h2>₹ ${product.price}.00</h2>
                <form method="post" action="ShoppingCartServlet">
                    <input type="hidden" name="productId" value="${product.id}">
                    <button type="submit">Add to Cart</button>
                </form>
            </div>
        </div>
    </c:forEach>

    <h1>Shopping Cart</h1>
    <c:if test="${empty cart}">
        <p>Your Cart is Empty</p>
    </c:if>
    <c:forEach var="item" items="${cart}">
        <div class='cart-item'>
            <div class='row-img'>
                <img class='rowimg' src="${item.image}"/>
            </div>
            <p style='font-size: 12px;'>${item.title}</p>
            <h2 style='font-size: 15px;'>₹ ${item.price}.00</h2>
        </div>
    </c:forEach>
</body>
</html>
