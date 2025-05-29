<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShopExpense - Discount Manager</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
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
        .form-select, .form-control {
            border-radius: 8px;
            border: 1px solid #ced4da;
            transition: border-color 0.3s, box-shadow 0.3s;
        }
        .form-select:focus, .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.3);
        }
        .btn-primary {
            border-radius: 8px;
            padding: 8px 16px;
            background: linear-gradient(45deg, #007bff, #00d4ff);
            border: none;
            font-size: 0.9rem;
        }
        .btn-primary:hover {
            background: linear-gradient(45deg, #0056b3, #0096cc);
        }
        .btn-success {
            border-radius: 8px;
            padding: 8px 16px;
            background: linear-gradient(45deg, #28a745, #46c765);
            border: none;
            font-size: 0.9rem;
        }
        .btn-success:hover {
            background: linear-gradient(45deg, #1e7e34, #3aa755);
        }
        .btn-warning {
            border-radius: 8px;
            padding: 6px 12px;
            background: linear-gradient(45deg, #ffc107, #ffd43b);
            border: none;
            font-size: 0.85rem;
        }
        .btn-warning:hover {
            background: linear-gradient(45deg, #e0a800, #f1c40f);
        }
        .btn-danger {
            border-radius: 8px;
            padding: 6px 12px;
            background: linear-gradient(45deg, #dc3545, #ff6b6b);
            border: none;
            font-size: 0.85rem;
        }
        .btn-danger:hover {
            background: linear-gradient(45deg, #b02a37, #e74c3c);
        }
        .table {
            border-radius: 10px;
            overflow: hidden;
            background: white;
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
        .pagination-controls {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 15px;
        }
        .badge-primary {
            background-color: #007bff;
            font-size: 1rem;
            padding: 8px 12px;
            border-radius: 8px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="text-primary mb-4 text-center">Discount Manager</h1>
    <div class="card shadow mb-4">
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/discounts" method="GET" class="row g-3 align-items-end">
                <div class="col-md-3">
                    <label for="status" class="form-label fw-bold">Status</label>
                    <select class="form-select" id="status" name="status">
                        <option value="">All</option>
                        <option value="ACTIVE" ${statusFilter == 'ACTIVE' ? 'selected' : ''}>Active</option>
                        <option value="EXPIRED" ${statusFilter == 'EXPIRED' ? 'selected' : ''}>Expired</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <button type="submit" class="btn btn-primary btn-sm w-100"><i class="bi bi-funnel me-1"></i>Filter</button>
                </div>
                <div class="col-md-6 text-end">
                    <a href="${pageContext.request.contextPath}/discounts?action=create" class="btn btn-success"><i class="bi bi-plus-circle me-1"></i>Create New Discount</a>
                </div>
            </form>
        </div>
    </div>
    <div class="card shadow">
        <div class="card-body">
            <c:if test="${empty discounts}">
                <div class="alert alert-info text-center">No discounts available for the selected status.</div>
            </c:if>
            <c:if test="${not empty discounts}">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead class="table-primary">
                        <tr>
                            <th>Code</th>
                            <th>Discount Value</th>
                            <th>Type</th>
                            <th>Start Date</th>
                            <th>End Date</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="discount" items="${discounts}">
                            <tr>
                                <td>${discount.code}</td>
                                <td>${discount.discountValue}${discount.discountType == 'PERCENTAGE' ? '%' : '$'}</td>
                                <td>${discount.discountType}</td>
                                <td>${discount.startDate}</td>
                                <td>${discount.endDate}</td>
                                <td>
                                    <span class="badge ${discount.status == 'ACTIVE' ? 'bg-success' : 'bg-danger'}">
                                        ${discount.status}
                                    </span>
                                </td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/discounts?action=edit&id=${discount.id}" class="btn btn-warning btn-sm me-1"><i class="bi bi-pencil"></i> Edit</a>
                                    <a href="${pageContext.request.contextPath}/discounts?action=delete&id=${discount.id}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this discount?')"><i class="bi bi-trash"></i> Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="pagination-controls mt-4">
                    <a href="${pageContext.request.contextPath}/discounts?page=${currentPage - 1}&status=${statusFilter}" class="btn btn-primary btn-sm ${currentPage == 1 ? 'disabled' : ''}"><i class="bi bi-chevron-left me-1"></i>Previous</a>
                    <span class="badge badge-primary">Page ${currentPage} of ${totalPages}</span>
                    <a href="${pageContext.request.contextPath}/discounts?page=${currentPage + 1}&status=${statusFilter}" class="btn btn-primary btn-sm ${currentPage == totalPages ? 'disabled' : ''}">Next<i class="bi bi-chevron-right ms-1"></i></a>
                </div>
            </c:if>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>