package com.eazydeals.servlets;
import com.eazydeals.services.OrderService;
import com.eazydeals.services.OrderedProductService;
import com.eazydeals.serviceImpl.OrderServiceImpl;
import com.eazydeals.serviceImpl.OrderedProductServiceImpl;
import com.eazydeals.entities.Message;
import com.eazydeals.entities.User;
import com.eazydeals.entities.OrderedProduct;
import com.eazydeals.entities.Order;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private OrderService orderService;
    private OrderedProductService orderedProductService;

    public OrderServlet() throws ClassNotFoundException {
        super();
        orderService = new OrderServiceImpl();
        orderedProductService = new OrderedProductServiceImpl();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User activeUser = (User) session.getAttribute("activeUser");

        if (activeUser == null) {
            Message message = new Message("You are not logged in! Login first!!", "error", "alert-danger");
            session.setAttribute("message", message);
            response.sendRedirect("login.jsp");
            return;
        }

        List<Order> orderList = orderService.getAllOrdersByUserId(activeUser.getUserId());

        Map<Integer, List<OrderedProduct>> orderedProductsMap = new HashMap<>();
        for (Order order : orderList) {
            List<OrderedProduct> orderedProducts = orderedProductService.getAllOrderedProducts(order.getId());
            orderedProductsMap.put(order.getId(), orderedProducts);
        }
        request.setAttribute("orderList", orderList);
        request.setAttribute("orderedProductsMap", orderedProductsMap);

        request.getRequestDispatcher("myOrders.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}