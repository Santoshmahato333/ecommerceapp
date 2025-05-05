<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>About Us - Shoes Shop</title>
    <link rel="stylesheet" href="/css/HomePages.css"> <!-- Your main CSS file -->
    <style>
        /* Animations */
        @keyframes fadeInUp {
            0% {
                opacity: 0;
                transform: translateY(40px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* About Page Specific Styling */
        .about-hero {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 80vh;
            background-image: url('../images/about-hero.jpg'); /* Make sure this image exists */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            position: relative;
            text-align: center;
            color: white;
            animation: fadeInUp 1.5s ease-out forwards;
        }

        .about-hero-content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
        }

        .about-hero-content h1 {
            font-size: 3rem;
            margin-bottom: 1rem;
            color: #ffcc00;
            animation: fadeInUp 2s ease-out forwards;
        }

        .about-hero-content p {
            font-size: 1.2rem;
            max-width: 700px;
            margin: 0 auto;
            animation: fadeInUp 2.5s ease-out forwards;
        }

        .about-section {
            padding: 4rem 2rem;
            max-width: 1200px;
            margin: 0 auto;
            text-align: center;
        }

        .about-section h2 {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            color: #111;
            animation: fadeInUp 1.2s ease-out forwards;
        }

        .about-section p {
            font-size: 1.1rem;
            color: #555;
            line-height: 1.7;
            animation: fadeInUp 1.4s ease-out forwards;
        }

        .values-section {
            background-color: #f9f9f9;
            padding: 4rem 2rem;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 2rem;
        }

        .value-card {
            background: white;
            width: 300px;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            text-align: center;
            animation: fadeInUp 1.6s ease-out forwards;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .value-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
        }

        .value-card h3 {
            color: #111;
            margin-bottom: 1rem;
        }

        .value-card p {
            color: #555;
        }
    </style>
</head>

<body>

<!-- Top Menu -->
<%@ include file="menu.jsp" %>

<!-- Hero Section -->
<div class="about-hero">
    <div class="about-hero-content">
        <h1>About ShoesShop</h1>
        <p>Step into excellence. Walk with pride.</p>
    </div>
</div>

<!-- About Story Section -->
<section class="about-section">
    <h2>Our Story</h2>
    <p>
        At ShoesShop, we believe that every step tells a story. Founded with a passion for craftsmanship and innovation,
        we bring you shoes that blend comfort, style, and durability. Whether it’s the bustling streets of the city or adventurous trails,
        our collection ensures you always put your best foot forward.
    </p>
</section>

<!-- Our Values Section -->
<section class="values-section">
    <div class="value-card">
        <h3>Quality</h3>
        <p>Only the finest materials and skilled artisans create our shoes.</p>
    </div>
    <div class="value-card">
        <h3>Innovation</h3>
        <p>Blending classic designs with cutting-edge technology for ultimate comfort and style.</p>
    </div>
    <div class="value-card">
        <h3>Customer First</h3>
        <p>Your satisfaction drives everything we do — from concept to delivery.</p>
    </div>
</section>

<!-- Footer -->
<footer>
    &copy; 2025 ShoesShop. All Rights Reserved.
</footer>

</body>
</html>
