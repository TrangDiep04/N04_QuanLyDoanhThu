<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShopExpense - Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <style>
        /* Căn giữa tiêu đề */
        .title-container {
            text-align: center;
            margin-bottom: 1rem;
        }
        .subtitle-container {
            text-align: center;
            margin-bottom: 2rem;
            letter-spacing: 1px;
        }

        /* Hiệu ứng uốn lượn cho chữ ShopExpense */
        .h1-custom {
            font-size: 3rem; /* Tăng kích thước chữ lớn hơn (từ 2.5rem lên 3rem) */
            font-weight: bold;
            color: #1E90FF; /* Màu xanh giống trong hình */
            display: inline-block;
            letter-spacing: -5px; /* Giảm khoảng cách giữa các ký tự (âm để sát hơn) */
        }
        .h1-custom span {
            display: inline-block;
            animation: wave 2s infinite;
            animation-delay: calc(0.1s * var(--i)); /* Tạo độ trễ cho từng chữ cái */
        }
        @keyframes wave {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); } /* Chuyển động lên xuống tạo sóng */
        }

        /* Tùy chỉnh ô input đẹp hơn */
        .form-outline {
            margin-bottom: 1.5rem;
        }
        .form-control {
            border-radius: 10px; /* Bo góc */
            border: 2px solid #6b5b95; /* Màu border đặc sắc */
            padding: 0.75rem;
            font-size: 1rem;
            transition: all 0.3s ease; /* Hiệu ứng mượt mà */
        }
        .form-control:focus {
            border-color: #ff6f61; /* Thay đổi màu border khi focus */
            box-shadow: 0 0 10px rgba(255, 111, 97, 0.5); /* Hiệu ứng glow */
            outline: none; /* Loại bỏ outline mặc định */
        }
        .form-control:hover {
            border-color: #88b04b; /* Thay đổi màu border khi hover */
            background-color: #f9f9f9; /* Nhẹ nhàng đổi màu nền */
        }

        /* Tùy chỉnh nút Login */
        .btn-custom {
            background-color: #343a40; /* Giữ màu đen như ban đầu */
            border: none;
            border-radius: 10px;
            padding: 0.75rem;
            font-size: 1.1rem;
            transition: all 0.3s ease;
        }
        .btn-custom:hover {
            background-color: #23272b; /* Tối hơn khi hover */
            transform: scale(1.05); /* Phóng to nhẹ */
        }
    </style>
</head>
<body>
<section class="vh-100" style="background-color: #9A616D;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col col-xl-10">
        <div class="card" style="border-radius: 1rem;">
          <div class="row g-0">
            <div class="col-md-6 col-lg-5 d-none d-md-block">
              <img src="https://png.pngtree.com/png-clipart/20240703/original/pngtree-colorful-shapes-inside-a-square-cell-phone-icon-vector-png-image_15475398.png"
                alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />
            </div>
            <div class="col-md-6 col-lg-7 d-flex align-items-center">
              <div class="card-body p-4 p-lg-5 text-black">

                <form action="${pageContext.request.contextPath}/login" method="POST">

                  <div class="title-container">
                    <span class="h1-custom">
                        <span style="--i:1">S</span>
                        <span style="--i:2">h</span>
                        <span style="--i:3">o</span>
                        <span style="--i:4">p</span>
                        <span style="--i:5">E</span>
                        <span style="--i:6">x</span>
                        <span style="--i:7">p</span>
                        <span style="--i:8">e</span>
                        <span style="--i:9">n</span>
                        <span style="--i:10">s</span>
                        <span style="--i:11">e</span>
                    </span>
                  </div>

                  <div class="subtitle-container">
                    <h5 class="fw-normal mb-3 pb-3">Sign into your account</h5>
                  </div>

                  <c:if test="${not empty error}">
                    <div class="alert alert-danger" role="alert">${error}</div>
                  </c:if>

                  <div class="form-outline mb-4">
                    <label class="form-label" for="username">Username</label>
                    <input type="text" id="username" name="username" class="form-control form-control-lg" required />
                  </div>

                  <div class="form-outline mb-4">
                    <label class="form-label" for="password">Password</label>
                    <input type="password" id="password" name="password" class="form-control form-control-lg" required />
                  </div>

                  <div class="pt-1 mb-4">
                    <button class="btn btn-dark btn-lg btn-block w-100 btn-custom" type="submit">Login</button>
                  </div>

                </form>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>