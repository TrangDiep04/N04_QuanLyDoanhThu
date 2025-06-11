// DashboardService.java
package com.trangshop.shopexpense.service;

import java.util.List;

public interface DashboardService {
    int getTotalStock();
    int getTotalOrders();
    double getTotalRevenue();
    List<Object[]> getRevenueByDay();
}