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
<style>
table {
	border-collapse: collapse;
	background-color: white;
	border:1px solid black;
	box-shadow: 0 15px 25px rgba(0,0,0,.5);
    border-radius: 10px;
    border-color: #fff;

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
	background: url("https://images.pexels.com/photos/593322/pexels-photo-593322.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940");
}
p {
	background-color: DodgerBlue;
	height: 50px;
	width: 50%;
	margin-left: auto;
	margin-right: auto;
	box-shadow: 3px 5px 9px 1px black;
}
tbody tr:hover {
	background-color: rgba(25,25,25,0.3);
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
    width: 35%;
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
.inputBox {
	position: relative;
}
.inputBox input {
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
.inputBox label {
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
.myButton1 {
	-moz-box-shadow: 0px 0px 0px 0px #3dc21b;
	-webkit-box-shadow: 0px 0px 0px 0px #3dc21b;
	box-shadow: 0px 0px 0px 0px #3dc21b;
	background-color:#44c767;
	-moz-border-radius:28px;
	-webkit-border-radius:28px;
	border-radius:28px;
	border:1px solid #18ab29;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:17px;
	padding:3px 10px;
	text-decoration:none;
	text-shadow:0px 1px 0px #2f6627;
}
.myButton1:hover {
	background-color:#5cbf2a;
}
.myButton1:active {
	position:relative;
	top:1px;
}
.myButton2 {
	-moz-box-shadow: 0px 0px 0px 0px #3dc21b;
	-webkit-box-shadow: 0px 0px 0px 0px #3dc21b;
	box-shadow: 0px 0px 0px 0px #3dc21b;
	background-color:#0e69e8;
	-moz-border-radius:28px;
	-webkit-border-radius:28px;
	border-radius:28px;
	border:1px solid #18ab29;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:17px;
	padding:3px 10px;
	text-decoration:none;
	text-shadow:0px 1px 0px #2f6627;
}
.myButton2:hover {
	background-color:#0655c4;
}
.myButton2:active {
	position:relative;
	top:1px;
}
.myButton3 {
	-moz-box-shadow: 0px 0px 0px 0px #3dc21b;
	-webkit-box-shadow: 0px 0px 0px 0px #3dc21b;
	box-shadow: 0px 0px 0px 0px #3dc21b;
	background-color:#d64b3e;
	-moz-border-radius:28px;
	-webkit-border-radius:28px;
	border-radius:28px;
	border:1px solid #18ab29;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:17px;
	padding:3px 10px;
	text-decoration:none;
	text-shadow:0px 1px 0px #2f6627;
}
.myButton3:hover {
	background-color:#d63829;
}
.myButton3:active {
	position:relative;
	top:1px;
}
}
</style>
</head>
<body>
	<div class="navbar">
		<div style:align="left">
			<a href="DisplayProfile">User</a>
		</div>
		<h1 style="color:#ffffff">Product Data</h1>
		<div style:align="right">
			<a href="StartUpCart">Cart</a> <a href="UserDisplay">LogOut</a> 
		</div>
	</div>
	<br><br><br>
	<div class="container" id="myCont">
		
		<!-- <table style="width=20%" id="myTable"> -->
		<br><br><br><br><br>	
		<table class="container" id="myTable" >
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
				int ctr = 1;
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
										+ ctr + ")'>Update</button>");
						out.print("<button id='deleteButton'  type='button' class='button' onclick='pDelete("
								+ rs.getInt("PID") + ")'>Delete</button><br></td>");
							out.print("<td><button id='buyButton'  type='button' class='button' onclick='PdtBuyLocal("
									+ rs.getInt("PID") + ")'>Purchase</button></td>");
						out.print("</tr>");
						ctr++;
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

		<br> <br><br><br><br><br><br><br><br><br><br><br>

		<div class="row">
			<div align="left" class="col-md">
				<form method="post" onsubmit="return validateForm()" autocomplete="off">
					<div class="form-group">
					<form>
					<!-- <label>ID : <input type="text" name="serialIn" id="serialIn"></label> <br> -->
						<div class="inputBox"> <input type="text" name="nameIn" id="nameIn" required=""><label>Name  </label></div> <br>
						<div class="inputBox"> <input type="text" name="catIn" id="catIn" required=""><label>Category  </label></div><br>
						<div class="inputBox"> <input type="text" name="priceIn" id="priceIn" required=""><label>Price  </label></div>
						<br>
						<button type="submit" class="button" formaction="PdtAdd">Create</button>
						<br> <br> <br>
						</form>
					</div>
				</form>
			</div>
		</div>
		<div id="myModal" class="Modal">
			<div class="form-popup" id="myForm">
				<form action="PdtUpdate" class="form-container" method="post" onsubmit = "return pUpdate()">
					<h1>Update</h1>
					<label><b>ID</b></label> 
					<input type="text" name="updateID" id="updateId" readonly><label><b>Name</b></label> 
					<input type="text" name="updateName" id="updateName"><label><b>Category</b></label>
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
