package com.trangshop.shopexpense.servlet;

import com.trangshop.shopexpense.model.Product;
import com.trangshop.shopexpense.service.ProductService;
import com.trangshop.shopexpense.service.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {

    private ProductService productService;

    @Override
    public void init() throws ServletException {
        this.productService = new ProductServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedIn") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        try {
            switch (action) {
                case "add":
                    request.getRequestDispatcher("/WEB-INF/views/add-product.jsp").forward(request, response);
                    break;
                case "edit":
                    int id = Integer.parseInt(request.getParameter("id"));
                    Product product = productService.getProductById(id);
                    if (product == null) {
                        throw new ServletException("Product not found with id: " + id);
                    }
                    request.setAttribute("product", product);
                    request.getRequestDispatcher("/WEB-INF/views/edit-product.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    productService.deleteProduct(id);
                    response.sendRedirect(request.getContextPath() + "/products");
                    break;
                case "list":
                default:
                    int page = 1;
                    try {
                        page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
                    } catch (NumberFormatException e) {
                        page = 1;
                    }
                    int pageSize = 10;
                    List<Product> products = productService.getProducts(page, pageSize);
                    if (products == null) {
                        products = new ArrayList<>();
                    }
                    int totalPages = productService.getTotalPages(pageSize);
                    if (totalPages < 0) totalPages = 1;

                    request.setAttribute("products", products);
                    request.setAttribute("currentPage", page);
                    request.setAttribute("totalPages", totalPages);
                    request.getRequestDispatcher("/WEB-INF/views/products.jsp").forward(request, response);
                    break;
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid parameter: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing request: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedIn") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getParameter("action");
        if (action == null) {
            response.sendRedirect(request.getContextPath() + "/products");
            return;
        }

        try {
            switch (action) {
                case "add":
                    Product newProduct = new Product(
                            0,
                            request.getParameter("productCode"),
                            request.getParameter("name"),
                            request.getParameter("description"),
                            Double.parseDouble(request.getParameter("price")),
                            Integer.parseInt(request.getParameter("stockQuantity")),
                            request.getParameter("specifications"),
                            request.getParameter("imageUrl")
                    );
                    productService.addProduct(newProduct);
                    response.sendRedirect(request.getContextPath() + "/products");
                    break;
                case "edit":
                    Product updatedProduct = new Product(
                            Integer.parseInt(request.getParameter("id")),
                            request.getParameter("productCode"),
                            request.getParameter("name"),
                            request.getParameter("description"),
                            Double.parseDouble(request.getParameter("price")),
                            Integer.parseInt(request.getParameter("stockQuantity")),
                            request.getParameter("specifications"),
                            request.getParameter("imageUrl")
                    );
                    productService.updateProduct(updatedProduct);
                    response.sendRedirect(request.getContextPath() + "/products");
                    break;
                default:
                    response.sendRedirect(request.getContextPath() + "/products");
                    break;
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid number format: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing request: " + e.getMessage());
        }
    }
}