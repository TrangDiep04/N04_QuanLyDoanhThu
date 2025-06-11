package com.trangshop.shopexpense.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/proxy")
public class ImageProxyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String urlParam = request.getParameter("url");
        if (urlParam == null || urlParam.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid URL parameter");
            return;
        }

        try {
            URL url = new URL(java.net.URLDecoder.decode(urlParam, "UTF-8"));
            URLConnection conn = url.openConnection();
            conn.setRequestProperty("User-Agent", "Mozilla/5.0");
            conn.setConnectTimeout(5000);
            conn.setReadTimeout(5000);

            String contentType = conn.getContentType();
            if (contentType == null ||
                    !(contentType.startsWith("image/") || contentType.equals("application/octet-stream"))) {
                throw new IOException("Not an image: " + contentType);
            }

            // Default to image/jpeg if content type is octet-stream
            if (contentType.equals("application/octet-stream")) {
                response.setContentType("image/jpeg");
            } else {
                response.setContentType(contentType);
            }

            try (InputStream in = conn.getInputStream();
                 OutputStream out = response.getOutputStream()) {
                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = in.read(buffer)) != -1) {
                    out.write(buffer, 0, bytesRead);
                }
                out.flush();
            }
        } catch (IOException e) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Image not found or inaccessible: " + e.getMessage());
            System.out.println("Proxy error for URL: " + urlParam + " - " + e.getMessage());
        }
    }
}