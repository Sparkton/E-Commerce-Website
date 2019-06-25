<%@page import="java.sql.ResultSet"%>
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
<!-- <link rel="stylesheet" type="text/css" href="../DatabaseProject/jsp/css/styles.css"> -->

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
	/* function UserUpdateLocal() {
		var id = $('#updateId').val();
			$.ajax({
				method : "POST",
				url : "UserUpdate",
				data : {
					"ID" : id
				},
				datatype : "html",
				success : function() {
					window.location.reload();
				},
				error : function() {
					alert("Error");
				}
			});
	} */
	function AdminCheck(x, y) {
		if (y == 1) {
			console.log(y);
			$.ajax({
				method : "POST",
				url : "MakeAdmin",
				data : {
					"ID" : x,
					"check" : y
				},
				datatype : "html",
				success : function() {
					console.log("User updated to Admin ");
					window.location.reload();
				},
				error : function() {
					alert("Error");
				}
			});
		} else {
			console.log(y);
			$.ajax({
				method : "POST",
				url : "MakeAdmin",
				data : {
					"ID" : x,
					"check" : y
				},
				datatype : "html",
				success : function() {
					console.log("User updated to Not-Admin ");
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

	function random_bg_color() {

		var x = Math.floor(Math.random() * 256);
		var y = Math.floor(Math.random() * 256);
		var z = Math.floor(Math.random() * 256);
		var bgColor = "rgb(" + x + "," + y + "," + z + ")";
		console.log(bgColor);

		document.body.style.background = bgColor; //body.style.

		if ($('#myTable tr').length == 1)
			$('#myTable').css("display", "none");
		else
			$('#myTable').css("display", "bloc");
	}

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
	function uUpdate(x) {
	}
	function validateForm() {
		var name = $('#nameIn').val();
		var pass = $('#passIn').val();
		var pin = $('#pinIn').val();
		var state = $('#stateIn').val();
		var city = $('#cityIn').val();
		if (name == ""
				|| /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/.test(name) == false) {
			alert("Enter valid emial-ID");
			return false;
		}
		if (pass == "" || pass.length < 6) {
			alert("Enter valid password, must be 6 characters long");
			return false;
		}
		if (pin == "" || pin.length !== 6) {
			alert("Enter Valid pin");
			return false;
		}
		if (/^[a-zA-Z]*$/.test(state) == false
				|| /^[a-zA-Z]*$/.test(city) == false || state == ""
				|| city == "") {
			alert("State/City don't have no numbers or special characters");
			return false;
		}
		//document.getElementById("myTable").style.display = "block";
		//document.getElementById("myTable").removeAttribute("display");

		return true;
	}
	function validateFormUpdate() {
		var name = $('#updateName').val();
		var pass = $('#updatePass').val();
		var pin = $('#updatePin').val();
		var state = $('#updateCity').val();
		var city = $('#updateState').val();
		if (name == ""
				|| /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/.test(name) == false) {
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

.switch {
	position: relative;
	display: inline-block;
	width: 60px;
	height: 34px;
}

.switch input {
	opacity: 0;
	width: 0;
	height: 0;
}

.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 26px;
	width: 26px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

input:checked+.slider {
	background-color: #2196F3;
}

input:focus+.slider {
	box-shadow: 0 0 1px #2196F3;
}

input:checked+.slider:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
}

.slider.round {
	border-radius: 34px;
}

.slider.round:before {
	border-radius: 50%;
}
</style>
</head>

<body onload="random_bg_color()">
	<div class="navbar">
		<div style:align="left">
			<a href="StartUpPageProduct">Product</a>
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
			<thead>
				<th>ID</th>
				<th>Name</th>
				<th>Password</th>
				<th>State</th>
				<th>City</th>
				<th>Pincode</th>
				<th>Action</th>
				<th>Make Admin</th>
			</thead>
			<%@page import="com.godrej.model.User"%>
			<%@page import="com.godrej.service.UserService"%>
			<%@page import="com.godrej.serviceimpl.UserServiceImpl"%>
			<%@page import="java.util.ArrayList"%>
			<%@page import="com.godrej.util.DbConnection"%>
			<%@page import="java.sql.*"%>
			<%
				UserService userService = new UserServiceImpl();
				ArrayList<User> list = new ArrayList<User>(userService.getList());

				/* 		for (User i : list) {
					out.print("<tr>");
					out.print("<td>" + i.getUserId() + "</td>");
					out.print("<td>" + i.getuName() + "</td>");
					out.print("<td>" + i.getuPass() + "</td>");
					out.print("<td>" + i.getAddress().getState() + "</td>");
					out.print("<td>" + i.getAddress().getCity() + "</td>");
					out.print("<td>" + i.getAddress().getPinCode() + "</td>");
					out.print("<td><button id='updateButton' style='margin-right:16px' type='submit' class='button' onclick='openForm("
									+ i.getUserId() + ")'>Update</button>");
					out.print("<button id='deleteButton' style='margin-right:16px' type='button' class='button' onclick='uDelete("
									+ i.getUserId() + ")'>Delete</button><br></td>"); */
				out.print("<tr>");
				Connection conn = null;
				Statement stmt = null;
				try {
					DbConnection util = new DbConnection();
					conn = util.getConn();
					stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery("select * from Users ORDER BY USERID ASC");
					while (rs.next()) {
						out.print("<td>" + rs.getInt("USERID") + "</td>");
						out.print("<td>" + rs.getString("EMAIL") + "</td>");
						out.print("<td>" + rs.getString("PASS") + "</td>");
						out.print("<td>" + rs.getString("STATE") + "</td>");
						out.print("<td>" + rs.getString("CITY") + "</td>");
						out.print("<td>" + rs.getInt("PIN") + "</td>");
						out.print(
								"<td><button id='updateButton' style='margin-right:16px' type='submit' class='button' onclick='openForm("
										+ rs.getInt("USERID") + ")'>Update</button>");
						out.print("<button id='deleteButton'  type='button' class='button' onclick='uDelete("
								+ rs.getInt("USERID") + ")'>Delete</button><br></td>");

						if (rs.getInt("isAdmin") == 1) {
							out.print("<td><label class='switch'><input id='adminCheckBox' type='checkBox' style='display: inline-flex' class='form-check-input' onclick='AdminCheck("
											+ rs.getInt("USERID")
											+ ",0)' checked></input><span class='slider round'></span></label></td>");
						} else
							out.print("<td><label class='switch'><input id='adminCheckBox' type='checkBox' style='display: inline-flex' class='form-check-input' onclick='AdminCheck("
											+ rs.getInt("USERID")
											+ ",1)'></input><span class='slider round'></span></label></td>");
						out.print("</tr>");
					}
				} catch (Exception e) {
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
				//usersList.add(userService);
			%>
		</table>
		<div align="center" class="col-md">
			<form method="post" action="UserAdd" onsubmit="return validateForm();">
				<div class="form-group">
					<table>
						<tr>
							<td><label>Email: </label></td>
							<td><input type="text" name="nameIn" id="nameIn"></td>
						</tr>
						<tr>
							<td><label>Password: </label></td>
							<td><input type="text" name="passIn" id="passIn"></td>
						</tr>
						<tr>
							<td><label>State : </label></td>
							<td><input type="text" name="stateIn" id="stateIn"></td>
						</tr>
						<tr>
							<td><label>City: </label></td>
							<td><input type="text" name="cityIn" id="cityIn"></td>
						</tr>
						<tr>
							<td><label>PinCode: </label></td>
							<td><input type="number" name="pinIn" id="pinIn"></td>
						</tr>
					</table>
					<button type="submit" class="button">CREATE</button>
				</div>
			</form>
		</div>
		<div id="myModal" class="Modal">
			<div class="form-popup" id="myForm">
				<div>
					<form action="UserUpdate" class="form-container" method="post"
						onsubmit="return validateFormUpdate()">
						<h1>Update</h1>

						<label><b>ID</b></label> 
						<input type="text" name="updateID" id="updateId" readonly>
						<label><b>Name</b></label> 
						<input type="text" name="updateName" id="updateName"> 
						<label><b>Password</b></label>
						<input type="text" name="updatePass" id="updatePass">
						<label><b>State</b></label>
						<input type="text" name="updateState" id="updateState"> 
						<label><b>City</b></label>
						<input type="text" name="updateCity" id="updateCity"> 
						<label><b>Pin</b></label>
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