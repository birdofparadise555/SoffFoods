<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%
	
%>
<!DOCTYPE html>
<html>
<body>

	<c:forEach items="${foods}" var="food">
		<table>
			<tr>
				<td>${food.foodId}</td>
				<td>${food.foodName}</td>
				<td>${food.price}</td>
				<td><button id="${food.foodId}" onClick="select(this); return false;" data-todo='{"foodId":"${food.foodId}","foodName":"${food.foodName}","price":"${food.price}"}'>Add to card ${food.foodName}</button></td>
			</tr>
		</table>
	</c:forEach>

	<h1>Cart</h1>	
	<div id="demoCart"></div>
	
	<button onClick="clearCart()">remove cart</button>
	<button onClick="send()">confirm</button>
	


</body>

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
				html += "<td>" + this.list[index].foodId + "</td>"
				html += "<td>" + this.list[index].foodName + "</td>"
				html += "<td>" + this.list[index].price + "</td>"
				html += "<td><button onClick='deleteSelf(" + index +")'>delete</button></td>"
				html += "</tr>"
			}
		} else {
			html += "<tr>"
				html += "<td>No item in cart</td>"
				html += "</tr>"
			}
		html += "</table>"
		document.getElementById("demoCart").innerHTML = html
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

	function send () {
		var URL = 'http://localhost:8080/SoffodWeb/addorder.do'
		var method = 'POST'
		var cart = sessionStorage.getItem('cart')

		var shouldBeAsync = true
		var request = new XMLHttpRequest()

		request.onload = function () {
			   // You can get all kinds of information about the HTTP response.
			   var status = request.status; // HTTP response status, e.g., 200 for "200 OK"
			   var data = request.responseText; // Returned data, e.g., an HTML document.
			   console.log(status, data)
			}

		request.open(method, URL, shouldBeAsync)
		request.setRequestHeader("Content-Type", "application/json;charset=UTF-8")
		request.send(cart)
		
		}
</script>

</html>
