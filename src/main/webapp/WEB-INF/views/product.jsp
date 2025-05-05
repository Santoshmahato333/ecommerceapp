<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <div class="filters">
      <label>Category:</label>
      <select id="categoryFilter">
        <option value="all">All</option>
        <option value="men">Men</option>
        <option value="women">Women</option>
      </select>
    </div>
    
    <div class="product-grid" id="productList">
        
      <!-- Product cards will be rendered here -->
    </div>
  </section>
  <%@ include file="footer.jsp" %>
  <script src="js/scripts.js"></script>
</body>
</html>