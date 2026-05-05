<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${product.name}</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; background: #f6f7fb; }
        .wrap { max-width: 1100px; margin: 0 auto; padding: 32px 20px; }
        .card { background: white; border-radius: 20px; box-shadow: 0 16px 45px rgba(0,0,0,.08); padding: 24px; display: grid; grid-template-columns: 1fr 1.1fr; gap: 24px; }
        .card img { width: 100%; height: 420px; object-fit: cover; border-radius: 16px; }
        .price { font-size: 1.6rem; font-weight: 700; }
        .meta { color: #555; margin: 6px 0; }
        .actions a { display: inline-block; margin-right: 12px; padding: 12px 18px; border-radius: 999px; text-decoration: none; }
        .primary { background: #111827; color: #fff; }
        .secondary { background: #e5e7eb; color: #111827; }
        .related { margin-top: 30px; }
        .related-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(220px, 1fr)); gap: 16px; }
        .related-item { background: white; border-radius: 16px; padding: 14px; box-shadow: 0 10px 30px rgba(0,0,0,.06); }
        .related-item img { width: 100%; height: 150px; object-fit: cover; border-radius: 12px; }
    </style>
</head>
<body>
    <%@ include file="menu.jsp" %>
    <div class="wrap">
        <div class="card">
            <div>
                <img src="${pageContext.request.contextPath}/images/${product.imageName}" alt="${product.name}">
            </div>
            <div>
                <h1>${product.name}</h1>
                <p class="meta">${product.category.name}</p>
                <p>${product.description}</p>
                <p class="price">Rs. ${product.price}</p>
                <p class="meta">Discount: ${product.discount}</p>
                <p class="meta">Stock: ${product.quantity}</p>
                <p class="meta">Tags: ${product.tags}</p>
                <div class="actions">
                    <a class="primary" href="${pageContext.request.contextPath}/user/cart/add/${product.id}">Add to Cart</a>
                    <a class="secondary" href="${pageContext.request.contextPath}/shop">Back to Shop</a>
                </div>
            </div>
        </div>

        <div class="related">
            <h2>Related Products</h2>
            <div class="related-grid">
                <c:forEach items="${related_products}" var="item">
                    <div class="related-item">
                        <img src="${pageContext.request.contextPath}/images/${item.imageName}" alt="${item.name}">
                        <h3>${item.name}</h3>
                        <p>Rs. ${item.price}</p>
                        <a href="${pageContext.request.contextPath}/product_detail/${item.id}">View Detail</a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>