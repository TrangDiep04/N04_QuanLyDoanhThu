package com.trangshop.shopexpense.service.impl;

import com.trangshop.shopexpense.model.Product;
import com.trangshop.shopexpense.service.ProductService;
import com.trangshop.shopexpense.service.repository.ProductRepo;
import com.trangshop.shopexpense.service.repository.impl.ProductRepoImpl;

import java.util.ArrayList;
import java.util.List;

public class ProductServiceImpl implements ProductService {
    private ProductRepo productRepo;

    public ProductServiceImpl() {
        try {
            this.productRepo = new ProductRepoImpl();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to initialize ProductRepoImpl: " + e.getMessage());
        }
    }

    public List<Product> getProducts(int page, int pageSize) {
        try {
            if (page < 1) page = 1;
            if (pageSize < 1) pageSize = 10;
            return productRepo.findAll(page, pageSize);
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>(); // Trả về danh sách rỗng nếu lỗi
        }
    }

    public int getTotalPages(int pageSize) {
        try {
            if (pageSize < 1) pageSize = 10;
            int totalRecords = productRepo.getTotalRecords();
            return (int) Math.ceil((double) totalRecords / pageSize);
        } catch (Exception e) {
            e.printStackTrace();
            return 1; // Mặc định 1 trang nếu lỗi
        }
    }

    public void addProduct(Product product) {
        try {
            productRepo.addProduct(product);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to add product: " + e.getMessage());
        }
    }

    public void updateProduct(Product product) {
        try {
            productRepo.updateProduct(product);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to update product: " + e.getMessage());
        }
    }

    public void deleteProduct(int id) {
        try {
            productRepo.deleteProduct(id);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to delete product: " + e.getMessage());
        }
    }

    public Product getProductById(int id) {
        try {
            return productRepo.findById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return null; // Trả về null nếu lỗi
        }
    }
}