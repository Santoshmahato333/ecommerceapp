<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/HomePages.css">
</head>
<body>

    <%@ include file="menu.jsp" %>

    <section class="hero">
        <div class="hero-content">
            <h1>Style That Speaks</h1>
            <p>Discover the latest trends in footwear</p>
            <a href="product" class="btn">Shop Now</a>
        </div>
        <img src="${pageContext.request.contextPath}/images/hero-shoes.jpg" alt="Shoes">
    </section>

    <section class="featured-products">
        <h2>Featured Shoes</h2>
        <div class="product-grid">
            <div class="product-card">
                <img src="${pageContext.request.contextPath}/images/shoes1.avif" alt="Shoe 1">
                <h3>Air Max Pro</h3>
                <p>Price: Rs 120</p>
                <button class="btn">Add to Cart</button>
            </div>
            <div class="product-card">
                <img src="${pageContext.request.contextPath}/images/Shoes2.webp" alt="Shoe 2">
                <h3>Nike Runner</h3>
                <p>Price: Rs 95</p>
                <button class="btn">Add to Cart</button>
            </div>
            <div class="product-card">
                <img src="${pageContext.request.contextPath}/images/Shoes3.webp" alt="Shoe 3">
                <h3>Nike Runner</h3>
                <p>Price: Rs 95</p>
                <button class="btn">Add to Cart</button>
            </div>
            <div class="product-card">
                <img src="${pageContext.request.contextPath}/images/Shoes4.webp" alt="Shoe 4">
                <h3>Nike Runner</h3>
                <p>Price: Rs 95</p>
                <button class="btn">Add to Cart</button>
            </div>
            <div class="product-card">
                <img src="${pageContext.request.contextPath}/images/Shoes5.webp" alt="Shoe 5">
                <h3>Nike Runner</h3>
                <p>Price: Rs 95</p>
                <button class="btn">Add to Cart</button>
            </div>
            <div class="product-card">
                <img src="${pageContext.request.contextPath}/images/Shoes6.webp" alt="Shoe 6">
                <h3>Nike Runner</h3>
                <p>Price: Rs 95</p>
                <button class="btn">Add to Cart</button>
            </div>
        </div>
    </section>

    <%@ include file="footer.jsp" %>

</body>
</html>
