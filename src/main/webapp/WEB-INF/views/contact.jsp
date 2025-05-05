<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="/css/HomePages.css">

<style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
      font-family: 'Segoe UI', sans-serif;
    }

    body {
      background: #f4f4f4;
      color: #333;
      padding: 40px;
    }

    header {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      background: #111;
      color: white;
      z-index: 1000;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.3);
    }

    nav {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 1rem 2rem;
      width: 100%;
    }

    .logo {
      font-size: 1.8rem;
      font-weight: bold;
      color: #fff;
    }

    nav ul {
      list-style: none;
      display: flex;
      gap: 2rem;
      margin: 0;
      padding: 0;
    }

    nav ul li a {
      color: white;
      text-decoration: none;
      font-weight: 500;
      transition: all 0.3s ease;
      padding: 0.5rem 1rem;
      border: 2px solid transparent;
      border-radius: 6px;
    }

    nav ul li a:hover {
      color: #ffcc00;
      border-color: #ffcc00;
      background-color: rgba(255, 204, 0, 0.1);
    }

    .contact-container {
      display: grid;
      grid-template-columns: 1fr 1fr;
      background: #fff;
      max-width: 1000px;
      margin: auto;
      margin-top: 100px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
      border-radius: 10px;
      overflow: hidden;
    }

    .contact-form {
      padding: 40px;
    }

    .contact-form h2 {
      margin-bottom: 20px;
      font-size: 28px;
    }

    .contact-form form {
      display: flex;
      flex-direction: column;
    }

    .contact-form label {
      margin: 10px 0 5px;
      font-weight: bold;
    }

    .contact-form input,
    .contact-form textarea {
      padding: 10px;
      font-size: 16px;
      border: 1px solid #ccc;
      border-radius: 5px;
      resize: vertical;
    }

    .contact-form button {
      margin-top: 20px;
      padding: 12px;
      border: none;
      background-color: #0066cc;
      color: white;
      font-size: 16px;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .contact-form button:hover {
      background-color: #0052a3;
    }

    .contact-info {
      background-color: #f0f0f0;
      padding: 40px;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
    }

    .contact-info h3 {
      margin-bottom: 20px;
    }

    .info-item {
      margin-bottom: 15px;
      line-height: 1.5;
    }

    .map {
      width: 100%;
      height: 250px;
      border: none;
      border-radius: 10px;
    }

    @media (max-width: 768px) {
      .contact-container {
        grid-template-columns: 1fr;
      }

      .contact-info {
        padding: 20px;
      }

      .contact-form {
        padding: 20px;
      }
    }
  </style>
</head>
<body>
  <header>
    <nav>
      <div class="logo">ShoesOfNepal</div>
      <ul>
        <li><a href="/">Home</a></li>
        <li><a href="product">Shop</a></li>
        <li><a href="about">About</a></li>
        <li><a href="contact">Contact</a></li>
      </ul>
    </nav>
  </header>

  <div class="contact-container">
    <div class="contact-form">
      <h2>Contact Us</h2>
      <form action="#" method="POST">
        <label for="name">Full Name</label>
        <input type="text" id="name" name="name" required />

        <label for="email">Email Address</label>
        <input type="email" id="email" name="email" required />

        <label for="message">Message</label>
        <textarea id="message" name="message" rows="5" required></textarea>

        <button type="submit">Send Message</button>
      </form>
    </div>

    <div class="contact-info">
      <div>
        <h3>Get in Touch</h3>
        <div class="info-item"><strong>Email:</strong> santoshmahato24818@gmail.com</div>
        <div class="info-item"><strong>Phone:</strong> +977-9812121566</div>
        <div class="info-item"><strong>Address:</strong>Tinkune, Kathmandu, Nepal</div>
      </div>
      <iframe
        class="map"
        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3532.3969999999995!2d85.31944431506193!3d27.70076998279379!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb198f3bcefd1f%3A0xa62f570d5be38232!2sKathmandu!5e0!3m2!1sen!2snp!4v1610787353536"
        allowfullscreen=""
        loading="lazy"
      ></iframe>
    </div>
  </div>
<%@ include file="footer.jsp" %>
</body>
</html>