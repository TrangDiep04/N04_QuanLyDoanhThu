package com.trangshop.shopexpense.service.impl;

    import com.trangshop.shopexpense.model.Order;
    import com.trangshop.shopexpense.model.OrderDetail;
    import com.trangshop.shopexpense.service.OrderService;
    import com.trangshop.shopexpense.service.repository.OrderRepo;
    import com.trangshop.shopexpense.service.repository.impl.OrderRepoImpl;

    import java.util.List;

    public class OrderServiceImpl implements OrderService {
        private OrderRepo orderRepo;

        public OrderServiceImpl() {
            this.orderRepo = new OrderRepoImpl();
        }

        @Override
        public List<Order> getOrders(int page, int pageSize, String status, String startDate, String endDate) {
            List<Order> orders = orderRepo.findAll(page, pageSize, status, startDate, endDate);
            for (Order order : orders) {
                List<OrderDetail> details = orderRepo.getOrderDetails(order.getId());
                double total = 0;
                for (OrderDetail d : details) {
                    total += d.getQuantity() * d.getUnitPrice();
                }
                order.setTotalAmount(total);
            }
            return orders;
        }

        @Override
        public int getTotalPages(int pageSize, String status, String startDate, String endDate) {
            int totalRecords = orderRepo.getTotalRecords(status, startDate, endDate);
            return (int) Math.ceil((double) totalRecords / pageSize);
        }

        @Override
        public List<OrderDetail> getOrderDetails(int orderId) {
            return orderRepo.getOrderDetails(orderId);
        }

        @Override
        public void updateOrderStatus(int orderId, String status) throws IllegalArgumentException {
            if (!isValidStatusTransition(orderId, status)) {
                throw new IllegalArgumentException("Invalid status transition.");
            }
            orderRepo.updateOrderStatus(orderId, status);
        }

        public boolean isValidStatusTransition(int orderId, String newStatus) {
            String[] validStatuses = {"PENDING", "SHIPPED", "DELIVERED", "CANCELLED"};
            Order order = getOrderById(orderId);
            if (order == null) return false;

            String currentStatus = order.getStatus();
            if (!isValidStatus(newStatus, validStatuses)) return false;

            if ("PENDING".equals(currentStatus)) {
                return "SHIPPED".equals(newStatus) || "CANCELLED".equals(newStatus);
            } else if ("SHIPPED".equals(currentStatus)) {
                return "DELIVERED".equals(newStatus);
            }
            return false;
        }

        public boolean isValidStatus(String status, String[] validStatuses) {
            for (String valid : validStatuses) {
                if (valid.equals(status)) return true;
            }
            return false;
        }

        @Override
        public Order getOrderById(int orderId) {
            Order order = orderRepo.findById(orderId);
            if (order != null) {
                List<OrderDetail> details = orderRepo.getOrderDetails(orderId);
                double total = 0;
                for (OrderDetail d : details) {
                    total += d.getQuantity() * d.getUnitPrice();
                }
                order.setTotalAmount(total);
            }
            return order;
        }
    }