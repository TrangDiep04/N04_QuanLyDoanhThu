<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ShopExpense - Product Manager</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f5f7fa, #e0eaff);
            min-height: 100vh;
            padding-top: 20px;
        }
        .container {
            max-width: 1400px;
        }

        .chart-card {
            background: #ffffff;
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 25px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.08);
            display: flex;
            align-items: center;
            justify-content: center;
            flex-wrap: wrap;
        }
        .chart-title {
            font-weight: 600;
            font-size: 1.2rem;
            margin-bottom: 15px;
            color: #333;
            text-align: center;
            width: 100%;
        }
        canvas {
            max-width: 100%;
            max-height: 500px;
            flex: 0 0 65%;
            margin: 0 auto;
            display: block;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.08);
        }
        .card-header {
            background-color: #007bff;
            color: white;
            font-weight: 600;
            border-radius: 15px 15px 0 0;
            font-size: 1.2rem;
        }
        .btn-add {
            background-color: #28a745;
            color: white;
            border-radius: 10px;
            font-weight: 600;
            padding: 8px 12px;
        }
        .btn-action {
            font-size: 0.9rem;
            border-radius: 8px;
            padding: 6px;
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .btn-edit {
            background-color: #ffc107;
            color: #000;
        }
        .btn-delete {
            background-color: #dc3545;
            color: #fff;
        }
        .table th, .table td {
            vertical-align: middle;
            text-align: center;
            color: #000; /* Đảm bảo màu văn bản mặc định là đen */
        }
        .price-cell {
            min-width: 180px;
            display: flex;
            align-items: center;
            gap: 5px;
            white-space: nowrap;
            color: #000; /* Đặt màu văn bản trong cột Price là đen */
        }
        .legend-container {
            flex: 0 0 30%;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 0 15px 15px 0;
            margin-left: 40px;
        }
        .legend-item {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        .legend-color {
            width: 15px;
            height: 15px;
            margin-right: 10px;
            border-radius: 50%;
        }
        .btn-back {
            background-color: #6c757d;
            color: white;
            border-radius: 10px;
            font-weight: 600;
            padding: 8px 12px;
            position: absolute;
            top: 20px;
            left: 20px;
        }
        .btn-back:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
<div class="container mt-4">

    <!-- BIỂU ĐỒ TRÒN VÀ CHÚ THÍCH -->
    <div class="chart-card" style="position: relative;">
        <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-back">
            <i class="fas fa-arrow-left"></i>
        </a>
        <div>
            <div class="chart-title">Tỷ lệ tồn kho các sản phẩm</div>
            <canvas id="stockPieChart"></canvas>
        </div>
        <div class="legend-container">
            <h5 class="text-center mb-3">Chú thích</h5>
            <c:forEach var="product" items="${products}" varStatus="loop">
                <div class="legend-item">
                    <div class="legend-color" style="background-color: ${loop.index < 10 ? ['#007bff', '#28a745', '#ffc107', '#dc3545', '#17a2b8', '#6610f2', '#fd7e14', '#6f42c1', '#20c997', '#e83e8c'][loop.index] : '#ccc'}"></div>
                    <span>${product.name}: ${product.stockQuantity} sản phẩm</span>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- DANH SÁCH SẢN PHẨM -->
    <div class="card">
        <div class="card-header">Product Manager</div>
        <div class="card-body">
            <div class="d-flex justify-content-end mb-3">
                <a href="${pageContext.request.contextPath}/products?action=add" class="btn btn-add">
                    <i class="fas fa-plus"></i>
                </a>
            </div>

            <div class="table-responsive">
                <table class="table table-striped align-middle">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Product Code</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Specifications</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="product" items="${products}">
                        <tr>
                            <td>${product.id}</td>
                            <td>${product.productCode}</td>
                            <td>${product.name}</td>
                            <td>${product.description}</td>
                            <td class="price-cell"><fmt:formatNumber value="${product.price}" type="number" pattern="#,###" /> VND</td>
                            <td>${product.specifications}</td>
                            <td>
                                <div class="d-flex justify-content-center">
                                    <a href="${pageContext.request.contextPath}/products?action=edit&id=${product.id}" class="btn btn-action btn-edit me-2">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/products?action=delete&id=${product.id}" class="btn btn-action btn-delete" onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này?')">
                                        <i class="fas fa-trash"></i>
                                    </a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="pagination justify-content-center">
                <a href="${pageContext.request.contextPath}/products?page=${currentPage - 1}" class="page-link ${currentPage == 1 ? 'disabled' : ''}">Previous</a>
                <span class="page-link">Page ${currentPage} of ${totalPages}</span>
                <a href="${pageContext.request.contextPath}/products?page=${currentPage + 1}" class="page-link ${currentPage == totalPages ? 'disabled' : ''}">Next</a>
            </div>
        </div>
    </div>
</div>

<!-- Script Biểu đồ tròn -->
<script>
    const ctx = document.getElementById('stockPieChart').getContext('2d');
    const stockPieChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: [
                <c:forEach var="product" items="${products}" varStatus="loop">
                    "${product.name}"<c:if test="${!loop.last}">,</c:if>
                </c:forEach>
            ],
            datasets: [{
                data: [
                    <c:forEach var="product" items="${products}" varStatus="loop">
                        ${product.stockQuantity}<c:if test="${!loop.last}">,</c:if>
                    </c:forEach>
                ],
                backgroundColor: [
                    '#007bff', '#28a745', '#ffc107', '#dc3545', '#17a2b8',
                    '#6610f2', '#fd7e14', '#6f42c1', '#20c997', '#e83e8c'
                ],
                borderWidth: 2,
                borderColor: '#fff',
                hoverOffset: 8
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    display: false // Ẩn legend của Chart.js để dùng chú thích tùy chỉnh
                },
                tooltip: {
                    callbacks: {
                        label: function(context) {
                            const label = context.label || '';
                            const value = context.raw || 0;
                            return `${label}: ${value} sản phẩm`;
                        }
                    }
                }
            }
        }
    });
</script>

</body>
</html>