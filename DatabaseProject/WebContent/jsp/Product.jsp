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
	function pDelete(x) {
		var id = x;
		var check = confirm("Are you sure?");
		if (check == true) {
			$.ajax({
				method : "POST",
				url : "PdtDel",
				data : {
					"ID" : id
				},
				datatype : "html",
				success : function() {
					alert("Value sent to Delete ");
					window.location.reload();
				},
				error : function() {
					alert("Error");
				}
			});
		}
	}
	
	function PdtBuyLocal(x) {
		var id = x;
			$.ajax({
				method : "POST",
				url : "PdtBuy",
				data : {
					"PID" : x,

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
		if((boolean)request.getSession().getAttribute()!== true)
			response.sendRedirect("UserDisplay");
	}
	function openForm(x) {
		document.getElementById("myForm").style.display = "block";
		document.getElementById("myModal").style.display = "block";

		document.getElementById("updateId").value = x;
		document.getElementById("updateName").value = document.getElementById("myTable").rows[x].cells[1].innerText;
		document.getElementById("updateCat").value = document.getElementById("myTable").rows[x].cells[2].innerText;
		document.getElementById("updatePrice").value = document.getElementById("myTable").rows[x].cells[3].innerText;
	}

	function closeForm() {
		document.getElementById("myForm").style.display = "none";
		document.getElementById("myModal").style.display = "none";

	}
	function pUpdate(x) {
		var name = $('#updateName').val();
		var price = $('#updatePrice').val();
		var cat = $('#updateCat').val();
		if (name == "" || /^[a-zA-Z]*$/.test(name) == false || /^[a-z]*$/.test(name) == true){
			alert("Enter valid name, with 1 capital letter, no numerical vlaues");
			return false;
		}
		if (price == "" ||  /^[0-9]*$/.test(price) == false) {
			alert("Enter Valid price");
			return false;
		}
		if(cat == ""){
			alert("Enter a category values");
			return false;
		}
		return true;
	}
	function validateForm() {
		var name = $('#nameIn').val();
		var price = $('#priceIn').val();
		var cat = $('#catIn').val();
		if (name == "" || /^[a-zA-Z]*$/.test(name) == false || /^[a-z]*$/.test(name) == true){
			alert("Enter valid name, with 1 capital letter, no numerical vlaues");
			return false;
		}
		if (price == "" ||  /^[0-9]*$/.test(price) == false) {
			alert("Enter Valid price");
			return false;
		}
		if(cat == ""){
			alert("Enter a category values");
			return false;
		}
	     document.getElementById("A").style.visibility = "visible";
		return true;
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
<body onload="random_bg_color()">
	<div class="navbar">
		<div style:align="left">
			<a href="StartUpPage">User</a>
		</div>
		<div style:align="right">
			<a href="StartUpCart">Cart</a> <a href="UserDisplay">LogOut</a> 
		</div>
	</div>
	<br><br><br>
	<div class="container" id="myCont">
		<h1>Product Data</h1>
		<!-- <table style="width=20%" id="myTable"> -->

		<table class="table table-striped" id="myTable" >
			<tbody id="tbody">
			<thead>
				<th>ID</th>
				<th>Name</th>
				<th>Category</th>
				<th>Price</th>
				<th>Actions</th>
				<th>Buy</th>
			</thead>
			<%@page import="com.godrej.model.Product"%>
			<%@page import="com.godrej.service.ProductService"%>
			<%@page import="com.godrej.serviceimpl.ProductServiceImpl"%>
			<%@page import="java.util.ArrayList"%>
			<%@page import="com.godrej.util.DbConnection"%>
			<%@page import="java.sql.*"%>
			<%
				
			/*ArrayList<Product> list = new ArrayList<Product>(pdtService.getList());
				 for (Product i : list) {
					out.print("<tr>");
					out.print("<td>" + i.getProduct_Id() + "</td>");
					out.print("<td>" + i.getProduct_Name() + "</td>");
					out.print("<td>" + i.getProduct_Cat() + "</td>");
					out.print("<td>" + i.getProduct_Price() + "</td>");
					out.print("<td><button id='updateButton' style='margin-right:16px' type='submit' class='button' onclick='openForm("
							+ i.getProduct_Id() + ")'>Update</button>");
					out.print("<td><button id='addButton' style='margin-right:16px' type='submit' class='button' onclick='addPdt("
							+ i.getProduct_Id() + ")'>Update</button>");
					out.print("<button id='deleteButton'  type='button' class='button' onclick='pDelete(" + i.getProduct_Id()
							+ ")'>Delete</button><br></td></tr>");
				} */
				out.print("<tr>");
				Statement stmt = null;
				Connection conn = null;
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
						out.print("<td><button id='updateButton' style='margin-right:16px' type='submit' class='button' onclick='openForm("
										+ rs.getInt("PID") + ")'>Update</button>");
						out.print("<button id='deleteButton'  type='button' class='button' onclick='pDelete("
								+ rs.getInt("PID") + ")'>Delete</button><br></td>");

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

		<br> <br>

		<div class="row">
			<div align="left" class="col-md">
				<form method="post" onsubmit="return validateForm()">
					<!-- <label>ID : <input type="text" name="serialIn" id="serialIn"></label> <br> -->
					<label>Name : </label> <input type="text" name="nameIn" id="nameIn"> <br>
					<label>Category : </label> <input type="text" name="catIn" id="catIn">
					<br> <label>Price : </label> <input type="text" name="priceIn" id="priceIn">
					<br>
					<button type="submit" class="button" formaction="PdtAdd">CREATE</button>
					<br> <br> <br>
				</form>
			</div>
		</div>
		<div id="myModal" class="Modal">
			<div class="form-popup" id="myForm">
				<form action="PdtUpdate" class="form-container" method="post" onsubmit = "return pUpdate()">
					<h1>Update</h1>
					<label><b>ID</b></label> <input type="text" name="updateID"
						id="updateId" readonly> <label><b>Name</b></label> <input
						type="text" name="updateName" id="updateName"> <label><b>Category</b></label>
					<input type="text" name="updateCat" id="updateCat"> <label><b>Price</b></label>
					<input type="text" name="updatePrice" id="updatePrice">

					<button type="submit" class="btn" onclick="closeForm()">Update</button>
					<button type="button" class="btn cancel" onclick="closeForm()">Close</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>