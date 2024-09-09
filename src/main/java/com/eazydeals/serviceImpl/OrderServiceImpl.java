package com.eazydeals.serviceImpl;

import java.util.List;
import com.eazydeals.dao.OrderDao;
import com.eazydeals.dao.OrderedProductDao;
import com.eazydeals.entities.Order;
import com.eazydeals.services.OrderService;
import com.eazydeals.helper.ConnectionProvider;

public class OrderServiceImpl implements OrderService {
    private OrderDao orderDao;
    private OrderedProductDao ordProdDao;

    public OrderServiceImpl() throws ClassNotFoundException {
        this.orderDao = new OrderDao(ConnectionProvider.getConnection());
        this.ordProdDao = new OrderedProductDao(ConnectionProvider.getConnection());
    }

    public List<Order> getAllOrdersByUserId(int userId) {
        return orderDao.getAllOrderByUserId(userId);
    }
}
