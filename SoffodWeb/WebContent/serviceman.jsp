<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="controller.addorder"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">

<head>

<style>
.btn {
	background-color: red;
	border: none;
	color: white;
	padding: 12px 16px;
	font-size: 16px;
	cursor: pointer;
}

/* Darker background on mouse-over */
.btn:hover {
	background-color: RoyalBlue;
}
</style>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Simple Sidebar - Start Bootstrap Template</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/agency.min.css" rel="stylesheet">
<link href="css/custom-style.css" rel="stylesheet">
<link href="css/chef.css" rel="stylesheet">
</head>
<body style="margin-top: 14;" id="page-top">
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
	<div style="margin-right: 500px;" class="container">
		<a class="navbar-brand js-scroll-trigger" href="index.html"><img
			src="img/logo/Logo.png" Style="margin-left: 341px;"  width="50"></a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			Menu <i class="fa fa-bars"></i>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav text-uppercase ml-auto">
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="welcome.do">Home</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="drinkForm.do">Manage Foods</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="addDrink.do">Manage Drinks</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="addDessert.do">Manage Desserts</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="chefList.do">Chef list</a></li>
				<li class="nav-item"><a
					style="background-color: forestgreen; border: 5px solid red; border-radius: 15px;"
					class="nav-link js-scroll-trigger" href="serviceman.do">Serviceman
						List</a></li>
						

			</ul>
		</div>
	</div>
	</nav>

	<table style="font-size: 35px; margin-top: -31px;"
		class="table table-striped table-dark">
		<thead style="text-align: center; color: red">
			<tr>
				<th scope="col">Order ID</th>
				<th scope="col">FoodsName</th>
				<th scope="col">Quantity</th>
				<th scope="col">Foods Table</th>
				<th scope="col">Finish</th>
			</tr>
		</thead>
		<tbody style="text-align: center;">
			<c:forEach items="${foodsList}" var="order">
				<tr>
					<td>${order.completeMenuId}</td>
					<td>${order.completeFoodName}</td>
					<td>${order.quantity}</td>
					<td>${order.completeTableNumber}</td>
					<td style="width: 100px; height: 50;"><a
						href="deleteListfood.do?id=${order.completeMenuId}" class="btn">
							<span class="glyphicon glyphicon-ok"></span> Delivered
							</button>
					</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="script/btn.js"></script>

</body>

</html>