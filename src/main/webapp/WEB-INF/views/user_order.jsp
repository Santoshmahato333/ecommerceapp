<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Orders</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; background: #f6f7fb; }
        .wrap { max-width: 1100px; margin: 0 auto; padding: 32px 20px; }
        table { width: 100%; border-collapse: collapse; background: white; border-radius: 16px; overflow: hidden; box-shadow: 0 12px 30px rgba(0,0,0,.06); }
        th, td { padding: 14px; border-bottom: 1px solid #eee; text-align: left; }
        th { background: #111827; color: white; }
    </style>
</head>
<body>
    <%@ include file="menu.jsp" %>
    <div class="wrap">
        <h1>My Orders</h1>
        <table>
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Date</th>
                    <th>Status</th>
                    <th>Payment</th>
                    <th>Total</th>
                    <th>Items</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${userOrder}" var="order">
                    <tr>
                        <td>${order.id}</td>
                        <td>${order.orderDate}</td>
                        <td>${order.status}</td>
                        <td>${order.modeOfPayment}</td>
                        <td>Rs. ${order.amount}</td>
                        <td>
                            <c:forEach items="${order.orderedProducts}" var="item" varStatus="loop">
                                ${item.product.name} x ${item.quantity}<c:if test="${!loop.last}">,<br></c:if>
                            </c:forEach>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>