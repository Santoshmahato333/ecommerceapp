<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Orders</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; background: #f6f7fb; }
        .wrap { max-width: 1200px; margin: 0 auto; padding: 32px 20px; }
        table { width: 100%; border-collapse: collapse; background: white; border-radius: 16px; overflow: hidden; box-shadow: 0 12px 30px rgba(0,0,0,.06); }
        th, td { padding: 14px; border-bottom: 1px solid #eee; text-align: left; vertical-align: top; }
        th { background: #111827; color: white; }
    </style>
</head>
<body>
    <%@ include file="admin/header.jsp" %>
    <div class="wrap">
        <h1>All Orders</h1>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>User</th>
                    <th>Date</th>
                    <th>Status</th>
                    <th>Payment</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${all_order}" var="order">
                    <tr>
                        <td>${order.id}</td>
                        <td>${order.userDetail.username}</td>
                        <td>${order.orderDate}</td>
                        <td>${order.status}</td>
                        <td>${order.modeOfPayment}</td>
                        <td>Rs. ${order.amount}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>