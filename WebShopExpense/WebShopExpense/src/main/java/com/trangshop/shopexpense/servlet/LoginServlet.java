package com.trangshop.shopexpense.servlet;

import com.trangshop.shopexpense.model.User;
import com.trangshop.shopexpense.service.UserService;
import com.trangshop.shopexpense.service.impl.UserServiceImpl;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.io.IOException;

@WebServlet({"/login", ""})
public class LoginServlet extends HttpServlet {
    private UserService userService;

    @Override
    public void init() throws ServletException {
        this.userService = new UserServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        User user = userService.login(username, password);
        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("loggedIn", true);
            session.setAttribute("user", user);
            session.setAttribute("role", user.getRole());
            if ("ADMIN".equals(user.getRole())) {
                resp.sendRedirect(req.getContextPath() + "/dashboard");
            } else {
                req.setAttribute("error", "Access denied. Admin role required!");
                req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, resp);
            }
        } else {
            req.setAttribute("error", "Invalid username or password!");
            req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, resp);
        }
    }
}