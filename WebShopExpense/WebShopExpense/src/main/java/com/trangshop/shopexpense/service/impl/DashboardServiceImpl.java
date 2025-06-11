package com.trangshop.shopexpense.service.impl;

import com.trangshop.shopexpense.service.DashboardService;
import com.trangshop.shopexpense.service.repository.DashboardRepo;
import com.trangshop.shopexpense.service.repository.impl.DashboardRepoImpl;

import java.util.List;
public class DashboardServiceImpl implements DashboardService {
    private DashboardRepo dashboardRepo;

    public DashboardServiceImpl() {
        this.dashboardRepo = new DashboardRepoImpl();
    }

    @Override
    public int getTotalStock() {
        return dashboardRepo.getTotalStock();
    }

    @Override
    public int getTotalOrders() {
        return dashboardRepo.getTotalOrders();
    }

    @Override
    public double getTotalRevenue() {
        return dashboardRepo.getTotalRevenue();
    }

    @Override
    public List<Object[]> getRevenueByDay() {
        return dashboardRepo.getRevenueByDay();
    }
}