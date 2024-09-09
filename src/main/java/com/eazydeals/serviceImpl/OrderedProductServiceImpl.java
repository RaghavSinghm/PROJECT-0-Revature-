package com.eazydeals.serviceImpl;

import java.util.List;

import com.eazydeals.dao.OrderedProductDao;
import com.eazydeals.entities.OrderedProduct;
import com.eazydeals.helper.ConnectionProvider;
import com.eazydeals.services.OrderedProductService;

public class OrderedProductServiceImpl implements OrderedProductService {

    private OrderedProductDao orderedProductDao;

    public OrderedProductServiceImpl() throws ClassNotFoundException {
        // Initialize the DAO with a database connection
        orderedProductDao = new OrderedProductDao(ConnectionProvider.getConnection());
    }

    public List<OrderedProduct> getAllOrderedProducts(int orderId) {
        return orderedProductDao.getAllOrderedProduct(orderId);
    }
}
