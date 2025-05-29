<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SmartZone - Admin Dashboard</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <!-- Font Awesome for additional icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <!-- Google Fonts - Poppins -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            min-height: 100vh;
            background: linear-gradient(135deg, #f5f7fa, #c3cfe2);
        }

        .sidebar {
            width: 250px;
            background: linear-gradient(180deg, #6a11cb, #2575fc);
            color: white;
            position: fixed;
            height: 100%;
            padding-top: 20px;
            box-shadow: 2px 0 8px rgba(0, 0, 0, 0.2);
        }

        .sidebar h2 {
            font-size: 22px;
            text-align: center;
            padding-bottom: 10px;
            margin: 0 20px 20px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }

        .sidebar .nav-link {
            font-size: 16px;
            padding: 12px 30px;
            color: white;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .sidebar .nav-link i {
            margin-right: 10px;
        }

        .sidebar .nav-link:hover {
            background: rgba(255, 255, 255, 0.2);
            padding-left: 40px;
            transform: translateX(5px);
            color: white;
            font-weight: 500;
        }

        .main-content {
            margin-left: 250px;
            padding: 20px;
            min-height: 100vh;
            background: url('https://images.unsplash.com/photo-1516321318423-f06f85e504b3?q=80&w=2070&auto=format&fit=crop') no-repeat center center fixed;
            background-size: cover;
            position: relative;
        }

        .main-content::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.8), rgba(200, 200, 200, 0.6));
            backdrop-filter: blur(5px);
            z-index: 1;
        }

        .main-content .container-fluid {
            position: relative;
            z-index: 2;
        }

        .intro-section {
            text-align: center;
            margin-bottom: 30px;
            animation: fadeIn 1s ease-in-out;
        }

        .intro-section img.logo {
            max-width: 300px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .intro-section .phone-img {
            max-width: 150px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-left: 20px;
            float: right;
        }

        .intro-section h2 {
            font-size: 2.5rem;
            font-weight: 700;
            background: linear-gradient(45deg, #2196f3, #ff6b6b);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        .intro-section p {
            color: #333;
            font-size: 1.2rem;
            line-height: 1.6;
            max-width: 800px;
            margin: 0 auto 20px;
        }

        .intro-section .btn {
            margin-top: 20px;
            background: linear-gradient(45deg, #2196f3, #21cbf3);
            border: none;
            color: white;
            padding: 10px 20px;
            font-size: 1.1rem;
            border-radius: 8px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }

        .intro-section .btn:hover {
            background: linear-gradient(45deg, #21cbf3, #2196f3);
            transform: translateY(-3px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }

        .footer {
            position: fixed;
            bottom: 0;
            width: calc(100% - 250px);
            margin-left: 250px;
            background: linear-gradient(90deg, #ff6b6b, #ff8e53);
            color: white;
            text-align: center;
            padding: 10px 0;
            box-shadow: 0 -2px 4px rgba(0, 0, 0, 0.2);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
<%
    String role = (String) session.getAttribute("role");
    if (session.getAttribute("user") == null || !"ADMIN".equals(role)) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!-- Sidebar -->
<div class="sidebar d-flex flex-column">
    <h2>SmartZone Admin</h2>
    <nav class="nav flex-column">
        <a href="${pageContext.request.contextPath}/products" class="nav-link">
            <i class="bi bi-box-seam"></i> Manage Products
        </a>
        <a href="${pageContext.request.contextPath}/discounts" class="nav-link">
            <i class="bi bi-tag"></i> Manage Discounts
        </a>
        <a href="${pageContext.request.contextPath}/customers" class="nav-link">
            <i class="bi bi-people"></i> Manage Customers
        </a>
        <a href="${pageContext.request.contextPath}/orders" class="nav-link">
            <i class="bi bi-receipt"></i> Manage Orders
        </a>
        <a href="${pageContext.request.contextPath}/revenue" class="nav-link">
            <i class="bi bi-bar-chart-line"></i> Manage Revenue
        </a>
        <a href="${pageContext.request.contextPath}/api/logout" class="nav-link">
            <i class="bi bi-box-arrow-right"></i> Logout
        </a>
    </nav>
</div>

<!-- Main Content -->
<div class="main-content">
    <div class="container-fluid">
        <div class="intro-section">
            <img src="https://insacmau.com/wp-content/uploads/2024/03/logo-dien-thoai-36.jpg" alt="SmartZone Logo" class="img-fluid logo">
            <h2>Welcome to SmartZone Admin Dashboard</h2>

            <p>
                SmartZone là hệ thống quản lý bán hàng điện thoại thông minh hàng đầu, giúp bạn quản lý cửa hàng một cách dễ dàng và hiệu quả.
                Với SmartZone, bạn có thể theo dõi danh mục sản phẩm, tạo chương trình khuyến mãi, quản lý thông tin khách hàng, xử lý đơn hàng,
                và phân tích doanh thu chỉ trong vài cú nhấp chuột. Hãy bắt đầu khám phá các tính năng mạnh mẽ để đưa cửa hàng điện thoại của bạn
                lên một tầm cao mới!
            </p>
            <a href="${pageContext.request.contextPath}/products" class="btn btn-primary">Explore Now</a>
        </div>
    </div>
</div>

<!-- Footer -->
<div class="footer">
    <p>© 2025 SmartZone. All rights reserved. Contact us at support@smartzone.com</p>
</div>

<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>