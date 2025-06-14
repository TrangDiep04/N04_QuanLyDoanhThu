package com.trangshop.shopexpense.servlet;
import com.trangshop.shopexpense.model.Order;
import com.trangshop.shopexpense.model.OrderDetail;
import com.trangshop.shopexpense.model.Customer;
import com.trangshop.shopexpense.service.OrderService;
import com.trangshop.shopexpense.service.CustomerService;
import com.trangshop.shopexpense.service.impl.OrderServiceImpl;
import com.trangshop.shopexpense.service.impl.CustomerServiceImpl;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.time.LocalDate;

@WebServlet("/orders")
public class OrderServlet extends HttpServlet {

    private OrderService orderService;
    private CustomerService customerService;

    @Override
    public void init() throws ServletException {
        this.orderService = new OrderServiceImpl();
        this.customerService = new CustomerServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedIn") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "detail":
                int orderId = Integer.parseInt(request.getParameter("id"));
                List<OrderDetail> details = orderService.getOrderDetails(orderId);
                request.setAttribute("orderDetails", details);
                request.getRequestDispatcher("/WEB-INF/views/order-detail.jsp").forward(request, response);
                break;
            case "update":
                orderId = Integer.parseInt(request.getParameter("id"));
                String status = request.getParameter("status");
                try {
                    orderService.updateOrderStatus(orderId, status);
                } catch (IllegalArgumentException e) {
                    request.setAttribute("error", e.getMessage());
                }
                response.sendRedirect(request.getContextPath() + "/orders");
                break;
            case "list":
            default:
                int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
                int pageSize = 10;
                String statusFilter = request.getParameter("status");
                String startDate = request.getParameter("startDate");
                String endDate = request.getParameter("endDate");
                if (startDate == null || endDate == null) {
                    LocalDate now = LocalDate.now();
                    startDate = now.minusMonths(1).toString();
                    endDate = now.toString();
                }

                List<Order> orders = orderService.getOrders(page, pageSize, statusFilter, startDate, endDate);

                // Map customerId to customer name
                Map<Integer, String> customerNames = new HashMap<>();
                for (Order order : orders) {
                    Integer customerId = order.getCustomerId();
                    if (customerId != null && !customerNames.containsKey(customerId)) {
                        Customer customer = customerService.getCustomerById(customerId);
                        customerNames.put(customerId, customer != null ? customer.getName() : "Unknown");
                    }
                }

                int totalPages = orderService.getTotalPages(pageSize, statusFilter, startDate, endDate);
                request.setAttribute("orders", orders);
                request.setAttribute("customerNames", customerNames);
                request.setAttribute("currentPage", page);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("statusFilter", statusFilter);
                request.setAttribute("startDate", startDate);
                request.setAttribute("endDate", endDate);
                request.getRequestDispatcher("/WEB-INF/views/orders.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedIn") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String statusFilter = request.getParameter("status");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        response.sendRedirect(request.getContextPath() + "/orders?status=" + (statusFilter != null ? statusFilter : "") +
                "&startDate=" + (startDate != null ? startDate : "") +
                "&endDate=" + (endDate != null ? endDate : ""));
    }
}
