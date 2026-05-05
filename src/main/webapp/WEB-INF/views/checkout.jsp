<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Checkout</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f5f7fb; margin: 0; }
        .wrap { max-width: 1000px; margin: 0 auto; padding: 32px 20px; }
        .panel { background: white; border-radius: 20px; box-shadow: 0 16px 45px rgba(0,0,0,.08); padding: 24px; }
        .item { display: flex; justify-content: space-between; padding: 12px 0; border-bottom: 1px solid #eee; }
        .actions { margin-top: 20px; display: flex; gap: 12px; }
        .btn { padding: 12px 18px; border: 0; border-radius: 999px; cursor: pointer; text-decoration: none; display: inline-block; }
        .primary { background: #111827; color: white; }
        .ghost { background: #e5e7eb; color: #111827; }
    </style>
</head>
<body>
    <%@ include file="menu.jsp" %>
    <div class="wrap">
        <div class="panel">
            <h1>Checkout</h1>
            <c:forEach items="${cart_list}" var="cart">
                <div class="item">
                    <div>
                        <strong>${cart.product.name}</strong><br>
                        Qty: ${cart.quantity}
                    </div>
                    <div>Rs. ${(cart.product.price - cart.product.discount) * cart.quantity}</div>
                </div>
            </c:forEach>
            <h2>Total: Rs. ${order_total}</h2>
            <div class="actions">
                <form action="${pageContext.request.contextPath}/user/order/add" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                    <input type="hidden" name="payment_mode" value="cod">
                    <button type="submit" class="btn primary">Place Order</button>
                </form>
                <a href="${pageContext.request.contextPath}/user/cart/show" class="btn ghost">Back to Cart</a>
            </div>
        </div>
    </div>
</body>
</html>