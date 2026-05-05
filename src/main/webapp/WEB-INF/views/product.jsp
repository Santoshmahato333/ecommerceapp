<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ProductPage</title>
    <link rel="stylesheet" href="/css/HomePages.css">
</head>
<body>
<%@ include file="menu.jsp" %>
	  <section class="shop">
    <h1>Our Collection</h1>
    <p>Browse the latest items and add them directly to your cart.</p>

    <div class="product-grid" id="productList">
      <c:forEach items="${popular_products }" var="product">
        <div class="product-card">
          <img src="${pageContext.request.contextPath}/images/${product.imageName }" alt="${product.name }">
          <h3>${product.name }</h3>
          <p>${product.description }</p>
          <p>Rs. ${product.price }</p>
          <p>Stock: ${product.quantity }</p>
          <a href="${pageContext.request.contextPath}/product_detail/${product.id }">View Detail</a>
        </div>
      </c:forEach>
    </div>
  </section>
  <%@ include file="footer.jsp" %>
  <script src="js/scripts.js"></script>
</body>
</html>