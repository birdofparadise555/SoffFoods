<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="controller.addorder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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
</head>

<body id="page-top">
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
	<div class="container">
		<a class="navbar-brand js-scroll-trigger" href="index.html"><img
			src="img/logo/Logo.png" width="50" style="margin-left: 40px;"></a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			Menu <i class="fa fa-bars"></i>
		</button>
		<div style="margin-right: 150px;" class="collapse navbar-collapse"
			id="navbarResponsive">
			<ul class="navbar-nav text-uppercase ml-auto">

				<li class="nav-item"><a
					style="background-color: aqua; margin-left: 15px; color: red; height: 65px; width: 225px; border: 15px; border-radius: 10px; font-size: 20px; text-align: center;"
					class="nav-link js-scroll-trigger" href="foods.do">Foods Menu </a></li>
				<li class="nav-item"><a
					style="background-color: gray; margin-left: 15px; height: 65px; width: 225px; border: 15px; border-radius: 10px; font-size: 20px; text-align: center;"
					class="nav-link js-scroll-trigger" href="drink.do">Drinks Menu
				</a></li>
				<li class="nav-item"><a
					style="background-color: gray; margin-left: 15px; height: 65px; width: 225px; border: 15px; border-radius: 10px; font-size: 20px; text-align: center;"
					class="nav-link js-scroll-trigger" href="dessert.do">Desserts
						Menu </a></li>
				<li class="nav-item"><a
					style="background-color: brown; margin-left: 15px; height: 65px; width: 225px; border: 15px; border-radius: 10px; font-size: 20px; text-align: center;"
					class="nav-link js-scroll-trigger" onClick="clearCart()"
					href="welcome.do">Out </a></li>
			</ul>
		</div>
	</div>
	</nav>


	<div
		style="position: fixed; top: 170px; right: 0; border-radius: 15px; width: 400px; min-height: 700px; max-height: 760px; border: 20px solid #000; text-align: -webkit-center;">
		<div
			style="width: 200px; height: 80px; background-color: #ea0404; margin-top: -20px;">
			<div style="width: 100px; height: 40px; background-color: #444"></div>
		</div>
		<!--1-->
		<!-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxMadmanxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -->
		<%-- <%=request.getParameter("tableNumber") %> --%>

		<div style="height: 100%;">
			<input type="text" style="text-align: center" class="form-control"
				value="" name="tableNumber" id="tableNumbers"
				placeholder="Please indentify your number table" required readonly>
			<div id="list" style="height: 420px; overflow: auto;">
				<!-- List Order Here!!!! -->
				
			</div>
		</div>
		<div class="card-footer">
			<p class="btn btn-success btn-block btn-lg" id="totalPrice"></p>
			<button style="background-color: blue;" class="btn btn-primary btn-block btn-lg" data-toggle="modal"
				data-target="#exampleModal">Confirm Orders</button>
			<!-- <button class="btn btn-primary btn-block btn-lg"
				onClick="clearCart()">Remove all cart</button>
				  -->
			<form action="receipt.do">
				<input type="hidden" style="text-align: center"
					value="<%=request.getParameter("tableNumber")%>"
					class="form-control" name="tableNumber" id="tableNumber">

				<button id="receipt"></button>

				<!-- <button style=" margin-top: 15px; background-color: red; color: blue;"
					class="btn btn-primary btn-block btn-lg" type="submit"
					value="Submit" disabled="disabled">My Receipt</button> -->
			</form>
		</div>
	</div>
	<!-- food -->
	<section id="services"> <c:forEach items="${foodsList}"
		var="foods">
		<div class="container">
			<!-- card -->
			<div class="card">
				<div style="text-align: center;" class="card-header">
					<b style="font-size: 25px;">${foods.foodName}</b>
				</div>
				<div class="card-body">

					<!-- <p class="card-text">Best ugg boots on the planet. Free shipping, 24/7 customer service.</p> -->

					<img style="width: 260px; height: 250px;"
						src="img/food/${foods.foodImage}" class="img-responsive">
					<p></p>
					<h6 class="card-title">${foods.price}&#3647;</h6>
					<!-- Input Quantity Here! -->
					<div>

						<button
							style="border-radius: 5px; width: 32px; height: 40px; background-color: orangered; font-size: 25px;"
							onclick="minus(${foods.foodId})">-</button>
						<input
							style="background-color: lavender; font-size: 20px; text-align: center; width: 70%; border-radius: 10px;"
							type="number" id="${foods.foodId}" min="1" max="50" value="1">
						<button
							style="background-color: aqua; border-radius: 5px; width: 30px; font-size: 25px; height: 40px;"
							onclick="plus(${foods.foodId})">+</button>

					</div>

				</div>
				<div class="card-footer">

					<a id="s${foods.foodId}" onClick="select(this); return false;"
						data-todo='{"foodName":"${foods.foodName}","price":"${foods.price}", "numberTable": 0, "quantity": 1}'
						class="btn btn-primary btn-block btn-lg">Add </a>

					<script>
							function plus(foodId) {
								document.getElementById(foodId).stepUp(+1);
								var object = document.getElementById("s" + foodId)
								var todo = object.getAttribute('data-todo');
								todo = JSON.parse(todo)
								if (todo.quantity < 50) {
									todo.quantity += 1
								}
								object.setAttribute('data-todo', JSON.stringify(todo))
								console.log(todo)
							}
							function minus(foodId) {
								document.getElementById(foodId).stepUp(-1);
								var object = document.getElementById("s" + foodId)
								var todo = object.getAttribute('data-todo');
								todo = JSON.parse(todo)
								if (todo.quantity > 1) {
									todo.quantity -= 1
								}
								object.setAttribute('data-todo', JSON.stringify(todo))
								console.log(todo)
							}
						</script>

				</div>
			</div>
		</div>
	</c:forEach> </section>
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div style="top: 150px;" class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 style="color: green;" class="modal-title"
						id="exampleModalLabel">
						Confirm Order ?
						<h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
				</div>
				<div class="modal-body">
					<h
						style="font-size: 35px;
    color: red;
    text-align: center;
    padding-left: 30%;">Are
					you sure?</h>
					<p style="color: red;">After you confrim you cannot to remove
						order on your list order!!</p>
				</div>
				<div class="modal-footer">
					<button
						style="width: 200px; background-color: green; height: 60px; margin-right: 60px;"
						type="button" class="btn btn-secondary" data-dismiss="modal"
						onClick="send()">Confrim</button>
					<button style="width: 200px; background-color: red; height: 60px;"
						type="button" class="btn btn-secondary" data-dismiss="modal">Back</button>
				</div>
			</div>
		</div>
	</div>
	<p id="totalPrice"></p>
	<!-- Sript -->
	<script>
		var list = []
		var cart = {}

		window.onLoad(this.check())
		function select(e) {
			console.log(e.getAttribute('data-todo'))
			cart = JSON.parse(e.getAttribute('data-todo'))
			cart.status = "new"
			this.list.push(this.cart)
			sessionStorage.setItem('cart', JSON.stringify(this.list))
			this.check()
		}
		function check() {
			document.getElementById("tableNumbers").value = sessionStorage.getItem("table");
			var html
			var totalPrice = 0
			
			html = "<table class='cartTable'>"
			if (sessionStorage.getItem('cart')) {
				list = JSON.parse(sessionStorage.getItem('cart'))
				//document.getElementById("p").innerHTML = JSON.stringify(this.list)
				data = {
					'list' : list
				}
				html += "<tr><th>Name</th><th>Price</th><th>Quantity</th><th>Remove order</th><th></th></tr>"
				for ( var index in this.list) {
					html += "<tr>"
					html += "<td>" + this.list[index].foodName + "</td>"
					html += "<td>" + this.list[index].price + "Baht." + "</td>"
					html += "<td>" + this.list[index].quantity + "</td>"
					
					if (this.list[index].status === 'new') {
						html += "<td><button onClick='deleteSelf("
								+ index
								+ ")'><i class='fa fa-trash' style='font-size:20px;color:red'></i></button></td>"
					} else { html += "<td>" + this.list[index].status  + "</td>"
					}

					html += "</tr>"
					totalPrice += parseFloat(this.list[index].price * this.list[index].quantity)
				}
			} else {
				html += "<tr>"
				html += "<td>No menus in your list orders</td>"
				html += "</tr>"
			}
			html += "</table>"
			document.getElementById("list").innerHTML = html
			//document.getElementById("p").innerHTML = JSON.stringify(this.list)
			//document.getElementById("cart").innerHTML = sessionStorage.getItem('cart')
			var plusVat = (totalPrice*7)/100
			var GGG = totalPrice+plusVat
			document.getElementById("totalPrice").innerHTML = "Total : "
					+ totalPrice + " Baht."

					var status = []
					for (var index in this.list) {
						status.push(this.list[index].status)
					}
			
			var btn = document.getElementById("receipt")
			btn.innerHTML = "My Receipt"
			btn.type = "submit"
			btn.className = "btn btn-primary btn-block btn-lg"
			btn.style.marginTop = "15px"
			btn.style.background = "red"
			btn.style.color = "blue"
				
			if (status.includes("new")) {
				btn.disabled = true
				} else {
					btn.disabled = false
					}
			// document.getElementById("receipt").appendChild(btn)
	
		}

		function deleteSelf(index) {
			console.log(this.list.splice(index, 1))
			//this.list.splice(index, 1)
			sessionStorage.setItem('cart', JSON.stringify(this.list))
			this.check()
		}
		
		function clearCart() {
			console.log('clear')
			this.list = []
			sessionStorage.removeItem('cart')
			this.check()
		}

		function send() {
			var tableNumber = document.getElementById("tableNumber").value

			var URL = 'http://localhost:8080/SoffodWeb/addorder.do?tableNumber='
					+ tableNumber

			var method = 'POST'
			var carts = JSON.parse(sessionStorage.getItem('cart'))

			var sendCart = []

			for ( var index in carts) {
				if (carts[index].status === 'new') {
					sendCart.push(carts[index])
				}
				delete carts[index].status
			}

			var shouldBeAsync = true
			var request = new XMLHttpRequest()

			request.onload = function() {
				// You can get all kinds of information about the HTTP response.
				var status = request.status // HTTP response status, e.g., 200 for "200 OK"
				var data = request.responseText // Returned data, e.g., an HTML document.
				console.log(status, data)
			}

			request.open(method, URL, shouldBeAsync)
			request.setRequestHeader("Content-Type",
					"application/json;charset=UTF-8")
			request.send(JSON.stringify(sendCart))

			for ( var index in carts) {
				carts[index].status = "Chef cooking!"
			}

			sessionStorage.setItem('cart', JSON.stringify(carts))

			window.location
					.assign('http://localhost:8080/SoffodWeb/foods.do?tableNumber='
							+ tableNumber)
		}
		
	</script>
	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
<style>
.cartTable {
	width: 100%;
}

.cartTable tr, .cartTable th {
	text-align: center;
	width: 23.33px;
}
</style>
</html>