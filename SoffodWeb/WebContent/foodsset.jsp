<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="controller.addorder" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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
                        <a class="nav-link js-scroll-trigger" href="index.do">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="foods.do">Foods</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="desert.do">Deserts</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="drinking.do">Drinking</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="foodsset.do">Foods set</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="order.do">List my order</a>
                    </li>
                    
                </ul>
            </div>
        </div>
    </nav>
    
    
      	
  		
    <div style=" float: right;
    margin-top: 170px; width:400px;min-height: 700px;max-height: 3000px;border: 20px solid #000;text-align: -webkit-center  ">
        <div style="width: 200px;height: 80px;background-color: #ea0404;margin-top: -20px;">
            <div style="width: 100px;height: 40px;background-color: #444"></div>
        </div>
        <!--1-->
        <selection>
        <input type="text" style="text-align: center" pattern="{0,1000}" class="form-control" id="" placeholder="Please indentify your number table">
           <div id="list">
           <!-- List Order Here!!!! --> 
           </div>
        </selection>
        <div class="card-footer">
           <a id="Btnadd"  class="btn btn-primary btn-block btn-lg"  href="order.do"  >Confirm Orders </a>
            <button class="btn btn-primary btn-block btn-lg"   onClick="clearCart()" >remove cart</button>
    	</div>

   </div>
   	
    <!-- food -->
    <section id="services">
    <c:forEach items="${foodsList}" var="foods">
        <div class="container">
            <!-- card -->
            <div class="card" >
                <div class="card-header">
                    ${foods.foodsName}
                </div>
                <div class="card-body">
                   
                    <!-- <p class="card-text">Best ugg boots on the planet. Free shipping, 24/7 customer service.</p> -->
                    <img class="img-card" src="img/foodsset/405.jpg" ><p></p>
                    <h6 class="card-title">${foods.foodsPrice}.Bath</h6>
                </div>
                <div class="card-footer">
                
                  <a id="${foods.foodsId}" onClick="select(this); return false;" data-todo='{"foodsId":"${foods.foodsId}","foodsName":"${foods.foodsName}","foodsPrice":"${foods.foodsPrice}"}' class="btn btn-primary btn-block btn-lg">Add </a>
                  
                </div>
            </div>  </div>
             </c:forEach>
    </section>
   
   <!-- Sript -->
  <script>
	var list = []
	var cart = {}

	window.onLoad(this.check())
	function select (e) {
		console.log(e.getAttribute('data-todo'))
		cart = JSON.parse(e.getAttribute('data-todo'))
		this.list.push(this.cart)
		sessionStorage.setItem('cart', JSON.stringify(this.list))
		this.check()
		}

	function check () {
		var html
		html = "<table>"
		if (sessionStorage.getItem('cart')) {
			list = JSON.parse(sessionStorage.getItem('cart')) 
		
		//document.getElementById("p").innerHTML = JSON.stringify(this.list)
		
		
			html += "<tr><th>Id</th><th>Name</th><th>Price</th></tr>"
		for(var index in this.list) {
				html += "<tr>"
				html += "<td>" + this.list[index].foodsId + "</td>"
				html += "<td>" + this.list[index].foodsName + "</td>"
				html += "<td>" + this.list[index].foodsPrice + "</td>"
				html += "<td><button onClick='deleteSelf(" + index +")'><i class='fa fa-trash' style='font-size:20px;color:red'></i></button></td>"
				html += "</tr>"
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
	}

	function deleteSelf(index) {
		console.log("delete " + this.list.splice(index, 1))
		this.list.splice(index, 1)
		sessionStorage.setItem('cart', JSON.stringify(this.list))
		this.check()
		}

	function clearCart () {
		console.log('clear')
		sessionStorage.removeItem('cart')
		this.list = []
		this.check()
		}
</script>

   

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


</body>

</html>