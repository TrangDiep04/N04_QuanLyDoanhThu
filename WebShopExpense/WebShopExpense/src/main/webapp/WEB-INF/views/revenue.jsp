<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShopExpense - Revenue Manager</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; font-family: Arial, sans-serif; }
        .container { max-width: 1200px; margin: 20px auto; padding: 20px; }
        .card { border: none; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); }
        .card-header { background-color: #007bff; color: white; border-radius: 10px 10px 0 0; }
    </style>
</head>
<body>
<div class="container">
    <h2 class="text-center mb-4" style="color: #007bff;">Doanh thu</h2>
    <form method="post" action="${pageContext.request.contextPath}/revenue">
        <div class="row mb-3">
            <div class="col-md-5">
                <input type="date" name="startDate" value="${startDate}" class="form-control" required>
            </div>
            <div class="col-md-5">
                <input type="date" name="endDate" value="${endDate}" class="form-control" required>
            </div>
            <div class="col-md-2">
                <button type="submit" class="btn btn-primary w-100">Lọc</button>
            </div>
        </div>
    </form>
    <div class="card mt-4">
        <div class="card-header">Doanh thu theo ngày</div>
        <div class="card-body">
            <c:forEach var="revenue" items="${revenueByDay}">
                <p>${revenue.timePeriod}: <fmt:formatNumber value="${revenue.totalRevenue}" type="number" groupingUsed="true"/> đ</p>
            </c:forEach>
        </div>
    </div>
    <div class="card mt-4">
        <div class="card-header">Doanh thu theo tháng</div>
        <div class="card-body">
            <c:forEach var="revenue" items="${revenueByMonth}">
                <p>${revenue.timePeriod}: <fmt:formatNumber value="${revenue.totalRevenue}" type="number" groupingUsed="true"/> đ</p>
            </c:forEach>
        </div>
    </div>
    <div class="card mt-4">
        <div class="card-header">Doanh thu theo năm</div>
        <div class="card-body">
            <c:forEach var="revenue" items="${revenueByYear}">
                <p>${revenue.timePeriod}: <fmt:formatNumber value="${revenue.totalRevenue}" type="number" groupingUsed="true"/> đ</p>
            </c:forEach>
        </div>
    </div>
    <div class="card mt-4">
        <div class="card-header">Doanh thu theo sản phẩm</div>
        <div class="card-body">
            <c:forEach var="revenue" items="${revenueByProduct}">
                <p>${revenue.productName}: <fmt:formatNumber value="${revenue.totalRevenue}" type="number" groupingUsed="true"/> đ</p>
            </c:forEach>
        </div>
    </div>
    <div class="card mt-4">
        <div class="card-header">Doanh thu theo khách hàng</div>
        <div class="card-body">
            <c:forEach var="revenue" items="${revenueByCustomer}">
                <p>${revenue.customerName}: <fmt:formatNumber value="${revenue.totalRevenue}" type="number" groupingUsed="true"/> đ</p>
            </c:forEach>
        </div>
    </div>
    <a href="${pageContext.request.contextPath}/revenue?action=exportPDF&startDate=${startDate}&endDate=${endDate}" class="btn btn-success mt-3">Xuất PDF</a>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>