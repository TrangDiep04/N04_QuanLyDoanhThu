<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShopExpense - Customer Manager</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #f9fbfd 0%, #e0e7f0 100%);
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            padding: 0;
            margin: 0;
        }
        .container {
            max-width: 1300px;
            padding: 40px 20px;
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.05);
            background: #ffffff;
            overflow: hidden;
            position: relative;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .card:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            background: linear-gradient(90deg, #4a90e2, #63b3ed);
            color: #ffffff;
            font-weight: 500;
            font-size: 1.4rem;
            padding: 15px 20px;
            border-bottom: none;
            text-transform: capitalize;
            letter-spacing: 0.5px;
        }
        .btn-back {
            position: absolute;
            top: 15px;
            left: 20px;
            background: linear-gradient(45deg, #4a90e2, #63b3ed);
            border: none;
            padding: 8px 15px;
            font-weight: 500;
            border-radius: 8px;
            color: #ffffff;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 5px;
            transition: background 0.3s ease, transform 0.2s ease;
        }
        .btn-back:hover {
            background: linear-gradient(45deg, #357abd, #4dabf5);
            transform: translateY(-2px);
        }
        .btn-back i {
            font-size: 1rem;
        }
        .form-group {
            margin-bottom: 1.5rem;
        }
        .form-label {
            font-weight: 500;
            color: #444;
            margin-bottom: 0.5rem;
        }
        .btn-primary {
            background: linear-gradient(45deg, #4a90e2, #63b3ed);
            border: none;
            padding: 10px 20px;
            font-weight: 500;
            border-radius: 8px;
            transition: background 0.3s ease, transform 0.2s ease;
        }
        .btn-primary:hover {
            background: linear-gradient(45deg, #357abd, #4dabf5);
            transform: translateY(-2px);
        }
        .btn-success {
            background: linear-gradient(45deg, #2ecc71, #27ae60);
            border: none;
            padding: 10px 20px;
            font-weight: 500;
            border-radius: 8px;
            transition: background 0.3s ease, transform 0.2s ease;
        }
        .btn-success:hover {
            background: linear-gradient(45deg, #27ae60, #219653);
            transform: translateY(-2px);
        }
        .btn-warning {
            background: linear-gradient(45deg, #f1c40f, #f39c12);
            border: none;
            padding: 8px 15px;
            font-weight: 500;
            border-radius: 8px;
            transition: background 0.3s ease, transform 0.2s ease;
        }
        .btn-warning:hover {
            background: linear-gradient(45deg, #d4a017, #e08e0b);
            transform: translateY(-2px);
        }
        .btn-danger {
            background: linear-gradient(45deg, #e74c3c, #c0392b);
            border: none;
            padding: 8px 15px;
            font-weight: 500;
            border-radius: 8px;
            transition: background 0.3s ease, transform 0.2s ease;
        }
        .btn-danger:hover {
            background: linear-gradient(45deg, #c0392b, #a93226);
            transform: translateY(-2px);
        }
        .btn-icon {
            padding: 6px 8px;
            line-height: 1;
            transition: transform 0.2s ease;
        }
        .btn-icon:hover {
            transform: translateY(-1px);
        }
        .table {
            border-radius: 10px;
            overflow: hidden;
            background: #ffffff;
        }
        .table thead th {
            background: linear-gradient(90deg, #4a90e2, #63b3ed);
            color: #ffffff;
            font-weight: 500;
            border: none;
        }
        .table tbody tr {
            transition: background 0.3s ease;
        }
        .table tbody tr:hover {
            background: #f8fafc;
        }
        .table td, .table th {
            vertical-align: middle;
            padding: 12px;
            border-bottom: 1px solid #eef2f7;
        }
        .alert-info {
            border-radius: 8px;
            background-color: #e6f0fa;
            color: #2c5282;
            border: 1px solid #b8d2f0;
            padding: 12px;
            margin-top: 20px;
            font-size: 0.95rem;
            text-align: center;
        }
        .pagination-controls {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            margin-top: 25px;
        }
        .page-link {
            color: #4a90e2;
            border: 1px solid #e0e7ff;
            border-radius: 8px;
            padding: 8px 14px;
            font-weight: 500;
            transition: background 0.3s ease, color 0.3s ease, border-color 0.3s ease;
        }
        .page-link:hover, .page-link.active {
            background: #4a90e2;
            color: #ffffff;
            border-color: #4a90e2;
        }
        .page-link.disabled {
            color: #a0aec0;
            background: #edf2f7;
            border-color: #edf2f7;
            cursor: not-allowed;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="card shadow-sm">
        <a href="${pageContext.request.contextPath}/dashboard" class="btn-back">
            <i class="bi bi-arrow-left"></i> Back
        </a>
        <div class="card-header text-center">
            <h1 class="title mb-0">Customer Manager</h1>
        </div>
        <div class="card-body">
            <div class="d-flex justify-content-end mb-4">
                <a href="${pageContext.request.contextPath}/customers?action=add" class="btn btn-success"><i class="bi bi-plus-circle me-2"></i>Add New Customer</a>
            </div>
            <c:if test="${empty customers}">
                <div class="alert alert-info">No customers available. Please add a new customer.</div>
            </c:if>
            <c:if test="${not empty customers}">
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
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
                                    <a href="${pageContext.request.contextPath}/customers?action=edit&id=${customer.id}" class="btn btn-warning btn-sm btn-icon me-2">
                                        <i class="bi bi-pencil"></i>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/customers?action=delete&id=${customer.id}" class="btn btn-danger btn-sm btn-icon" onclick="return confirm('Are you sure you want to delete this customer?')">
                                        <i class="bi bi-trash"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="pagination-controls">
                    <a href="${pageContext.request.contextPath}/customers?page=${currentPage - 1}" class="page-link ${currentPage == 1 ? 'disabled' : ''}">
                        <i class="bi bi-chevron-left"></i> Previous
                    </a>
                    <span class="badge bg-primary">Page ${currentPage} of ${totalPages}</span>
                    <a href="${pageContext.request.contextPath}/customers?page=${currentPage + 1}" class="page-link ${currentPage == totalPages ? 'disabled' : ''}">
                        Next <i class="bi bi-chevron-right"></i>
                    </a>
                </div>
            </c:if>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>