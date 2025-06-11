<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            min-height: 100vh;
            background: linear-gradient(135deg, #e0eafc 0%, #cfdef3 100%);
            overflow-x: hidden;
        }

        .sidebar {
            width: 260px;
            background: linear-gradient(180deg, #2c3e50, #3498db);
            color: white;
            position: fixed;
            height: 100%;
            padding: 20px 0;
            transition: all 0.3s ease;
        }

        .sidebar h2 {
            font-size: 24px;
            text-align: center;
            padding: 10px;
            margin-bottom: 20px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .sidebar .nav-link {
            font-size: 16px;
            padding: 12px 20px;
            color: white;
            display: flex;
            align-items: center;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .sidebar .nav-link i {
            margin-right: 12px;
            width: 20px;
        }

        .sidebar .nav-link:hover {
            background: rgba(255, 255, 255, 0.15);
            transform: translateX(5px);
            color: #fff;
        }

        .main-content {
            margin-left: 260px;
            padding: 20px 30px;
            min-height: 100vh;
            transition: all 0.3s ease;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding: 10px 0;
            border-bottom: 1px solid #e9ecef;
        }

        .header h2 {
            font-size: 28px;
            color: #2c3e50;
            font-weight: 600;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .card {
            background: white;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            text-align: center;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
        }

        .card h5 {
            font-size: 18px;
            color: #7f8c8d;
            margin-bottom: 10px;
        }

        .card p {
            font-size: 24px;
            font-weight: 600;
            color: #3498db;
        }

        .chart-container {
            background: white;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }

        .footer {
            margin-left: 260px;
            background: #2c3e50;
            color: white;
            text-align: center;
            padding: 15px 0;
            position: relative;
            bottom: 0;
            width: calc(100% - 260px);
        }

        @media (max-width: 768px) {
            .sidebar {
                transform: translateX(-260px);
            }
            .main-content {
                margin-left: 0;
            }
            .footer {
                margin-left: 0;
                width: 100%;
            }
        }
    </style>
</head>
<body>
<%
    if (session.getAttribute("user") == null || !"ADMIN".equals(session.getAttribute("role"))) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!-- Sidebar -->
<div class="sidebar">
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
    <div class="header">
        <h2>Dashboard Overview</h2>
    </div>

    <div class="cards">
        <div class="card">
            <h5>Total Stock</h5>
            <p><c:out value="${totalStock}"/></p>
        </div>
        <div class="card">
            <h5>Total Orders</h5>
            <p><c:out value="${totalOrders}"/></p>
        </div>
        <div class="card">
            <h5>Total Revenue (VND)</h5>
            <p><fmt:formatNumber value="${totalRevenue}" type="number" groupingUsed="true"/></p>
        </div>
    </div>

    <div class="chart-container">
        <canvas id="revenueChart"></canvas>
    </div>
</div>

<!-- Footer -->
<div class="footer">
    <p>© 2025 SmartZone. All rights reserved. Contact us at support@smartzone.com</p>
</div>

<!-- Chart.js Initialization -->
<script>
    const ctx = document.getElementById('revenueChart').getContext('2d');
    const revenueChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: [<c:forEach var="data" items="${revenueByDay}" varStatus="loop">'${data[0]}'<c:if test="${!loop.last}">,</c:if></c:forEach>],
            datasets: [{
                label: 'Revenue (VND)',
                data: [<c:forEach var="data" items="${revenueByDay}" varStatus="loop">${data[1]}<c:if test="${!loop.last}">,</c:if></c:forEach>],
                backgroundColor: 'rgba(52, 152, 219, 0.8)',
                borderColor: 'rgba(52, 152, 219, 1)',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: { callback: value => value.toLocaleString() }
                }
            },
            plugins: {
                legend: { position: 'top' },
                tooltip: { callbacks: { label: context => `${context.label}: ${context.raw.toLocaleString()} VND` } }
            }
        }
    });
</script>

<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>