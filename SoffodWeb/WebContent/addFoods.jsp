<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
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
<link href="css/btnadd.css" rel="stylesheet">
</head>
<body id="page-top">
	<!-- Navigation -->
	<nav style="margin-top: -150px;"
		class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
	<div class="container">
		<a class="navbar-brand js-scroll-trigger" href="index.html"><img
			src="img/logo/Logo.png" width="50"     margin-left: 130px;></a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			Menu <i class="fa fa-bars"></i>
		</button>
		<div style="    margin-left: 67px;" class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav text-uppercase ml-auto">
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="welcome.do">Home</a></li>
				<li class="nav-item"><a
					style="border-color: white; background-color: red;"
					class="nav-link js-scroll-trigger" href="drinkForm.do">Manage
						Foods</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="addDrink.do">Manage Drinks</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="addDessert.do">Manage Desserts</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="chefList.do">Chef list</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="serviceman.do">Serviceman List</a></li>
			</ul>
		</div>

	</div>
	</nav>


	<section>
	<div class="container1">
		<center>
			<h2>Admin manage food</h2>
		</center>
	</div>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
	<link
		href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/readable/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-Li5uVfY2bSkD3WQyiHX8tJd0aMF91rMrQP5aAewFkHkVSTT2TmD2PehZeMmm7aiL"
		crossorigin="anonymous">

	<!-- Function For Add Information of Foods -->
	<div class="container-fluid">
		<div class="card-footer">
			<button data-toggle="modal" data-target="#myModal1" id="BtnAdd"
				class="btn btn-primary btn-block btn-lg">Add Foods</button>
		</div>
		<div id="myModal1" role="dialog" class="modal"
			style="margin-top: 150px;">
			<!-- Modal content -->
			<div style="width: 500px;" class="modal-content">
				<button type="button" class="close" data-dismiss="modal">×</button>
				<div class="container1">
					<h3>Input Data</h3>
					<form:form method="post" action="savefile.do"
						enctype="multipart/form-data">
						<input type="hidden" name="foodId" />
						<br />
								Foods Name: <input style="border-radius: 8px; margin-top: 15px;"
							name="foodName" />
						<br />
								Foods Price : <input
							style="border-radius: 8px; margin-top: 8px;" name="Price" />
						<br />
						<div class="file-field">
							<div style="margin-top: 35px; width: 100%;"
								class="btn btn-primary btn-sm float-left">
								<!-- UploadFile -->
								<p>
									<input name="file" id="fileToUpload" type="file" />
								</p>
							</div>
						</div>
						<br></br>
						<input style="margin-left: 30%; margin-top: 18px; width: 150px;"
							type="submit" value="Save" />
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<ul>
		<!-- Function for List Information of list Foods  -->
		<c:forEach items="${foodsList}" var="foods">

			<li style="width: 500px; float: left; list-style: none; margin: 40px">
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="row">
									<div class="col-md-4">
										<img style="height: 150px;" src="img/food/${foods.foodImage}"
											class="img-responsive">
									</div>
									<div class="col-md-8">
										<h6 style="font-size: 35px;">Name : ${foods.foodName}</h6>
										<p style="font-size: 20px;">Price : ${foods.price} Baht.</p>

										<!-- Function Edit Information  -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#exampleModal">Edit
											Information</button>

										<div class="modal fade" id="exampleModal" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel"
											aria-hidden="true">
											<div style="top: 150px;" class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabel">Edit
															Information</h5>

														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														<form:form method="post" action="saveFoods.do"
															commandName="food">
															<form:hidden path="foodId" value="${foods.foodId}" />
															<div class="form-group">
																<label for="recipient-name" class="col-form-label">Food
																	Name :</label>
																<form:input path="foodName" />
																<br />
															</div>
															<div class="form-group">
																<label for="message-text" class="col-form-label">Food
																	Price:</label>
																<form:input path="price" />
																<br />
															</div>
													</div>
													<div class="modal-footer">
														<button style="height: 45px;" type="button"
															class="btn btn-secondary" data-dismiss="modal">Close</button>

														<input class="btn btn-primary" type="submit" value="Save" />
														</form:form>
													</div>
												</div>
											</div>
										</div>
										<a
											style="height: 40px; width: 150px; padding-top: 10px; text-align: center; background-color: red;"
											href="deleteFoods.do?id=${foods.foodId}"
											class="btn btn-success btn-xs"> Delete Food</a>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</li>

		</c:forEach>
	</ul>
	</section>
	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="script/btn.js"></script>

</body>

</html>