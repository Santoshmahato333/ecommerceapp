<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Club Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .register-form {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 450px;
        }
        .register-form h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .register-form input[type="text"],
        .register-form input[type="email"],
        .register-form input[type="password"],
        .register-form input[type="tel"],
        .register-form textarea,
        .register-form input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
        .register-form input[type="submit"] {
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
        }
        .register-form input[type="submit"]:hover {
            background-color: #218838;
        }
        .authority-group {
            margin-top: 15px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<%@ include file="menu.jsp" %>

<div class="register-form">
    <h2>Registration</h2>
    <form action="${pageContext.request.contextPath}/register" method="post">
    	
        <input type="hidden" name="${_csrf.parameterName }"
					value="${_csrf.token }">
        <input type="text" name="firstName" placeholder="First Name" required />
        
        <input type="text" name="lastName" placeholder="Last Name" required />
        
        <textarea name="address" placeholder="Full Address" rows="3" required></textarea>
        
        <input type="email" name="email" placeholder="Email Address" required />
        
        <input type="tel" name="phone" placeholder="Phone Number" required />
        
        <input type="text" name="username" placeholder="Username" required />
        
        <input type="password" name="password" placeholder="Password" required />
        
        <input type="password" name="cpassword" placeholder="Confirm Password" required />
        
        <div class="authority-group">
            <label><input type="radio" name="authority" value="ADMIN" required /> Admin</label><br>
            <label><input type="radio" name="authority" value="USER" required /> User</label>
        </div>
        
        <input type="submit" value="Register" />
        
    </form>
</div>

</body>
</html>
