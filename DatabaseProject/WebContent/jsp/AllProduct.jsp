<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script>
	function PdtBuyLocal(x) {
		var id = x;
			$.ajax({
				method : "POST",
				url : "PdtBuy",
				data : {
					"PID" : x
				},
				datatype : "html",
				success : function() {
					alert("Product Added to Cart");
					window.location.reload();
				},
				error : function() {
					alert("Error");
				}
			});
	}
	var value = 0;
	$(document).ready(function() {
		$("input").focus(function() {
			$(this).css("background-color", "#cccccc");
		});
		$("input").blur(function() {
			$(this).css("background-color", "#ffffff");
		});
	})

	function random_bg_color() {

		var x = Math.floor(Math.random() * 256);
		var y = Math.floor(Math.random() * 256);
		var z = Math.floor(Math.random() * 256);
		var bgColor = "rgb(" + x + "," + y + "," + z + ")";
		console.log(bgColor);

		document.body.style.background = bgColor; //body.style.
		
		if($('#myTable tr').length == 1)
			$('#myTable').css("display","none");
		else
			$('#myTable').css("display","bloc");
	}
</script>
<style>
table {
	border-collapse: collapse;
	background-color: white;
}

thead {
	background-color: tomato;
}

body {
	color: #000000;
	margin-left: 0;
	margin-right: 0;
	margin-top: 0;
	margin-bottom: 0;
	margin-width: 0;
	margin-height: 0;
	background-color: #A3A6BA;
	text-align: center;
}

p {
	background-color: DodgerBlue;
	height: 50px;
	width: 50%;
	margin-left: auto;
	margin-right: auto;
	box-shadow: 3px 5px 9px 1px black;
}

.button {
	background-color: #8a4caf;
	border: none;
	color: white;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
}

form {
	margin: auto;
	width: 100%;
	text-align: "center"
}

.navbar {
	overflow: hidden;
	background-color: #333;
	position: fixed;
	top: 0;
	width: 100%;
}

.navbar a {
	float: left;
	display: block;
	color: #f2f2f2;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

.ak {
	margin-right: 15px;
	margin-top: 10px;
	background-color: #8a4caf;
	border: none;
	color: white;
	text-align: center;
	text-decoration: none;
	display: inline-block;
}

input {
	vertical-align: middle;
	display: flex;
}

.open-button {
	background-color: #555;
	color: white;
	padding: 16px 20px;
	border: none;
	cursor: pointer;
	opacity: 0.8;
	position: fixed;
	bottom: 23px;
	right: 28px;
	width: 280px;
}

.form-popup {
	top: 0;
	display: none;
	position: fixed;
	right: 40%;
	border: 3px solid #f1f1f1;
	z-index: 9;
	width: 200px;
	margin: 0 auto;
}

.form-container {
	max-width: 300px;
	padding: 10px;
	background-color: white;
}

.form-container .btn {
	background-color: #4CAF50;
	color: white;
	padding: 16px 20px;
	border: none;
	cursor: pointer;
	width: 100%;
	margin-bottom: 10px;
	opacity: 0.8;
}

.form-container .cancel {
	background-color: red;
}

.Modal {
	display: none;
	position: fixed;
	left: 0;
	top: 0;
	z-index: 9999;
	width: 100%;
	height: 100%;
	padding-top: 100px;
	background-color: black;
	background-color: rgba(0, 0, 0, 0.4);
	-webkit-transition: 0.5s;
	overflow: auto;
	transition: all 0.3s linear;
}

.is-blurred {
	filter: blur(2px);
	-webkit-filter: blur(2px);
}
</style>
</head>
<body>
	<div class="navbar">
		<div style:align="left">
			<a href="DisplayProfile"> Profile</a>
		</div>
		<div style:align="right">
		<a href="StartUpCart">Cart</a>
			<a href="UserDisplay">LogOut</a>
		</div>
	</div>
	<br>
	<br>
	<br>
	<div class="container" id="myCont">
		<h1>Products</h1>
		<!-- <table style="width=20%" id="myTable"> -->

		<table class="table table-striped" id="myTable">
			<tbody id="tbody">
			<thead>
				<th>ID</th>
				<th>Product Name</th>
				<th>Category</th>
				<th>Price</th>
				<th>Action</th>
			</thead>
			<%@page import="com.godrej.model.User"%>
			<%@page import="com.godrej.service.UserService"%>
			<%@page import="com.godrej.serviceimpl.UserServiceImpl"%>
			<%@page import="com.godrej.util.DbConnection"%>
			<%@page import="java.util.ArrayList"%>
			<%@page import="java.sql.Statement"%>
			<%@page import="java.sql.Connection"%>
			<%@page import="java.sql.PreparedStatement"%>
			<%@page import="java.sql.ResultSet"%>
			<%
				Connection conn = null;
				Statement stmt = null;
				try{
					DbConnection util = new DbConnection();
					conn = util.getConn();
					stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery("select * from Product ORDER BY PID ASC");
					while (rs.next()) {
						out.print("<td>" + rs.getInt("PID") + "</td>");
						out.print("<td>" + rs.getString("NAME") + "</td>");
						out.print("<td>" + rs.getString("CATEGORY") + "</td>");
						out.print("<td>" + rs.getInt("PRICE") + "</td>");
							out.print("<td><button id='buyButton'  type='button' class='button' onclick='PdtBuyLocal("
									+ rs.getInt("PID") + ")'>Purchase</button></td>");
						out.print("</tr>");
					}
				}catch (Exception e) {
					e.printStackTrace();
				} finally {
					try {
						if (conn != null) {
							conn.close();
						}
						if (stmt != null) {
							stmt.close();
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			%>

			</tbody>
		</table>
	</div>
</body>
</html>