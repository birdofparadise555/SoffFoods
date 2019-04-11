<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List Foods</title>
</head>
<body>
<table border="1">
			<tr>
				<td>Number</td>
				<td>Food Name</td>
				<td>Price</td>
				<td></td>
				<td></td>
			</tr>
			
		<c:forEach items="${foodsList}" var="foods">
			
			<tr>
				<td>${foods.drinkId}</td>
				<td>${foods.drinkName}</td>
				<td>${foods.drinkPrice}</td>
				<td><a href="editFoods.do?id=${foods.drinkId}">Edit</a></td>
				<td><a href="deleteFoods.do?id=${foods.drinkId}">Remove</a></td> 
			</tr>
		</c:forEach>
	</table>
	<a href="drinkForm.do">Manage Foods</a>
	<a href="addDrink.do">add Drink</a>
</body>
</html>