<%@page import="com.eazydeals.entities.Order"%>
<%@page import="com.eazydeals.entities.OrderedProduct"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>


<%
List<Order> orderList = (List<Order>) request.getAttribute("orderList");
Map<Integer, List<OrderedProduct>> orderedProductsMap = (Map<Integer, List<OrderedProduct>>) request.getAttribute("orderedProductsMap");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Orders</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<!-- Custom CSS -->
<link href="CSS/styles2.css" rel="stylesheet">
</head>
<body>
<%@include file="Components/navbar.jsp"%>
	<div class="container mt-5">
		<%
		if (orderList == null || orderList.size() == 0) {
		%>
		<div class="text-center">
			<img src="Images/empty-cart.png" alt="No Orders" class="img-fluid"
				style="max-width: 250px;">
			<h4 class="mt-3">No Orders Found</h4>
			<p class="lead">It looks like you haven't placed any orders yet!</p>
		</div>
		<%
		} else {
		%>
		<div class="mb-4">
			<h4 class="text-primary border-bottom pb-2">My Orders</h4>
			<p class="text-muted">Here are all your recent orders. Review
				your past purchases and their details.</p>
		</div>
		<div class="table-responsive">
			<table class="table table-striped table-hover">
				<thead class="table-secondary">
					<tr class="text-center">
						<th>Product</th>
						<th>Order ID</th>
						<th>Name</th>
						<th>Quantity</th>
						<th>Total Price</th>
						<th>Date and Time</th>
						<th>Payment Type</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (Order order : orderList) {
						List<OrderedProduct> ordProdList = orderedProductsMap.get(order.getId());
						for (OrderedProduct orderProduct : ordProdList) {
					%>
					<tr class="text-center">
						<td><img src="Product_imgs/<%=orderProduct.getImage()%>"
							alt="<%=orderProduct.getName()%>" class="img-thumbnail"
							style="max-width: 80px;"></td>
						<td><%=order.getOrderId()%></td>
						<td><%=orderProduct.getName()%></td>
						<td><%=orderProduct.getQuantity()%></td>
						<td>&#8377;<%=orderProduct.getPrice() * orderProduct.getQuantity()%></td>
						<td><%=order.getDate()%></td>
						<td><%=order.getPayementType()%></td>
						<td class="fw-semibold text-success"><%=order.getStatus()%></td>
					</tr>
					<%
					}
					}
					%>
				</tbody>
			</table>
		</div>
		<%
		}
		%>
	</div>

	<!-- Bootstrap JS and dependencies -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.min.js"></script>
</body>
</html>