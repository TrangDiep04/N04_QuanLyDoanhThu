package com.trangshop.shopexpense.servlet;


import com.trangshop.shopexpense.model.RevenueByCustomer;
import com.trangshop.shopexpense.model.RevenueByProduct;
import com.trangshop.shopexpense.model.RevenueByTime;
import com.trangshop.shopexpense.service.RevenueService;
import com.trangshop.shopexpense.service.impl.RevenueServiceImpl;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/revenue")
public class RevenueServlet extends HttpServlet {

    private RevenueService revenueService;

    @Override
    public void init() throws ServletException {
        this.revenueService = new RevenueServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedIn") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // kiểm tra vai trò người dung
        // .Nếu không phải "ADMIN", chuyển hướng về /revenue
        String role = (String) session.getAttribute("role");
        if (!"ADMIN".equals(role)) {
            response.sendRedirect(request.getContextPath() + "/revenue");
            return;
        }

        // Lấy khoảng thời gian từ request, nếu không có thì dùng mặc định
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        if (startDate == null || endDate == null) {
            LocalDate now = LocalDate.now();
            startDate = now.minusMonths(1).toString(); // Mặc định 1 tháng trước
            endDate = now.toString(); // Đến hiện tại
        }

        // Lấy dữ liệu doanh thu theo ngày, tháng, năm
        List<RevenueByTime> revenueByDay = revenueService.getRevenueByTime("day", startDate, endDate);
        List<RevenueByTime> revenueByMonth = revenueService.getRevenueByTime("month", startDate, endDate);
        List<RevenueByTime> revenueByYear = revenueService.getRevenueByTime("year", startDate, endDate);

        // Lấy doanh thu theo sản phẩm và khách hàng
        List<RevenueByProduct> revenueByProduct = revenueService.getRevenueByProduct(startDate, endDate);
        List<RevenueByCustomer> revenueByCustomer = revenueService.getRevenueByCustomer(startDate, endDate);

        // Đặt dữ liệu vào request để hiển thị
        request.setAttribute("revenueByDay", revenueByDay);
        request.setAttribute("revenueByMonth", revenueByMonth);
        request.setAttribute("revenueByYear", revenueByYear);
        request.setAttribute("revenueByProduct", revenueByProduct);
        request.setAttribute("revenueByCustomer", revenueByCustomer);
        request.setAttribute("startDate", startDate);
        request.setAttribute("endDate", endDate);

        request.getRequestDispatcher("/WEB-INF/views/revenue.jsp").forward(request, response);
    }

    @Override
    //request.getParameter: Lấy startDate và endDate từ query string (URL) hoặc form.
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        response.sendRedirect(request.getContextPath() + "/revenue?startDate=" + startDate + "&endDate=" + endDate);
    }
}