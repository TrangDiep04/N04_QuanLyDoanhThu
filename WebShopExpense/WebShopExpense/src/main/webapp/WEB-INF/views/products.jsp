<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
            position: relative;
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
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 25px;
        }
        .product-card {
            background: #ffffff;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            padding: 15px;
            transition: all 0.3s ease;
            text-align: center;
            overflow: hidden;
            min-height: 300px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
        }
        .product-image {
            width: 100%;
            height: 150px;
            object-fit: contain;
            border-radius: 10px;
            margin-bottom: 10px;
            background-color: #fff;
            display: block;
        }
        .product-card h5 {
            font-size: 1.1rem;
            color: #333;
            margin-bottom: 10px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        .product-card p {
            color: #6c757d;
            font-size: 0.9rem;
            margin-bottom: 10px;
            flex-grow: 1;
        }
        .price {
            font-size: 1.2rem;
            color: #28a745;
            font-weight: 600;
            margin-bottom: 10px;
        }
        .actions {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 10px;
        }
        .btn-action {
            font-size: 0.9rem;
            border-radius: 8px;
            padding: 6px 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 40px;
        }
        .btn-edit {
            background-color: #ffc107;
            color: #000;
        }
        .btn-edit:hover {
            background-color: #e0a800;
        }
        .btn-delete {
            background-color: #dc3545;
            color: #fff;
        }
        .btn-delete:hover {
            background-color: #c82333;
        }
        .btn-add {
            background-color: #28a745;
            color: white;
            border-radius: 10px;
            font-weight: 600;
            padding: 8px 12px;
        }
        .pagination {
            justify-content: center;
            margin-top: 20px;
        }
        .page-link {
            color: #007bff;
        }
        .page-link:hover {
            background-color: #e9ecef;
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <!-- BIỂU ĐỒ TRÒN VÀ CHÚ THÍCH -->
        <div class="chart-card">
            <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-back">
                <i class="fas fa-arrow-left"></i> Back
            </a>
            <div>
                <div class="chart-title">Tỷ lệ tồn kho các sản phẩm</div>
                <canvas id="stockPieChart"></canvas>
            </div>
            <div class="legend-container">
                <h5 class="text-center mb-3">Chú thích</h5>
                <c:forEach var="product" items="${products}" varStatus="loop">
                    <c:if test="${not empty product.stockQuantity and product.stockQuantity > 0}">
                        <div class="legend-item">
                            <div class="legend-color" style="background-color: ${loop.index < 10 ? ['#007bff', '#28a745', '#ffc107', '#dc3545', '#17a2b8', '#6610f2', '#fd7e14', '#6f42c1', '#20c997', '#e83e8c'][loop.index] : '#ccc'}"></div>
                            <span>${product.name}: ${product.stockQuantity} sản phẩm</span>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>

        <!-- DANH SÁCH SẢN PHẨM -->
        <div class="card">
            <div class="card-header">Product Manager</div>
            <div class="card-body">
                <div class="d-flex justify-content-end mb-3">
                    <a href="${pageContext.request.contextPath}/products?action=add" class="btn btn-add">
                        <i class="fas fa-plus"></i> Add Product
                    </a>
                </div>
                <div class="product-grid">
                    <c:forEach var="product" items="${products}">
                        <c:set var="src" value="${empty product.imageUrl ? 'https://picsum.photos/150' : pageContext.request.contextPath.concat('/proxy?url=').concat(fn:escapeXml(fn:replace(product.imageUrl, '&', '%26')))}" />
                        <div class="product-card">
                            <img src="${src}" alt="${product.name}" class="product-image"
                                 onerror="this.onerror=null; this.src='https://picsum.photos/150';">
                            <h5>${product.name}</h5>
                            <p>${product.description}</p>
                            <div class="price"><fmt:formatNumber value="${product.price}" type="number" pattern="#,###" /> VND</div>
                            <div class="actions">
                                <a href="${pageContext.request.contextPath}/products?action=edit&id=${product.id}" class="btn btn-action btn-edit">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <a href="${pageContext.request.contextPath}/products?action=delete&id=${product.id}" class="btn btn-action btn-delete" onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này?')">
                                    <i class="fas fa-trash"></i>
                                </a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="pagination">
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
        const stockData = {
            labels: [],
            datasets: [{
                data: [],
                backgroundColor: [
                    '#007bff', '#28a745', '#ffc107', '#dc3545', '#17a2b8',
                    '#6610f2', '#fd7e14', '#6f42c1', '#20c997', '#e83e8c'
                ],
                borderWidth: 2,
                borderColor: '#fff',
                hoverOffset: 8
            }]
        };

        <c:forEach var="product" items="${products}" varStatus="loop">
            <c:if test="${not empty product.stockQuantity and product.stockQuantity > 0}">
                stockData.labels.push("${product.name}");
                stockData.datasets[0].data.push(${product.stockQuantity});
            </c:if>
        </c:forEach>

        const stockPieChart = new Chart(ctx, {
            type: 'pie',
            data: stockData,
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        display: false
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