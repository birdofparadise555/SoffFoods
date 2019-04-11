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
<style type="text/css">
.welcome {
	width: 1950px;
	height: 940px;
	position: relative;
	top: -135px;
	text-align: center;
}

.btn {
	background-color: red;
	border: none;
	color: white;
	padding: 12px 16px;
	font-size: 16px;
	cursor: pointer;
}
</style>
</head>
<body id="page-top">
	<!-- Navigation -->

	<button type="button"
		style="position: absolute; top: 2px; width: 100%; height: 125px; font-size: 63px; color: yellow; background-color: maroon;"
		class=" btn btn-primary">Welcome to Smart Order Food</button>
	<section style="padding-top: 110px;     padding-bottom: 0px;"
		class="welcomeFirstpage"> <img
		class="welcome w3-animate-fading" src="./FirstPageSlide/one.jpg">
	<img class="welcome w3-animate-fading" src="./FirstPageSlide/two.jpg">
	<img class="welcome w3-animate-fading" src="./FirstPageSlide/three.jpg">
	<img class="welcome w3-animate-fading" src="./FirstPageSlide/four.jpg">
	<img class="welcome w3-animate-fading" src="./FirstPageSlide/five.jpg">
	<img class="welcome w3-animate-fading" src="./FirstPageSlide/six.jpg">
	<img class="welcome w3-animate-fading" src="./FirstPageSlide/seven.jpg">
	<img class="welcome w3-animate-fading" src="./FirstPageSlide/eight.jpg">
	<img class="welcome w3-animate-fading" src="./FirstPageSlide/nine.jpg">
	<img class="welcome w3-animate-fading" src="./FirstPageSlide/ten.jpg">
	<img class="welcome w3-animate-fading"
		src="./FirstPageSlide/eleven.jpg"> <img
		class="welcome w3-animate-fading" src="./FirstPageSlide/Raider.jpg">

	<div
		style="position: absolute; margin-left: 800px; margin-top: -150px; top: 550px"
		class="Madmannanan">
		<div class="loginmodal-container">
			<h1>Table Number</h1>
			<br>
			<%-- <form>
				<input type="text" name="user" placeholder="Table Number"> <input
					type="submit" name="login" class="login loginmodal-submit"
					value="#Enter">
			</form> --%>

			<form action="foods.do">
				<input style="font-size: 30px; text-align: center;" type='text'
					onkeyup='validate()' id="tableNumber" name="tableNumber" />
				<input type="submit" value="Enter"
					class="btn btn-success btn-lg btn3d"><span
					class="glyphicon glyphicon-ok"></span></input>
			</form>
		</div>
	</div>
	</section>
	<script>
		function validate(evt) {
			var theEvent = evt || window.event;
			var key = theEvent.keyCode || theEvent.which;
			key = String.fromCharCode(key);
			var regex = /[0-9]/;
			if (!regex.test(key)) {
				theEvent.returnValue = false;
				if (theEvent.preventDefault)
					theEvent.preventDefault();
			}
		}
	</script>

	<script>

	function validate() {
		
	    var x = document.getElementById("tableNumber").value
	    //alert(x)
	   sessionStorage.setItem("table" , x)
	}

	var myIndex = 0;
		carousel();

		function carousel() {
			var i;
			var x = document.getElementsByClassName("welcome");
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			myIndex++;
			if (myIndex > x.length) {
				myIndex = 1
			}
			x[myIndex - 1].style.display = "block";
			setTimeout(carousel, 3000);
		}
	</script>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>