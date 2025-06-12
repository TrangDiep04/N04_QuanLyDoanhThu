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
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
        }

        body {
            min-height: 100vh;
            background: linear-gradient(135deg, #f0f4f8 0%, #d9e2ec 100%);
            overflow-x: hidden;
        }

        .sidebar {
            width: 260px;
            background: linear-gradient(180deg, #1a2634, #2c5282);
            color: #fff;
            position: fixed;
            height: 100%;
            padding: 20px 0;
            transition: all 0.3s ease;
        }

        .sidebar h2 {
            font-size: 22px;
            font-weight: 600;
            text-align: center;
            padding: 15px;
            margin-bottom: 20px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.15);
        }

        .sidebar .nav-link {
            font-size: 15px;
            font-weight: 500;
            padding: 12px 20px;
            color: #e2e8f0;
            display: flex;
            align-items: center;
            border-radius: 8px;
            margin: 0 10px;
            transition: all 0.3s ease;
        }

        .sidebar .nav-link i {
            margin-right: 12px;
            width: 20px;
        }

        .sidebar .nav-link:hover {
            background: rgba(255, 255, 255, 0.2);
            color: #fff;
            transform: translateX(5px);
        }

        .main-content {
            margin-left: 260px;
            padding: 30px;
            min-height: 100vh;
            transition: all 0.3s ease;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 10px;
            border-bottom: 2px solid #e2e8f0;
        }

        .header h2 {
            font-size: 26px;
            font-weight: 700;
            color: #1a2634;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 20px;
            margin-bottom: 40px;
        }

        .card {
            background: #fff;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            text-align: center;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        }

        .card h5 {
            font-size: 16px;
            font-weight: 500;
            color: #6b7280;
            margin-bottom: 12px;
        }

        .card p {
            font-size: 22px;
            font-weight: 600;
            color: #2c5282;
        }

        .chart-container {
            background: #fff;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            margin-bottom: 40px;
            max-width: 1000px;
            margin-left: auto;
            margin-right: auto;
        }

        .chart-container canvas {
            width: 100% !important;
            height: 400px !important;
        }

        .footer {
            margin-left: 260px;
            background: #1a2634;
            color: #e2e8f0;
            text-align: center;
            padding: 15px 0;
            position: relative;
            width: calc(100% - 260px);
        }

        @media (max-width: 768px) {
            .sidebar {
                transform: translateX(-260px);
            }

            .main-content {
                margin-left: 0;
                padding: 20px;
            }

            .footer {
                margin-left: 0;
                width: 100%;
            }

            .chart-container canvas {
                height: 300px !important;
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
                <i class="bi bi-box-arrow-right"></i>Log out
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
                    borderWidth: 1,
                    hoverBackgroundColor: 'rgba(44, 82, 130, 0.9)'
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                animation: {
                    duration: 1000,
                    easing: 'easeOutQuart'
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: {
                            callback: value => value.toLocaleString()
                        }
                    }
                },
                plugins: {
                    legend: {
                        position: 'top',
                        labels: {
                            font: {
                                size: 14,
                                weight: '500'
                            }
                        }
                    },
                    tooltip: {
                            callbacks: {
                                label: function(context) {
                                    let label = context.dataset.label || '';
                                    if (label) label += ': ';
                                    if (context.parsed.y !== null) {
                                        label += context.parsed.y.toLocaleString() + ' VND';
                                    }
                                    return label;
                                }
                            }
                        }
                }
            }
        });
    </script>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>