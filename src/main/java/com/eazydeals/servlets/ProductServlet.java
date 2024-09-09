package com.eazydeals.servlets;

import com.eazydeals.entities.Product;
import com.eazydeals.services.ProductService;
import com.eazydeals.helper.ConnectionProvider;
import com.eazydeals.dao.ProductDao;
import com.eazydeals.dao.CategoryDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ProductService productService;

	@Override
	public void init() throws ServletException {
		ProductDao productDao = new ProductDao(ConnectionProvider.getConnection());
		CategoryDao categoryDao = new CategoryDao(ConnectionProvider.getConnection());
		this.productService = new ProductService(productDao, categoryDao);
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String searchKey = request.getParameter("search");
		String catId = request.getParameter("category");

		List<Product> prodList = productService.getProducts(searchKey, catId);
		String message = "";

		if (searchKey != null && !searchKey.isEmpty()) {
			message = "Showing results for \"" + searchKey + "\"";
		} else if (catId != null && !catId.trim().equals("0")) {
			message = "Showing results for \"" + productService.getCategoryName(catId) + "\"";
		} else {
			message = "All Products";
		}

		if (prodList != null && prodList.isEmpty()) {
			message = "No items are available for \""
					+ (searchKey != null ? searchKey : productService.getCategoryName(catId)) + "\"";
			prodList = productService.getProducts(null, null); // Fetch all products
		}

		request.setAttribute("prodList", prodList);
		request.setAttribute("message", message);

		// Forward to JSP
		request.getRequestDispatcher("/products.jsp").forward(request, response);
	}
}