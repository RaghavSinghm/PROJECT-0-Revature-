package com.eazydeals.services;
import java.util.List;

import com.eazydeals.entities.OrderedProduct;

public interface OrderedProductService {
    List<OrderedProduct> getAllOrderedProducts(int orderId);
}