<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShopExpense - Edit Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f5f7fa, #e0eaff);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding-top: 20px;
        }
        .container {
            max-width: 600px; /* Giới hạn chiều rộng form */
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            background: white;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15);
        }
        .card-header {
            background: linear-gradient(90deg, #007bff, #00d4ff);
            color: white;
            font-size: 1.5rem;
            font-weight: 600;
            padding: 20px;
            text-align: center;
            border-bottom: none;
        }
        .form-label {
            font-weight: 500;
            color: #333;
            margin-bottom: 8px;
        }
        .form-control {
            border-radius: 10px;
            border: 1px solid #ced4da;
            padding: 12px 15px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }
        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.3);
            outline: none;
        }
        .input-group-text {
            border-radius: 0 10px 10px 0;
            background: #007bff;
            color: white;
            border: none;
            padding: 12px 15px;
        }
        .btn-primary {
            background: linear-gradient(90deg, #007bff, #00d4ff);
            border: none;
            padding: 12px 30px;
            font-weight: 600;
            border-radius: 10px;
            transition: transform 0.3s ease, background 0.3s ease;
        }
        .btn-primary:hover {
            transform: translateY(-2px);
            background: linear-gradient(90deg, #0069d9, #00b4d8);
        }
        .btn-secondary {
            background: #6c757d;
            border: none;
            padding: 12px 30px;
            font-weight: 600;
            border-radius: 10px;
            transition: transform 0.3s ease, background 0.3s ease;
        }
        .btn-secondary:hover {
            transform: translateY(-2px);
            background: #5a6268;
        }
        .d-flex.justify-content-between {
            gap: 15px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .input-group .form-control {
            border-radius: 10px 0 0 10px;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="card shadow">
        <div class="card-header">Edit Product</div>
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/products" method="POST">
                <input type="hidden" name="action" value="edit">
                <input type="hidden" name="id" value="${product.id}">
                <div class="form-group">
                    <label for="productCode" class="form-label">Product Code</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-barcode"></i></span>
                        <input type="text" class="form-control" id="productCode" name="productCode" value="${product.productCode}" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="name" class="form-label">Name</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-tag"></i></span>
                        <input type="text" class="form-control" id="name" name="name" value="${product.name}" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="description" class="form-label">Description</label>
                    <textarea class="form-control" id="description" name="description" rows="3">${product.description}</textarea>
                </div>
                <div class="form-group">
                    <label for="price" class="form-label">Price</label>
                    <div class="input-group">
                        <input type="number" step="0.01" class="form-control" id="price" name="price" value="${product.price}" required>
                        <span class="input-group-text">VND</span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="stockQuantity" class="form-label">Stock Quantity</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-warehouse"></i></span>
                        <input type="number" class="form-control" id="stockQuantity" name="stockQuantity" value="${product.stockQuantity}" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="specifications" class="form-label">Specifications</label>
                    <textarea class="form-control" id="specifications" name="specifications" rows="3">${product.specifications}</textarea>
                </div>
                <div class="form-group">
                    <label for="imageUrl" class="form-label">Image URL</label>
                    <input type="text" class="form-control" id="imageUrl" name="imageUrl" value="${product.imageUrl}" required>
                </div>
                <div class="d-flex justify-content-between">
                    <button type="submit" class="btn btn-primary">Update Product</button>
                    <a href="${pageContext.request.contextPath}/products" class="btn btn-secondary">Cancel</a>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>