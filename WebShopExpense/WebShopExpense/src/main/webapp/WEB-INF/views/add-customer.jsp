<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShopExpense - Add Customer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #e0eafc 0%, #cfdef3 100%);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 30px 0;
            min-height: 100vh;
        }
        .container {
            max-width: 700px;
            margin: 50px auto;
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            background: #ffffff;
            padding: 25px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .card:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 25px rgba(0, 0, 0, 0.15);
        }
        .title {
            font-size: 2rem;
            font-weight: 700;
            color: #0052cc;
            text-align: center;
            margin-bottom: 30px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        .form-label {
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 8px;
        }
        .form-control {
            border-radius: 8px;
            border: 1px solid #dfe6e9;
            padding: 10px;
            font-size: 0.95rem;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }
        .form-control:focus {
            border-color: #0052cc;
            box-shadow: 0 0 8px rgba(0, 82, 204, 0.2);
            outline: none;
        }
        .btn-primary {
            border-radius: 8px;
            padding: 10px 20px;
            background: linear-gradient(45deg, #0052cc, #00c4ff);
            border: none;
            font-size: 0.95rem;
            font-weight: 600;
            transition: background 0.3s ease, transform 0.2s ease;
            display: block;
            margin: 25px auto 0;
        }
        .btn-primary:hover {
            background: linear-gradient(45deg, #003d99, #0099cc);
            transform: translateY(-2px);
        }
        .btn-outline-secondary {
            position: absolute;
            top: 15px;
            left: 15px;
            border-radius: 50%;
            padding: 8px;
            border: none;
            color: #6c757d;
            font-size: 1.2rem;
            transition: color 0.3s ease, transform 0.2s ease;
            background: transparent;
        }
        .btn-outline-secondary:hover {
            color: #5a6268;
            transform: scale(1.1);
            background: #f8f9fa;
        }
        .alert-danger {
            border-radius: 8px;
            background-color: #ffe6e6;
            color: #a61e2b;
            border: 1px solid #ff9999;
            margin-bottom: 20px;
            padding: 12px;
            font-size: 0.9rem;
        }
        .form-group {
            margin-bottom: 18px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="card shadow">
        <a href="${pageContext.request.contextPath}/customers" class="btn btn-outline-secondary"><i class="bi bi-arrow-left"></i></a>
        <h1 class="title">Add New Customer</h1>
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/customers" method="POST" accept-charset="UTF-8">
                <input type="hidden" name="action" value="add">
                <div class="form-group">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>
                <div class="form-group">
                    <label for="address" class="form-label">Address</label>
                    <input type="text" class="form-control" id="address" name="address">
                </div>
                <div class="form-group">
                    <label for="phone" class="form-label">Phone</label>
                    <input type="text" class="form-control" id="phone" name="phone" required>
                </div>
                <div class="form-group">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <button type="submit" class="btn btn-primary"><i class="bi bi-person-plus me-2"></i>Add Customer</button>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>