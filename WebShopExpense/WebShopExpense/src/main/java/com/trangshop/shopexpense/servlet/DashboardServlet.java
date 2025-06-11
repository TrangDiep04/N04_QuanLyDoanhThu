package com.trangshop.shopexpense.servlet;

import com.trangshop.shopexpense.service.DashboardService;
import com.trangshop.shopexpense.service.impl.DashboardServiceImpl;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    private DashboardService dashboardService;

    @Override
    public void init() throws ServletException {
        this.dashboardService = new DashboardServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("loggedIn") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        String role = (String) session.getAttribute("role");
        if (!"ADMIN".equals(role)) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        // Lấy dữ liệu
        int totalStock = dashboardService.getTotalStock();
        int totalOrders = dashboardService.getTotalOrders();
        double totalRevenue = dashboardService.getTotalRevenue();
        List<Object[]> revenueByDay = dashboardService.getRevenueByDay();

        // Đặt thuộc tính cho JSP
        req.setAttribute("totalStock", totalStock);
        req.setAttribute("totalOrders", totalOrders);
        req.setAttribute("totalRevenue", totalRevenue);
        req.setAttribute("revenueByDay", revenueByDay);

        req.getRequestDispatcher("/WEB-INF/views/dashboard.jsp").forward(req, resp);
    }
}