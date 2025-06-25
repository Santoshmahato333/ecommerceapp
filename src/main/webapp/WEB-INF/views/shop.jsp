<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Commerce Homepage</title>
    <link rel="stylesheet" href="css/ShopPage.css">
</head>
<body>
    <header>
    	<%@include file="menu.jsp" %>
        <h1>My E-Commerce Store</h1>
    </header>
    
    <section class="hero">
        <h2>Welcome to the Best Shopping Experience!</h2>
        <button id="shopNowBtn">Shop Now</button>
    </section>

	<section>
	<div class="gallery">
	
	<c:forEach items="${popular_products }" var="product">
        <div class="product-card">
            <img src="<c:url value="${product.imageName }"/>" alt="${product.imageName }">
            <div class="card-content">
                <h3 class="card-title">${product.name }</h3>
                <p class="card-description">${product.description }</p>
                <p class="card-details">Price: ${product.price }</p>
                <p class="card-details">Category: ${product.category.name }</p>
                <p class="card-details">Stock: ${product.quantity }</p>
                <div class="card-actions">
                    <a href="<c:url value="/product_detail/${product.id }"/>">View Detail</a>
                    <a href="<c:url value="/user/cart/add/${product.id }"/>" >Add to Cart</a>
                </div>
            </div>
        </div>
       </c:forEach> 
       
        
    </div>
	</section>

    <script src="js/home.js"></script>
</body>
</html>