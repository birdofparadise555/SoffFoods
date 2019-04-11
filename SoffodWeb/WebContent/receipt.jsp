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
<body style="margin-top: 0px;">
	<!-- Navigation -->
	<img style="margin-top: -150px;" src="./img/home/Header1.png"
		alt="Smiley face">



	<div
		style="margin-left: auto; margin-right: auto; margin-top: 30px; border-radius: 15px; width: 400px; min-height: 700px; max-height: 760px; border: 20px solid #000; text-align: -webkit-center;">
		<div
			style="width: 200px; height: 80px; background-color: #ea0404; margin-top: -20px;">
			<div style="width: 100px; height: 40px; background-color: #444"></div>
		</div>
		<!--1-->
		<div style="height: 100%;">
			<%
				String table = request.getParameter("tableNumber") != null
						? request.getParameter("tableNumber")
						: "no table number identification";
			%>

			<p id="tableNumber"></p>
			<button class="btn btn-primary btn-block btn-lg">
				Teble :&nbsp;<%=table%></button>


			<div id="list" style="height: 317px; overflow: auto;">
				<!-- List Order Here!!!! -->
			</div>
		</div>
		<div class="card-footer">
			<p style="background-color: darkblue; font-size: 23px"
				class="btn btn-success btn-block btn-lg" id=subTotal></p>
			<p style="background-color: darkblue; font-size: 23px"
				class="btn btn-success btn-block btn-lg" id=plusVat></p>
			<p style="background-color: green; font-size: 23px"
				class="btn btn-success btn-block btn-lg" id="totalPrice"></p>
			<a style="background-color: darkred;"
				class="btn btn-primary btn-block btn-lg" onClick="clearCart()"
				href="welcome.do">Close the program </a>

		</div>
	</div>

	<!-- food -->
	<section id="services"> </section>

	<!-- Sript -->
	<script>
		var list = []
		var cart = {}

		window.onLoad(this.check())
		function select(e) {
			console.log(e.getAttribute('data-todo'))
			cart = JSON.parse(e.getAttribute('data-todo'))
			this.list.push(this.cart)
			sessionStorage.setItem('cart', JSON.stringify(this.list))
			this.check()
		}

		function check() {
			var html
			var totalPrice = 0
			html = "<table class='cartTable'>"
			if (sessionStorage.getItem('cart')) {
				list = JSON.parse(sessionStorage.getItem('cart'))

				//document.getElementById("p").innerHTML = JSON.stringify(this.list)

				data = {
					'list' : list
				}

				html += "<tr><th>Name</th><th>Price</th><th>Quantity</th><th></th></tr>"
				for ( var index in this.list) {
					html += "<tr>"
					html += "<td>" + this.list[index].foodName + "</td>"
					html += "<td>" + this.list[index].price + " Baht. "
							+ "</td>"
					html += "<td>" + this.list[index].quantity + "</td>"
					html += "</tr>"

					totalPrice += parseFloat(this.list[index].price
							* this.list[index].quantity)
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
			var plusVat = (totalPrice * 7) / 100
			var GGG = totalPrice + plusVat
			document.getElementById("totalPrice").innerHTML = "Total : " + GGG
					+ " Baht."
			document.getElementById("plusVat").innerHTML = "Tax  : " + plusVat
					+ " Baht."
			document.getElementById("subTotal").innerHTML = "Sub Total  : "
					+ totalPrice + " Baht."
		}
		function deleteSelf(index) {
			console.log("delete " + this.list.splice(index, 1))
			this.list.splice(index, 1)
			sessionStorage.setItem('cart', JSON.stringify(this.list))
			this.check()
		}

		function clearCart() {
			console.log('clear')
			sessionStorage.removeItem('cart')
			this.list = []
			this.check()
		}

		function clearListonly() {
			console.log('clear')
			sessionStorage.removeItem('list')
			this.list = []
			this.check()
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