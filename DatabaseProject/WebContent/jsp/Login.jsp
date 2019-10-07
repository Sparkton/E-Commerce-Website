<<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="utf-8">
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
    margin: 0;
    padding: 0;
    font-family: courier;
    background: url("https://outlane.co/wp-content/uploads/2018/03/pattern.png");
    <!-- background-size: cover; -->
}

h1	{
	margin-top: 80px;
	text-align: center;
	color: #fff;
}
.box {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 400px;
    padding: 40px;
    background: rgba(0,0,0,.7);
    box-sizing: border-box;
    box-shadow: 0 15px 25px rgba(0,0,0,.5);
    border-radius: 10px;
}

h2 {
    margin: 0 0 30px;
    padding: 0;
    color: #fff;
    text-align: center;
}

.box .inputBox {
    position: relative;
}

.box .inputBox input {
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

.box .inputBox label {
    position: absolute;
    top: 0;
    left: 0;
    padding: 10px 0;
    font-size: 16px;
    color: #fff;
    pointer-events: none;
    transition: .5s; 
}

.box .inputBox input:focus ~ label,
.box .inputBox input:valid ~ label {
    top: -20px;
    left: 0;
    color: #03a9f4;
    font-size: 12px;
}

.box input[type="submit"] {
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
    width: 60%;
}

.box input[type="button"] {
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
    width: 60%;
}
.buttons {
	text-align: center;
}

* {
user-select: none;
-moz-user-select: none;
-webkit-user-select: none;
-ms-user-select: none;
}

.google-btn {
  width: 184px;
  height: 42px;
  background-color: #4285f4;
  border-radius: 2px;
  box-shadow: 0 3px 4px 0 rgba(0,0,0,.25);
  margin: auto;
}
  .google-icon-wrapper {
    position: absolute;
    margin-top: 1px;
    margin-left: 1px;
    width: 40px;
    height: 40px;
    border-radius: 2px;
    background-color: #fff;
  }
  .google-icon {
    position: absolute;
    margin-top: 11px;
    margin-left: 11px;
    width: 18px;
    height: 18px;
  }
  .btn-text {
    float: right;
    margin: 13px 5px 0 0;
    color: #fff;
    font-size: 14px;
    letter-spacing: 0.2px;
    font-family: "Roboto";
  }
  .btn-text:hover { /* this part aint working */
    box-shadow: 0 0 6px #4285f4;
  }
  .btn-text:active { /* this part as well */
    background: #1669F2;
  }
}

@import url(https://fonts.googleapis.com/css?family=Roboto:500);
    </style>
	<script>
	var val;
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
    	<div class="intro">
    		<h1>Welcome to Cubix</h1>
    	</div><br><br>
        <div class="box">
            <h2 align="center">Login</h2>
            <form method="post" onsubmit="return isEmpty()" action="newLogin"
			method="post" style="display: grid;">
                <div class="inputBox">
                    <input type="text" name="uName" id="uName" required="">
                    <label>username</label>
                </div>
                <div class="inputBox">
                    <input type="password" name="pass" id="pass" required="">
                    <label>password</label>
                </div>
                <div class="buttons">
	                <input type="submit" name="" value="Log In">
	                <br><br>
	                <input type="button" action="StartUpRegister" name="" value="Register">
					<br><br>
	                <input type="button" value="Reset Password">
	            </div>
            </form>
            <div class="google-btn">
  				<div class="google-icon-wrapper">
    				<img class="google-icon" src="https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg"/>
  				</div>
  				<p class="btn-text"><b>Sign in with Google</b></p>
			</div>
        </div>
    </body>
</html>
