<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>

<%@page import="com.eazydeals.entities.Product"%>

<%@page import="java.util.List"%>



<!DOCTYPE html>

<html>

<head>

<meta charset="ISO-8859-1">

<title>Products</title>

<%@include file="Components/common_css_js.jsp"%>

<style>

.real-price {

	font-size: 22px !important;

	font-weight: 600;

}



.product-price {

	font-size: 17px !important;

	text-decoration: line-through;

}



.product-discount {

	font-size: 15px !important;

	color: #027a3e;

}



.wishlist-icon {

	cursor: pointer;

	position: absolute;

	right: 10px;

	top: 10px;

	width: 36px;

	height: 36px;

	border-radius: 50%;

	border: 1px solid #f0f0f0;

	box-shadow: 0 1px 4px 0 rgba(0, 0, 0, .1);

	padding-right: 40px;

	background: #fff;

}

</style>

</head>

<body style="background-color: #f0f0f0;">

	<!-- Navbar -->

	<%@include file="Components/navbar.jsp"%>



	<!-- Show products -->

	<h4 class="text-center mt-2"><%=request.getAttribute("message")%></h4>

	<div class="row row-cols-1 row-cols-md-4 g-3">

		<%

		List<Product> prodList = (List<Product>) request.getAttribute("prodList");

		if (prodList != null && !prodList.isEmpty()) {

			for (Product p : prodList) {

		%>

		<div class="col">

			<div class="card h-100 px-2 py-2">

				<div class="container text-center">

					<img src="Product_imgs/<%=p.getProductImages()%>"

						class="card-img-top m-2"

						style="max-width: 100%; max-height: 200px; width: auto;">

					<div class="wishlist-icon">
```````````````````````````````````````````````````
						<!-- Wishlist Logic -->

						<button onclick="window.open('login.jsp', '_self')"

							class="btn btn-link" type="submit">

							<i class="fa-sharp fa-solid fa-heart" style="color: #909191;"></i>

						</button>

					</div>

					<h5 class="card-title text-center"><%=p.getProductName()%></h5>

					<div class="container text-center">

						<span class="real-price">&#8377;<%=p.getProductPriceAfterDiscount()%></span>&ensp;

						<span class="product-price">&#8377;<%=p.getProductPrice()%></span>&ensp;

						<span class="product-discount"><%=p.getProductDiscount()%>&#37;

							off</span>

					</div>

					<div class="container text-center mb-2 mt-2">

						<button type="button"

							onclick="window.open('viewProduct.jsp?pid=<%=p.getProductId()%>', '_self')"

							class="btn btn-primary text-white">View Details</button>

					</div>

				</div>

			</div>

		</div>

		<%

		}

		} else {

		%>

		<div class="col">

			<h5 class="text-center">No products found!</h5>

		</div>

		<%

		}

		%>

	</div>

</body>

</html>