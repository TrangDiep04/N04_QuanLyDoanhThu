<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShopExpense - Order Detail</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h1 class="text-primary mb-4">Order Detail</h1>
    <div class="card shadow">
        <div class="card-body">
            <h5>Order Details</h5>
            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead class="table-primary">
                    <tr>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th>Unit Price</th>
                        <th>Total</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="detail" items="${orderDetails}">
                        <tr>
                            <td>
                                <c:choose>
                                    <c:when test="${productNames[detail.productId] != null}">
                                        ${productNames[detail.productId]}
                                    </c:when>
                                    <c:otherwise>
                                        ${detail.productId}
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${detail.quantity}</td>
                            <td>
                                <fmt:formatNumber value="${detail.unitPrice}" type="number" groupingUsed="true"/> VND
                            </td>
                            <td>
                                <fmt:formatNumber value="${detail.quantity * detail.unitPrice}" type="number" groupingUsed="true"/> VND
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <a href="${pageContext.request.contextPath}/orders" class="btn btn-secondary mt-3">Back to Orders</a>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>