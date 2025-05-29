<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShopExpense - Revenue Manager</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
    <style>
        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .container {
            max-width: 1200px;
            margin-top: 40px;
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }
        .card:hover {
            transform: translateY(-5px);
        }
        .nav-tabs {
            border-bottom: 2px solid #007bff;
        }
        .nav-tabs .nav-link {
            border-radius: 10px 10px 0 0;
            padding: 12px 20px;
            font-weight: 500;
            color: #333;
        }
        .nav-tabs .nav-link.active {
            background-color: #007bff;
            color: white;
        }
        .form-control {
            border-radius: 8px;
            border: 1px solid #ced4da;
            transition: border-color 0.3s, box-shadow 0.3s;
        }
        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.3);
        }
        .btn-primary {
            border-radius: 8px;
            padding: 8px 16px; /* Thu nhỏ padding */
            background: linear-gradient(45deg, #28a745, #46c765); /* Màu xanh lá cây */
            border: none;
            font-size: 0.9rem; /* Thu nhỏ font */
        }
        .btn-primary:hover {
            background: linear-gradient(45deg, #1e7e34, #3aa755); /* Hover xanh lá đậm hơn */
        }
        .table {
            border-radius: 10px;
            overflow: hidden;
        }
        .table thead th {
            background-color: #007bff;
            color: white;
        }
        .table tbody tr:hover {
            background-color: #f1f3f5;
        }
        .alert-info {
            border-radius: 8px;
            background-color: #e7f3ff;
            color: #004085;
            border-color: #b8daff;
        }
        .chart-container {
            position: relative;
            max-width: 600px;
            margin: 20px auto;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="text-primary mb-4 text-center">Revenue Manager</h1>
    <div class="card shadow mb-4">
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/revenue" method="POST" class="row g-3">
                <div class="col-md-5">
                    <label for="startDate" class="form-label fw-bold">Start Date</label>
                    <input type="date" class="form-control" id="startDate" name="startDate" value="${startDate}" required>
                </div>
                <div class="col-md-5">
                    <label for="endDate" class="form-label fw-bold">End Date</label>
                    <input type="date" class="form-control" id="endDate" name="endDate" value="${endDate}" required>
                </div>
                <div class="col-md-2 d-flex align-items-end">
                    <button type="submit" class="btn btn-primary btn-sm w-100">Filter</button> <!-- Thêm btn-sm -->
                </div>
            </form>
        </div>
    </div>

    <ul class="nav nav-tabs mb-4" id="revenueTab" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active" id="by-time-tab" data-bs-toggle="tab" data-bs-target="#by-time" type="button" role="tab">By Time</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="by-product-tab" data-bs-toggle="tab" data-bs-target="#by-product" type="button" role="tab">By Product</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="by-customer-tab" data-bs-toggle="tab" data-bs-target="#by-customer" type="button" role="tab">By Customer</button>
        </li>
    </ul>

    <div class="tab-content" id="revenueTabContent">
        <div class="tab-pane fade show active" id="by-time" role="tabpanel">
            <div class="card shadow">
                <div class="card-body">
                    <h3 class="text-primary">Revenue by Time</h3>
                    <!-- Chart for Revenue by Day -->
                    <c:if test="${not empty revenueByDay}">
                        <div class="chart-container">
                            <canvas id="revenueByDayChart"></canvas>
                        </div>
                    </c:if>
                    <h5>By Day</h5>
                    <c:if test="${empty revenueByDay}">
                        <div class="alert alert-info">No revenue data available for this period.</div>
                    </c:if>
                    <c:if test="${not empty revenueByDay}">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead class="table-primary">
                                <tr>
                                    <th>Date</th>
                                    <th>Total Revenue</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="revenue" items="${revenueByDay}">
                                    <tr>
                                        <td>${revenue.timePeriod}</td>
                                        <td>$${revenue.totalRevenue}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:if>
                    <h5>By Month</h5>
                    <c:if test="${empty revenueByMonth}">
                        <div class="alert alert-info">No revenue data available for this period.</div>
                    </c:if>
                    <c:if test="${not empty revenueByMonth}">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead class="table-primary">
                                <tr>
                                    <th>Month</th>
                                    <th>Total Revenue</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="revenue" items="${revenueByMonth}">
                                    <tr>
                                        <td>${revenue.timePeriod}</td>
                                        <td>$${revenue.totalRevenue}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:if>
                    <h5>By Year</h5>
                    <c:if test="${empty revenueByYear}">
                        <div class="alert alert-info">No revenue data available for this period.</div>
                    </c:if>
                    <c:if test="${not empty revenueByYear}">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead class="table-primary">
                                <tr>
                                    <th>Year</th>
                                    <th>Total Revenue</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="revenue" items="${revenueByYear}">
                                    <tr>
                                        <td>${revenue.timePeriod}</td>
                                        <td>$${revenue.totalRevenue}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="by-product" role="tabpanel">
            <div class="card shadow">
                <div class="card-body">
                    <h3 class="text-primary">Revenue by Product</h3>
                    <!-- Chart for Revenue by Product -->
                    <c:if test="${not empty revenueByProduct}">
                        <div class="chart-container">
                            <canvas id="revenueByProductChart"></canvas>
                        </div>
                    </c:if>
                    <c:if test="${empty revenueByProduct}">
                        <div class="alert alert-info">No revenue data available for this period.</div>
                    </c:if>
                    <c:if test="${not empty revenueByProduct}">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead class="table-primary">
                                <tr>
                                    <th>Product Name</th>
                                    <th>Total Revenue</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="revenue" items="${revenueByProduct}">
                                    <tr>
                                        <td>${revenue.productName}</td>
                                        <td>$${revenue.totalRevenue}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="by-customer" role="tabpanel">
            <div class="card shadow">
                <div class="card-body">
                    <h3 class="text-primary">Revenue by Customer</h3>
                    <c:if test="${empty revenueByCustomer}">
                        <div class="alert alert-info">No revenue data available for this period.</div>
                    </c:if>
                    <c:if test="${not empty revenueByCustomer}">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead class="table-primary">
                                <tr>
                                    <th>Customer Name</th>
                                    <th>Total Revenue</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="revenue" items="${revenueByCustomer}">
                                    <tr>
                                        <td>${revenue.customerName}</td>
                                        <td>$${revenue.totalRevenue}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Chart for Revenue by Day (Bar Chart)
    <c:if test="${not empty revenueByDay}">
        const dayLabels = [
            <c:forEach var="revenue" items="${revenueByDay}" varStatus="loop">
                "${revenue.timePeriod}"<c:if test="${!loop.last}">,</c:if>
            </c:forEach>
        ];
        const dayData = [
            <c:forEach var="revenue" items="${revenueByDay}" varStatus="loop">
                ${revenue.totalRevenue}<c:if test="${!loop.last}">,</c:if>
            </c:forEach>
        ];
        new Chart(document.getElementById('revenueByDayChart'), {
            type: 'bar',
            data: {
                labels: dayLabels,
                datasets: [{
                    label: 'Revenue by Day ($)',
                    data: dayData,
                    backgroundColor: 'rgba(0, 123, 255, 0.6)',
                    borderColor: 'rgba(0, 123, 255, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true,
                        title: { display: true, text: 'Revenue ($)' }
                    },
                    x: {
                        title: { display: true, text: 'Date' }
                    }
                },
                plugins: {
                    legend: { display: true, position: 'top' },
                    title: { display: true, text: 'Daily Revenue', font: { size: 16 } }
                }
            }
        });
    </c:if>

    // Chart for Revenue by Product (Pie Chart)
    <c:if test="${not empty revenueByProduct}">
        const productLabels = [
            <c:forEach var="revenue" items="${revenueByProduct}" varStatus="loop">
                "${revenue.productName}"<c:if test="${!loop.last}">,</c:if>
            </c:forEach>
        ];
        const productData = [
            <c:forEach var="revenue" items="${revenueByProduct}" varStatus="loop">
                ${revenue.totalRevenue}<c:if test="${!loop.last}">,</c:if>
            </c:forEach>
        ];
        new Chart(document.getElementById('revenueByProductChart'), {
            type: 'pie',
            data: {
                labels: productLabels,
                datasets: [{
                    label: 'Revenue by Product ($)',
                    data: productData,
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.6)',
                        'rgba(54, 162, 235, 0.6)',
                        'rgba(255, 206, 86, 0.6)',
                        'rgba(75, 192, 192, 0.6)',
                        'rgba(153, 102, 255, 0.6)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: { display: true, position: 'top' },
                    title: { display: true, text: 'Revenue by Product', font: { size: 16 } }
                }
            }
        });
    </c:if>
</script>
</body>
</html>