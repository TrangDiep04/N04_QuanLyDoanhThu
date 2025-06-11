package com.trangshop.shopexpense.service.repository;

import java.util.List;

public interface DashboardRepo {
    int getTotalStock();
    int getTotalOrders();
    double getTotalRevenue();
    List<Object[]> getRevenueByDay();
}