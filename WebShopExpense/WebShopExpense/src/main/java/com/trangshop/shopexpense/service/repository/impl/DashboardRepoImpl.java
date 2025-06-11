package com.trangshop.shopexpense.service.repository.impl;

import com.trangshop.shopexpense.service.DatabaseConnectService;
import com.trangshop.shopexpense.service.impl.DatabaseConnectServiceImpl;
import com.trangshop.shopexpense.service.repository.DashboardRepo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DashboardRepoImpl implements DashboardRepo {

    private DatabaseConnectService databaseConnectService;

    public DashboardRepoImpl() {
        this.databaseConnectService = new DatabaseConnectServiceImpl();
    }

    @Override
    public int getTotalStock() {
        try (Connection conn = databaseConnectService.getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT SUM(stock_quantity) FROM products")) {
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
            return 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public int getTotalOrders() {
        try (Connection conn = databaseConnectService.getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(*) FROM orders")) {
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
            return 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public double getTotalRevenue() {
        try (Connection conn = databaseConnectService.getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT SUM(total_amount) FROM orders WHERE status = 'DELIVERED'")) {
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getDouble(1);
            }
            return 0.0;
        } catch (SQLException e) {
            e.printStackTrace();
            return 0.0;
        }
    }

    @Override
    public List<Object[]> getRevenueByDay() {
        List<Object[]> revenue = new ArrayList<>();
        try (Connection conn = databaseConnectService.getConnection();
             PreparedStatement stmt = conn.prepareStatement(
                     "SELECT DATE(order_date) as day, SUM(total_amount) as revenue FROM orders WHERE order_date >= DATE_SUB(CURDATE(), INTERVAL 7 DAY) AND status = 'DELIVERED' GROUP BY day")) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                revenue.add(new Object[]{rs.getString("day"), rs.getDouble("revenue")});
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return revenue;
    }
}