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
	text-align: "center" text-align: -webkit-center
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
	display: flex;
}
</style>
<script>
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
	function validateForm() {
		var name = $('#nameIn').val();
		var pass = $('#passIn').val();
		var pin = $('#pinIn').val();
		var state = $('#stateIn').val();
		var city = $('#cityIn').val();
		if (name == "" || /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/.test(name)==false) {
			alert("Enter valid email");
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
		return true;
	}
	function validatePdtForm() {
		var name = $('#nameIn').val();
		var price = $('#priceIn').val();
		var cat = $('#catIn').val();
		if (name == "" || /^[a-zA-Z]*$/.test(name) == false
				|| /^[a-z]*$/.test(name) == true) {
			alert("Enter valid name, with 1 capital letter, no numerical vlaues");
			return false;
		}
		if (price == "" || /^[0-9]*$/.test(price) == false) {
			alert("Enter Valid price");
			return false;
		}
		if (cat == "") {
			alert("Enter a category values");
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<div class="navbar">
		<div style:align="left">
			<a href="StartUpPage">User</a> <a href="StartUpPageProduct">Product</a>
		</div>
		<div style:align="right">
			<a href="StartUpLogin">Login</a> <a href="StartUpRegister">Register</a>
		</div>
	</div>
	<br>
	<br>
	<br>
	<h3 align="center">Registration Page</h3>
	<br>
	<br>
	<div class="container-fluid">
		<div class="row">
			<form action="UserAdd" id="UserForm" method="post"
				onsubmit="return validateForm()">
				<h4 style="text-align: -webkit-center;">User Form</h4>
				<div class="form-group">
					<table>
						<tr>
							<td><label>Email Id : </label></td>
							<td><input type="text" id="nameIn" name="nameIn"></td>
						</tr>
						<tr>
							<td><label>Password : </label></td>
							<td><input type="text" id="passIn" name="passIn"></td>
						</tr>
						<tr>
							<td><label>State : </label></td>
							<td><input type="text" id="stateIn" name="stateIn"></td>
						</tr>
						<tr>
							<td><label>City : </label></td>
							<td><input type="text" id="cityIn" name="cityIn"></td>
						</tr>
						<tr>
							<td><label>Pin : </label></td>
							<td><input type="text" id="pinIn" name="pinIn"></td>
						</tr>
					</table>
					<button type="submit" class="button"
						onsubmit="return validateForm()">SUBMIT</button>
				</div>
				<br> <br>
			</form>


			<div class="col-6">
				<div id="cara" class="carousel slide" data-ride="carousel">
					<ul class="carousel-indicators">
						<li data-target="#cara" data-slide-to="0" class="active"></li>
						<li data-target="#cara" data-slide-to="1"></li>
						<li data-target="#cara" data-slide-to="2"></li>
					</ul>

					<div class="carousel-inner">
						<div class="carousel-item active">
							<img class="img" src="jsp/images/cara0.jpg" alt="Pic1">
						</div>
						<div class="carousel-item ">
							<img class="img" src="images/cara1.jpg" alt="Pic2">
						</div>
						<div class="carousel-item ">
							<img class="img" src="images/cara2.jpg" alt="Pic3">
						</div>
					</div>

					<a class="carousel-control-prev" href="#cara" data-slide="prev">
						<span class="carousel-control-prev-icon"></span>
					</a> <a class="carousel-control-next" href="#cara" data-slide="next">
						<span class="carousel-control-next-icon"></span>
					</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>