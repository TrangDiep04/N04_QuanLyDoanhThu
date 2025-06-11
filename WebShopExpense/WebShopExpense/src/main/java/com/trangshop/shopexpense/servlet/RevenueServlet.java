package com.trangshop.shopexpense.servlet;

import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.properties.UnitValue; // Sửa lại từ UnitValue thành properties.UnitValue
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
import java.io.File;
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

        String role = (String) session.getAttribute("role");
        if (!"ADMIN".equals(role)) {
            response.sendRedirect(request.getContextPath() + "/revenue");
            return;
        }

        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        if (startDate == null || endDate == null) {
            LocalDate now = LocalDate.now();
            startDate = now.minusMonths(1).toString();
            endDate = now.toString();
        }

        // Fetch revenue data
        List<RevenueByTime> revenueByDay = revenueService.getRevenueByTime("day", startDate, endDate);
        List<RevenueByTime> revenueByMonth = revenueService.getRevenueByTime("month", startDate, endDate);
        List<RevenueByTime> revenueByYear = revenueService.getRevenueByTime("year", startDate, endDate);
        List<RevenueByProduct> revenueByProduct = revenueService.getRevenueByProduct(startDate, endDate);
        List<RevenueByCustomer> revenueByCustomer = revenueService.getRevenueByCustomer(startDate, endDate);

        // Set attributes
        request.setAttribute("revenueByDay", revenueByDay);
        request.setAttribute("revenueByMonth", revenueByMonth);
        request.setAttribute("revenueByYear", revenueByYear);
        request.setAttribute("revenueByProduct", revenueByProduct);
        request.setAttribute("revenueByCustomer", revenueByCustomer);
        request.setAttribute("startDate", startDate);
        request.setAttribute("endDate", endDate);

        String action = request.getParameter("action");
        if ("exportPDF".equals(action)) {
            exportToPDF(response, revenueByDay, revenueByMonth, revenueByYear, revenueByProduct, revenueByCustomer, startDate, endDate);
            return;
        }

        request.getRequestDispatcher("/WEB-INF/views/revenue.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        response.sendRedirect(request.getContextPath() + "/revenue?startDate=" + startDate + "&endDate=" + endDate);
    }

    private void exportToPDF(HttpServletResponse response, List<RevenueByTime> revenueByDay, List<RevenueByTime> revenueByMonth,
                             List<RevenueByTime> revenueByYear, List<RevenueByProduct> revenueByProduct,
                             List<RevenueByCustomer> revenueByCustomer, String startDate, String endDate) throws IOException {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=RevenueReport_" + startDate + "_to_" + endDate + ".pdf");

        PdfWriter writer = new PdfWriter(response.getOutputStream());
        PdfDocument pdfDoc = new PdfDocument(writer);
        Document document = new Document(pdfDoc);
        document.setMargins(20, 20, 20, 20);

        // Load a font that supports Vietnamese using the correct path
        String fontPath = getServletContext().getRealPath("/fonts/DejaVuSans.ttf");
        PdfFont font = null;
        try {
            if (fontPath == null || !new File(fontPath).exists()) {
                throw new IOException("Font file not found at: " + fontPath + ". Please place DejaVuSans.ttf in src/main/webapp/fonts/");
            }
           font = PdfFontFactory.createFont(fontPath, "Identity-H", PdfFontFactory.EmbeddingStrategy.PREFER_EMBEDDED);
            document.setFont(font);
        } catch (IOException e) {
            // Log the error and send an error response to the client
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error generating PDF: " + e.getMessage());
            document.close();
            return;
        }

        document.add(new Paragraph("Báo cáo Doanh thu (" + startDate + " đến " + endDate + ")\n"));
        document.add(new Paragraph("Được tạo vào: " + LocalDate.now() + " lúc 08:03 PM +07\n"));

        // Revenue by Day
        document.add(new Paragraph("Doanh thu theo Ngày\n"));
        Table table = new Table(UnitValue.createPercentArray(new float[]{25, 75}));
        table.addCell("Ngày");
        table.addCell("Tổng Doanh thu (VND)");
        for (RevenueByTime revenue : revenueByDay) {
            table.addCell(revenue.getTimePeriod());
            table.addCell(String.valueOf(revenue.getTotalRevenue()));
        }
        document.add(table);

        // Revenue by Month
        document.add(new Paragraph("\nDoanh thu theo Tháng\n"));
        table = new Table(UnitValue.createPercentArray(new float[]{25, 75}));
        table.addCell("Tháng");
        table.addCell("Tổng Doanh thu (VND)");
        for (RevenueByTime revenue : revenueByMonth) {
            table.addCell(revenue.getTimePeriod());
            table.addCell(String.valueOf(revenue.getTotalRevenue()));
        }
        document.add(table);

        // Revenue by Year
        document.add(new Paragraph("\nDoanh thu theo Năm\n"));
        table = new Table(UnitValue.createPercentArray(new float[]{25, 75}));
        table.addCell("Năm");
        table.addCell("Tổng Doanh thu (VND)");
        for (RevenueByTime revenue : revenueByYear) {
            table.addCell(revenue.getTimePeriod());
            table.addCell(String.valueOf(revenue.getTotalRevenue()));
        }
        document.add(table);

        // Revenue by Product
        document.add(new Paragraph("\nDoanh thu theo Sản phẩm\n"));
        table = new Table(UnitValue.createPercentArray(new float[]{25, 75}));
        table.addCell("Tên Sản phẩm");
        table.addCell("Tổng Doanh thu (VND)");
        for (RevenueByProduct revenue : revenueByProduct) {
            table.addCell(revenue.getProductName());
            table.addCell(String.valueOf(revenue.getTotalRevenue()));
        }
        document.add(table);

        // Revenue by Customer
        document.add(new Paragraph("\nDoanh thu theo Khách hàng\n"));
        table = new Table(UnitValue.createPercentArray(new float[]{25, 75}));
        table.addCell("Tên Khách hàng");
        table.addCell("Tổng Doanh thu (VND)");
        for (RevenueByCustomer revenue : revenueByCustomer) {
            table.addCell(revenue.getCustomerName());
            table.addCell(String.valueOf(revenue.getTotalRevenue()));
        }
        document.add(table);

        document.close();
    }
}