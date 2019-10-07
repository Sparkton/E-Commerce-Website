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
body {
	font-family: courier;
    background: url("https://outlane.co/wp-content/uploads/2018/03/pattern.png");
    background-size: cover;
}
h2 {
	color: #fff;
	font-weight: bold;
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
	text-align: left;
	padding: 14px 16px;
	text-decoration: none;
}
form {
	margin: auto;
	text-align: "center" text-align: -webkit-center
}
.form-group {
	position: absolute;
    top: 50%;
    left: 30%;
    transform: translate(-50%, -50%);
    width: 400px;
    padding: 40px;
    background: rgba(0,0,0,.7);
    box-sizing: border-box;
    box-shadow: 0 15px 25px rgba(0,0,0,.5);
    border-radius: 10px;
}

.img {
	position: relative;
	float: left;
	width: auto;
	height: 500px;
	background-position: 100% 100%;
	background-repeat: no-repeat;
	background-size: cover;
}
.form-group .inputBox {
	position: relative;
}
h4 {
	margin-bottom: 550px;
	float: left;
	color: #fff;
}
input {
	width: 100%;
    padding: 10px 0;
    font-size: 16px;
    color: #fff;
    margin-bottom: 30px;
    border: none;
    border-bottom: 1px solid #fff;
    outline: none;
    background: transparent;
}
label {
    position: absolute;
    top: 0;
    left: 0;
    padding: 10px 0;
    font-size: 16px;
    color: #fff;
    pointer-events: none;
    transition: .5s; 
}
input:focus ~ label,
input:valid ~ label {
    top: -20px;
    left: 0;
    color: #03a9f4;
    font-size: 12px;
}
.button {
	margin-top: 10px;
	margin-left: 80px;
	background: transparent;
    border: none;
    outline: none;
    color: #fff;
    /*background: #03a9f4;*/
    background-color: #28a745;
    background-image: linear-gradient(-180deg,#34d058,#28a745 90%);
    padding: 10px 20px;
    cursor: pointer;
    border-radius: 5px;
    width: 55%;
}
</style>
<script>
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
		<div style="align:left">
			<a href="StartUpLogin">Login</a>
		</div>
		<h2 align="center">Registration Page</h2>
		<div style="align:right">
			<a href="StartUpRegister">Register</a>
		</div>
	</div>
	<br>
	<br>
	<br>
	
	<br>
	<br>
	<div class="container-fluid">
	<br><br><br><br><br><br>
		<div class="row">
			<div class="col-6">
			<!--<h4 style="text-align: -webkit-center;">User Form</h4>-->
			<form action="UserAdd" id="UserForm" method="post" autocomplete="off" onsubmit="return validateForm()">
				<br>
				<div class="form-group">
					<div class="inputBox">
						<input type="text" id="nameIn" name="nameIn" autocomplete="off" required="">
						<label>Email Id</label>
					</div>
					<div class="inputBox">
						<input type="password" id="passIn" name="passIn" autocomplete="off" required="">
						<label>Password</label>
					</div>
					<div class="inputBox">
						<input type="text" id="stateIn" name="stateIn" required="">
						<label>State</label>
					</div>
					<div class="inputBox">
						<input type="text" id="cityIn" name="cityIn" required="">
						<label>City</label>
					</div>
					<div class="inputBox">
						<input type="text" id="pinIn" name="pinIn" required="">
						<label>Pin</label>
					</div>
					<button type="submit" class="button"
					onsubmit="return validateForm()">Submit</button>
				</div>
				<br> <br>
			</form>
			</div>

			<div class="col-6">
				<div id="cara" class="carousel slide" data-ride="carousel">
					<ul class="carousel-indicators">
						<li data-target="#cara" data-slide-to="0" class="active"></li>
						<li data-target="#cara" data-slide-to="1"></li>
						<li data-target="#cara" data-slide-to="2"></li>
					</ul>

					<div class="carousel-inner" style="align:auto">
						<div class="carousel-item active">
							<img class="img" src="https://blogs.adobe.com/digitalmarketing/wp-content/uploads/2015/11/ecommerce-1.png" alt="Pic1">
						</div>
						<div class="carousel-item ">
							<img class="img" src="https://image.shutterstock.com/image-photo/women-shopping-summer-she-using-260nw-1027446970.jpg" alt="Pic2">
						</div>
						<div class="carousel-item ">
							<img class="img" src="https://thejibe.com/sites/default/files/article/images/B2B-eCommerce-2016-Trends.jpg" alt="Pic3">
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
