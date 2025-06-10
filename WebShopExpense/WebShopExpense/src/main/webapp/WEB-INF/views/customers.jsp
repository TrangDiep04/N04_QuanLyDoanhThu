<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShopExpense - Customer Manager</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 20px 0;
        }
        .container {
            max-width: 1200px;
            margin: 40px auto;
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            background: white;
            padding: 20px;
        }
        .title {
            font-size: 2.5rem;
            font-weight: 700;
            color: #007bff;
            text-align: center;
            margin-bottom: 30px;
            text-transform: uppercase;
            letter-spacing: 1px;
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
        .btn-icon {
            padding: 6px;
            line-height: 1;
        }
        .table {
            border-radius: 10px;
            overflow: hidden;
            background: white;
            margin-top: 20px;
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
            margin-top: 20px;
        }
        .pagination-controls {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 15px;
            margin-top: 20px;
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
    <div class="card shadow">
        <h1 class="title">Customer Manager</h1>
        <div class="card-body">
            <div class="d-flex justify-content-end mb-4">
                <a href="${pageContext.request.contextPath}/customers?action=add" class="btn btn-success"><i class="bi bi-plus-circle me-1"></i>Add New Customer</a>
            </div>
            <c:if test="${empty customers}">
                <div class="alert alert-info text-center">No customers available.</div>
            </c:if>
            <c:if test="${not empty customers}">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead class="table-primary">
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Address</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="customer" items="${customers}">
                            <tr>
                                <td>${customer.id}</td>
                                <td>${customer.name}</td>
                                <td>${customer.address}</td>
                                <td>${customer.phone}</td>
                                <td>${customer.email}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/customers?action=edit&id=${customer.id}" class="btn btn-warning btn-sm btn-icon me-1"><i class="bi bi-pencil"></i></a>
                                    <a href="${pageContext.request.contextPath}/customers?action=delete&id=${customer.id}" class="btn btn-danger btn-sm btn-icon" onclick="return confirm('Are you sure you want to delete this customer?')"><i class="bi bi-trash"></i></a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="pagination-controls">
                    <a href="${pageContext.request.contextPath}/customers?page=${currentPage - 1}" class="btn btn-primary btn-sm ${currentPage == 1 ? 'disabled' : ''}"><i class="bi bi-chevron-left me-1"></i>Previous</a>
                    <span class="badge badge-primary">Page ${currentPage} of ${totalPages}</span>
                    <a href="${pageContext.request.contextPath}/customers?page=${currentPage + 1}" class="btn btn-primary btn-sm ${currentPage == totalPages ? 'disabled' : ''}">Next<i class="bi bi-chevron-right ms-1"></i></a>
                </div>
            </c:if>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>