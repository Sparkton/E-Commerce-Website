<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script>
function uDelete(x) {
	var id = x;
	var check = confirm("Are you sure?");
	if (check == true) {
		$.ajax({
			method : "POST",
			url : "UserDel",
			data : {
				"ID" : id
			},
			datatype : "html",
			success : function() {
				console.log("Value sent to Delete ");
				window.location.reload();
			},
			error : function() {
				alert("Error");
			}
		});
	}
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


function openForm(x) {
	document.getElementById("myForm").style.display = "block";
	document.getElementById("myModal").style.display = "block";
	document.getElementById("myCont").className = "container ";

	document.getElementById("updateId").value = x;
	document.getElementById("updateName").value = document
			.getElementById("myTable").rows[x].cells[1].innerText;
	document.getElementById("updatePass").value = document
			.getElementById("myTable").rows[x].cells[2].innerText;
	document.getElementById("updateState").value = document
			.getElementById("myTable").rows[x].cells[3].innerText;
	document.getElementById("updateCity").value = document
			.getElementById("myTable").rows[x].cells[4].innerText;
	document.getElementById("updatePin").value = document
			.getElementById("myTable").rows[x].cells[5].innerText;
}

function closeForm() {
	document.getElementById("myCont").className = "container";
	document.getElementById("myForm").style.display = "none";
	document.getElementById("myModal").style.display = "none";
}

function validateFormUpdate() {
	var name = $('#updateName').val();
	var pass = $('#updatePass').val();
	var pin = $('#updatePin').val();
	var state = $('#updateCity').val();
	var city = $('#updateState').val();
	if (name == "" || /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/.test(name)==false) {
		alert("Enter valid emial-ID");
		return false;
	}
	if (pass == "" || pass.length < 6) {
		alert("Enter valid password, must be 6 characters long");
		return false;
	}
	if (/^[a-zA-Z]*$/.test(state) == false
			|| /^[a-zA-Z]*$/.test(city) == false || state == ""
			|| city == "") {
		alert("State/City don't have no numbers or special characters");
		return false;
	}
	if (pin == "" || pin.length !== 6) {
		alert("Enter Valid pin");
		return false;
	}
     document.getElementById("A").style.visibility = "visible";
	return true;
}
</script>
<style>
table {
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
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
			<a href="StartUpAllProducts">Products</a>
		</div>
		<div style:align="right">
			<a href="UserDisplay">LogOut</a> 
		</div>
	</div>
	<br>
	<br>
	<br>
	<div class="container" id="myCont">
		<h1>User Data</h1>
		<!-- <table style="width=20%" id="myTable"> -->

		<table class="table table-striped" id="myTable">
			<tbody id="tbody">
			<thead>
				<th>ID</th>
				<th>Name</th>
				<th>Password</th>
				<th>State</th>
				<th>City</th>
				<th>Pincode</th>
				<th>Action</th>
			</thead>
			<%@page import="com.godrej.model.User"%>
			<%@page import="com.godrej.service.UserService"%>
			<%@page import="com.godrej.serviceimpl.UserServiceImpl"%>
			<%@page import="java.util.ArrayList"%>
			<%
				out.print("<tr>");
				out.print("<td>" + request.getAttribute("ID") + "</td>");
				out.print("<td>" + request.getAttribute("uName") + "</td>");
				out.print("<td>" + request.getAttribute("uPass") + "</td>");
				out.print("<td>" + request.getAttribute("State") + "</td>");
				out.print("<td>" + request.getAttribute("City") + "</td>");
				out.print("<td>" + request.getAttribute("Pincode") + "</td>");
				out.print(
						"<td><button id='updateButton' style='margin-right:16px' type='submit' class='button' onclick='openForm("
								+ request.getAttribute("ID") + ")'>Update</button>");
				/* out.print(
						"<button id='deleteButton' style='margin-right:16px' type='button' class='button' onclick='uDelete("
								+ request.getAttribute("ID")+ ")'>Delete</button><br></td></tr>"); */
				out.print("</tr>");
			%>

			</tbody>
		</table>
		<div id="myModal" class="Modal">
			<div class="form-popup" id="myForm">
				<div>
					<form action="UserUpdate" class="form-container" method="post"
						onsubmit="return validateFormUpdate()">
						<h1>Update</h1>

						<label><b>ID</b></label> <input type="text" name="updateID"
							id="updateId" readonly> <label><b>Name</b></label> <input
							type="text" name="updateName" id="updateName"> <label><b>Password</b></label>
						<input type="text" name="updatePass" id="updatePass"> <label><b>State</b></label>
						<input type="text" name="updateState" id="updateState"> <label><b>City</b></label>
						<input type="text" name="updateCity" id="updateCity"> <label><b>Pin</b></label>
						<input type="text" name="updatePin" id="updatePin"><br>

						<button type="submit" class="btn" onclick="closeForm()">Update</button>
						<button type="button" class="btn cancel" onclick="closeForm()">Close</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>