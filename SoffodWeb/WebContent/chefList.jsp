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

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/agency.min.css" rel="stylesheet">
<link href="css/custom-style.css" rel="stylesheet">
<link href="css/chef.css" rel="stylesheet">
<link href="css/button.css" rel="stylesheet">
</head>
<body id="page-top">
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
	<div class="container" style="margin-right: 444px;">
		<a class="navbar-brand js-scroll-trigger" href="index.html"><img
			src="img/logo/Logo.png" width="50" style="margin-left: 291px;"></a>
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
				<li class="nav-item"><a
					style="background-color: forestgreen; border: 5px solid red; border-radius: 15px;"
					class="nav-link js-scroll-trigger" href="chefList.do">Chef list</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="serviceman.do">Serviceman List</a></li>


			</ul>
		</div>
	</div>
	</nav>

	<table style="font-size: 35px; margin-top: -16px;"
		class="table table-striped table-dark">
		<thead style="color: red">
			<tr>
				<th style="text-align: center;" scope="col">Order ID</th>
				<th style="text-align: center;" scope="col">FoodsName</th>
				<th style="text-align: center;" scope="col">Quantity</th>
				<th style="text-align: center;" scope="col">Foods Table</th>
				<th style="text-align: center;" scope="col">Foods Completed</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${foodsList}" var="chef">

				<tr>
					<form:form method="post" action="saveListfoodfromChefFoods.do"
						enctype="multipart/form-data">
						<td style="text-align: center;"><input type="hidden"
							name="completeMenuId" value="${chef.orderItemId}">${chef.orderItemId}</td>
						<td style="text-align: center;"><input type="hidden"
							name="completeFoodName" id="0" value="${chef.foodName}">${chef.foodName}</td>
						<td style="text-align: center;"><input type="hidden"
							name="quantity" id="0" value="${chef.quantity}">${chef.quantity}</td>
						<td style="text-align: center;"><input type="hidden"
							name="completeTableNumber" id="0" value="${chef.numberTable}">${chef.numberTable}</td>
						<input style="text-align: center;" type="hidden" id="deleteId"
							name="deleteId" value="${chef.orderItemId}" />

						<td style="margin-top: -5px; text-align: center;">
							<button type="submit" class="btn btn-success btn-lg btn3d">
								<span class="glyphicon glyphicon-ok"></span> COMPLETE
							</button>
						</td>
					</form:form>
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