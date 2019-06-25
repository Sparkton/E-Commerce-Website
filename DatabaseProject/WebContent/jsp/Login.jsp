<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
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
	text-align: left;
	padding: 14px 16px;
	text-decoration: none;
}

form {
	margin: auto;
	width: 50%;
	text-align: "center"
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
	display: block;
	margin-top: 0em;
}

.img {
	position: relative;
	float: left;
	width: auto;
	height: 400px;
	background-position: 100% 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

input {
	vertical-align: right;
	display: flex;
}

label {
	vertical-align: left;
}
</style>
<script>
	var val;
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
		document.body.style.background = bgColor;
	}
	function isEmpty() {
		var userName = $("#uName").val();
		var pass = $("#pass").val();
		val = 0;
		if (userName == "" || pass == "")
			return false;
		else
			return true;
	}
</script>
</head>
<body>
	<!-- <div class="navbar">
		 <div style:align="left">
		 <a href="StartUpLogin">Login</a>
			<a href="StartUpPageProduct">Product</a> <a href="StartUpPage">User</a>
		</div> 
		<div style:align="right">
			 <a href="StartUpRegister">Register</a>
		</div>
	</div> -->
	<br>
	<br>
	<br>
	<br>
	<h3 align="center">Login Page</h3>
	<br>
	<br>
	<div>
		<form method="post" onsubmit="return isEmpty()" action="newLogin"
			method="post" style="display: grid;">
			<label>Email-Id : </label> <input type="text" name="uName" id="uName">
			<label><br>Password : </label> <input type="text" name="pass" id="pass"> <br>
			<button type="submit" class="button">SUBMIT</button>
			<br>
			<h6 style="text-align-last: center;">
				Not Registered, <a href="StartUpRegister">Register Now</a>
			</h6>
			<br>
		</form>
	</div>
</body>
</html>