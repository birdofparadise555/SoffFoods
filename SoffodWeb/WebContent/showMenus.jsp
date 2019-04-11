<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
        <div class="container">
            <a class="navbar-brand js-scroll-trigger" href="index.html"><img src="img/logo/Logo.png" width="50"></a>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                Menu
                <i class="fa fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav text-uppercase ml-auto">
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="index.html">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="managefoods.html">Manage Foods</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="managedeserts.html">Manage deserts</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="managedrinking.html">Manage Drinking</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="managefoodsset.html">Manage Foods set</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="chef.html">Chef list</a>
                    </li>
                    <form action="index.html">    
                            <button class="btn btn-info btn-block login" type="submit">Logout</button>
                        </form>
                    
                </ul>
            </div>
        </div>
    </nav>


    <section>
            <div class="container1"> <center> <h2>Admin manage food </h2></center></div>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
        <link href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/readable/bootstrap.min.css" rel="stylesheet" integrity="sha384-Li5uVfY2bSkD3WQyiHX8tJd0aMF91rMrQP5aAewFkHkVSTT2TmD2PehZeMmm7aiL" crossorigin="anonymous">
       <div class="container-fluid">
            <div class="card-footer">
                    <button id="Btnadd" class="btn btn-primary btn-block btn-lg">Add Foods</a>
                    </button>
                </div>
                <div id="myModal" class="modal">
                        <!-- Modal content -->
                        <div class="modal-content">
                            <span class="close">&times;</span>
                            <div class="container1">
                                <h3>Input Data</h3>
                               <form:form method="post" action="saveFoods.do" commandName="foods">
								<form:hidden path="foodsId" />
								<br />
								Foods Name: <form:input path="foodsName" />
								<br />
								Foods Price : <form:input path="foodsPrice" />
								<br />
								<input type="submit" value="Save" />
							</form:form>
                            </div>
                        </div>
                    </div>
                </div>
                
            <c:forEach items="${foodsList}" var="foods"> 
           <div class="row">
               <div class="col-md-4">
                   <div class="panel panel-default">
                       <div class="panel-body">
                           <div class="row">
                               <div class="col-md-4">
                                   <img src="img/food/1.png" class="img-responsive">
                               </div>
                               <div class="col-md-8">
                                   <h6>${foods.foodsName}</h6>
                                   <p style="font-size: 12px;">${foods.foodsPrice}</p>
                                   <button class="btn btn-primary btn-xs">
                                       <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                       Edit</button>
                                   <button class="btn btn-success btn-xs">
                                       <i class="fa fa-trash-o" aria-hidden="true"></i>
                                       Delete</button>
                               </div>
                           </div>
                       </div>
                   </div>
               </div>
               </c:forEach>
    </section>
    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="script/popup.js"></script>

</body>

</html>