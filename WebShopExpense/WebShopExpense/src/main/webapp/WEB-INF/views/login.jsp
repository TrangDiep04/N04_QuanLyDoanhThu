<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, input-scale=1.0">
    <title>Quản lý bán hàng bán điện thoại SmartZone - Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #6b5b95 0%, #ff6f61 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
        }

        .login-card {
            background: #ffffff;
            border-radius: 1.5rem;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            width: 100%;
            max-width: 800px;
            display: flex;
        }

        .image-section {
            width: 40%;
            background: url('https://png.pngtree.com/png-clipart/20240703/original/pngtree-colorful-shapes-inside-a-square-cell-phone-icon-vector-png-image_15475398.png') no-repeat center;
            background-size: contain;
        }

        .form-section {
            width: 60%;
            padding: 2rem;
            text-align: center;
        }

        .logo-container {
            margin-bottom: 1rem;
        }

        .logo-container img {
            width: 90px;
            height: auto;
        }

        .title-container h2 {
            font-size: 1.5rem;
            font-weight: 600;
            color:  #0a2346;
            margin-bottom: 1.5rem;
            text-transform: capitalize;
        }

        .title-container h2 span {
            text-transform: uppercase;
        }

        .form-outline {
            margin-bottom: 1.2rem;
            text-align: left;
            position: relative;
        }

        .form-control {
            border-radius: 0.5rem;
            border: 1px solid #dee2e6;
            padding: 0.75rem 1rem 0.75rem 2.5rem; /* Đảm bảo padding trái đủ để chứa icon */
            font-size: 1rem;
            width: 100%;
            box-sizing: border-box;
            height: 2.5rem; /* Chiều cao cố định */
            line-height: 1.5;
            position: relative; /* Để hỗ trợ căn chỉnh icon */
        }

        .form-control:focus {
            border-color: #1E90FF;
            box-shadow: 0 0 5px rgba(30, 144, 255, 0.3);
            outline: none;
        }

        .form-outline i {
            position: absolute;
            top: 50%;
            left: 0.9rem; /* Điều chỉnh vị trí trái để sát mép hơn */
            transform: translateY(-8%);
            color: #6b5b95;
            font-size: 1.1rem; /* Tăng kích thước icon một chút để nổi bật */
            line-height: 2;
            z-index: 2; /* Đảm bảo icon nằm trên input */
        }

        .btn-login {
            background: linear-gradient(90deg, #1E90FF, #ff6f61);
            border: none;
            border-radius: 0.5rem;
            padding: 0.75rem;
            font-size: 1.1rem;
            font-weight: 500;
            color: #ffffff;
            width: 50%;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(30, 144, 255, 0.4);
        }

        @media (max-width: 768px) {
            .login-card {
                max-width: 100%;
                flex-direction: column;
            }
            .image-section, .form-section {
                width: 100%;
            }
            .image-section {
                height: 200px;
            }
        }
    </style>
</head>
<body>
    <div class="login-card">
        <div class="image-section"></div>
        <div class="form-section">
            <div class="logo-container">
                <img src="https://lh6.googleusercontent.com/proxy/xERFWAH3lL_E22KeKlNIFgkmF6eC8gORdo5roxZnxxWnnq21eShNpR7-t-YwAfGmN7GaZJGhe73Yjik1Ak-sokQk-OcTBataXfFzfDyfzqYxFJ5T3kxLLYDCNl3op-B6k8qlRn5FLW36E73DiOI3ttKRrcRnrCQc3bEeTlPwFJpELjQELOqpkf8foFfDzsajbFjCYGMdbLQf58H7_5oiRw2agWfJkzP_p5BwguAyWSWop2_l3a8ltfZyJU5tFQ" alt="SmartZone Logo">
            </div>
            <div class="title-container">
                <h2>Quản lý bán hàng bán điện thoại SmartZone</h2>
            </div>

            <form action="${pageContext.request.contextPath}/login" method="POST">
                <c:if test="${not empty error}">
                    <div class="alert alert-danger" role="alert">${error}</div>
                </c:if>

                <div class="form-outline mb-3">
                    <i class="fas fa-user"></i>
                    <label class="form-label" for="username">Username</label>
                    <input type="text" id="username" name="username" class="form-control" required />
                </div>

                <div class="form-outline mb-3">
                    <i class="fas fa-lock"></i>
                    <label class="form-label" for="password">Password</label>
                    <input type="password" id="password" name="password" class="form-control" required />
                </div>

                <button type="submit" class="btn-login">Login</button>
            </form>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>