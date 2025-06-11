<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShopExpense - Revenue Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #E0F2FE 0%, #A7E2FF 100%);
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 1000px;
            padding: 30px 20px; /* Tăng padding tổng để thoáng hơn */
        }
        .dashboard-block {
            background: #FFFFFF;
            border-radius: 10px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            padding: 20px; /* Tăng padding bên trong khối */
            margin-bottom: 30px; /* Tăng khoảng cách dưới khối */
        }
        .header {
            padding: 15px 0;
            margin-bottom: 20px; /* Tăng khoảng cách dưới header */
            display: flex;
            align-items: center;
        }
        .header h1 {
            font-size: 1.8rem;
            color: #6B7280;
            margin: 0;
            font-weight: 600;
            flex-grow: 1;
        }
        .btn-back {
            background: linear-gradient(45deg, #3B82F6, #60A5FA);
            border: none;
            padding: 6px 10px;
            font-weight: 500;
            border-radius: 6px;
            color: #FFFFFF;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 5px;
            transition: background 0.3s ease, transform 0.2s ease;
            margin-right: 15px; /* Tăng khoảng cách với ô input */
        }
        .btn-back:hover {
            background: linear-gradient(45deg, #2563EB, #3B82F6);
            transform: translateY(-2px);
        }
        .btn-back i {
            font-size: 0.9rem;
        }
        .filter-section {
            padding: 15px 0;
            margin-bottom: 25px; /* Tăng khoảng cách dưới filter */
        }
        .form-label {
            font-weight: 500;
            color: #6B7280;
            margin-bottom: 0.5rem;
        }
        .form-control, .form-select {
            border-radius: 6px;
            border: 1px solid #D1D5DB;
            padding: 8px 10px;
            font-size: 0.9rem;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }
        .form-control:focus, .form-select:focus {
            border-color: #3B82F6;
            box-shadow: 0 0 6px rgba(59, 130, 246, 0.2);
            outline: none;
        }
        .btn-filter {
            background: linear-gradient(45deg, #3B82F6, #60A5FA);
            border: none;
            font-weight: 500;
            border-radius: 6px;
            padding: 8px 12px;
            font-size: 0.9rem;
            transition: background 0.3s ease, transform 0.2s ease;
        }
        .btn-filter:hover {
            background: linear-gradient(45deg, #2563EB, #3B82F6);
            transform: translateY(-2px);
        }
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            background: #FFFFFF;
            transition: transform 0.3s ease;
            margin-bottom: 20px; /* Tăng khoảng cách giữa các card con */
        }
        .card:hover {
            transform: translateY(-5px);
        }
        .card-header {
            background: linear-gradient(90deg, #3B82F6, #60A5FA);
            color: #FFFFFF;
            font-weight: 500;
            padding: 12px 15px;
            border-radius: 10px 10px 0 0;
            font-size: 1.2rem;
        }
        .revenue-grid {
            display: grid;
            grid-template-columns: 1fr; /* 1 cột trên mobile */
            gap: 20px; /* Tăng khoảng cách giữa các card con */
            padding: 15px;
        }
        @media (min-width: 768px) {
            .revenue-grid {
                grid-template-columns: 1fr 1fr; /* 2 cột trên tablet */
            }
        }
        @media (min-width: 992px) {
            .revenue-grid {
                grid-template-columns: 1fr 1fr 1fr; /* 3 cột trên desktop */
            }
        }
        .table {
            border-radius: 0 0 10px 10px;
            overflow: hidden;
        }
        .table thead th {
            background: #E0F2FE;
            color: #6B7280;
            font-weight: 500;
            border: none;
        }
        .table tbody tr {
            transition: background 0.3s ease;
        }
        .table tbody tr:hover {
            background: #F1F5F9;
        }
        .table td, .table th {
            vertical-align: middle;
            padding: 10px;
            border-bottom: 1px solid #E5E7EB;
        }
        .btn-export {
            background: linear-gradient(45deg, #10B981, #34D399);
            border: none;
            padding: 8px 15px;
            font-weight: 500;
            border-radius: 6px;
            color: #FFFFFF;
            font-size: 0.9rem;
            transition: background 0.3s ease, transform 0.2s ease;
        }
        .btn-export:hover {
            background: linear-gradient(45deg, #059669, #10B981);
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
<div class="container">
    <div class="dashboard-block">
        <div class="header">
            <a href="${pageContext.request.contextPath}/dashboard" class="btn-back">
                <i class="bi bi-arrow-left"></i> Back
            </a>
            <h1>Revenue Dashboard</h1>
        </div>
        <div class="filter-section">
            <form method="post" action="${pageContext.request.contextPath}/revenue" class="row g-2 align-items-end">
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="startDate" class="form-label">Start Date</label>
                        <input type="date" name="startDate" value="${startDate}" class="form-control" id="startDate" required>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="endDate" class="form-label">End Date</label>
                        <input type="date" name="endDate" value="${endDate}" class="form-control" id="endDate" required>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="timePeriod" class="form-label">Time Period</label>
                        <select name="timePeriod" class="form-select" id="timePeriod">
                            <option value="day" ${param.timePeriod == 'day' ? 'selected' : ''}>By Day</option>
                            <option value="month" ${param.timePeriod == 'month' ? 'selected' : ''}>By Month</option>
                            <option value="year" ${param.timePeriod == 'year' ? 'selected' : ''}>By Year</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-3">
                    <button type="submit" class="btn-filter w-100">Filter</button>
                </div>
            </form>
        </div>
        <div class="card">
            <div class="card-header">Revenue Overview</div>
            <div class="card-body">
                <div class="revenue-grid">
                    <div class="card h-100">
                        <div class="card-header">Revenue by ${param.timePeriod == 'day' ? 'Day' : param.timePeriod == 'month' ? 'Month' : 'Year'}</div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th>Period</th>
                                        <th>Total Revenue</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:choose>
                                        <c:when test="${param.timePeriod == 'day' or empty param.timePeriod}">
                                            <c:forEach var="revenue" items="${revenueByDay}">
                                                <tr>
                                                    <td>${revenue.timePeriod}</td>
                                                    <td><fmt:formatNumber value="${revenue.totalRevenue}" type="number" groupingUsed="true"/> đ</td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:when test="${param.timePeriod == 'month'}">
                                            <c:forEach var="revenue" items="${revenueByMonth}">
                                                <tr>
                                                    <td>${revenue.timePeriod}</td>
                                                    <td><fmt:formatNumber value="${revenue.totalRevenue}" type="number" groupingUsed="true"/> đ</td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:when test="${param.timePeriod == 'year'}">
                                            <c:forEach var="revenue" items="${revenueByYear}">
                                                <tr>
                                                    <td>${revenue.timePeriod}</td>
                                                    <td><fmt:formatNumber value="${revenue.totalRevenue}" type="number" groupingUsed="true"/> đ</td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                    </c:choose>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="card h-100">
                        <div class="card-header">Revenue by Product</div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th>Product Name</th>
                                        <th>Total Revenue</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="revenue" items="${revenueByProduct}">
                                        <tr>
                                            <td>${revenue.productName}</td>
                                            <td><fmt:formatNumber value="${revenue.totalRevenue}" type="number" groupingUsed="true"/> đ</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="card h-100">
                        <div class="card-header">Revenue by Customer</div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th>Customer Name</th>
                                        <th>Total Revenue</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="revenue" items="${revenueByCustomer}">
                                        <tr>
                                            <td>${revenue.customerName}</td>
                                            <td><fmt:formatNumber value="${revenue.totalRevenue}" type="number" groupingUsed="true"/> đ</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="text-end mt-4">
        <a href="${pageContext.request.contextPath}/revenue?action=exportPDF&startDate=${startDate}&endDate=${endDate}" class="btn-export">Export PDF</a>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>