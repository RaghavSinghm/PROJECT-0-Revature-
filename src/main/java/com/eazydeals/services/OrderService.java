package com.eazydeals.services;

import java.util.List;

import com.eazydeals.entities.Order;

public interface OrderService {
	List<Order> getAllOrdersByUserId(int usrId);
}