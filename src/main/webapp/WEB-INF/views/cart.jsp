<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Cart Page</title>
    <style>
        table {
            width: 80%;
            margin: auto;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border: 1px solid #333;
            text-align: center;
            font-size:bold;
        }
        h1 {
            text-align: center;
        }
        .btn {
            padding: 5px 10px;
            background-color: red;
            color: white;
            border: none;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
        }
        .btn-update {
            background-color: green;
        }
    </style>
</head>
<body>
    <h1>My Cart Page</h1>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Product</th>
                <th>Added Date</th>    
                <th>Quantity</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${cart_list}" var="cart">
            <tr>
                <td>${cart.id}</td>
                <td>${cart.product.name}</td>
                <td>${cart.addedDate}</td>
                <td>
                    <form action="${pageContext.request.contextPath}/user/cart/update/${cart.id}" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        <input type="number" name="quantity" min="1" value="${cart.quantity}">
                        <button type="submit" class="btn btn-update" 
                                <c:if test="${cart.product.quantity le cart.quantity}">disabled</c:if>>Update</button>
                    </form>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/user/cart/delete/${cart.id}" class="btn">Delete</a>
                </td>
            </tr>
        </c:forEach>    
        </tbody>
    </table>
</body>
</html>