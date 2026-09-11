<!DOCTYPE html>
<html>
<head>
	<title>Admin Login </title>
	<link rel="stylesheet" type="text/css" href="adminlogin.css">
	<link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/a81368914c.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body style="background-color: skyblue;">
	<img class="wave" src="">
	<div class="container">
		<div class="img">
			<img src="source\img\glogo.png">
		</div>
		<div class="login-content">
			<form action="loginservlet">
				<img src="source\img\glogo.png">GWY TRAINING CENTRE
				<h2 class="title"><a href="Home.jsp"> Welcome to admin</a></h2>
           		<div class="input-div one">
           		   <div class="i">
           		   		<i class="fas fa-user"></i>
           		   </div>
           		   <div class="div">
           		   		<h5>Username</h5>
           		   		<input type="text" class="input" name="name">
           		   </div>
           		</div>
           		<div class="input-div pass">
           		   <div class="i"> 
           		    	<i class="fas fa-lock"></i>
           		   </div>
           		   <div class="div">
           		    	<h5>Password</h5>
           		    	<input type="password" class="input" name="pass">
            	   </div>
            	</div>
            	<br>
            	<input type="reset" class="btn" value="Reset" style="width: 30%;">
            	<input type="submit" class="btn" value="Login" style="width: 30%;">
            </form>
        </div>
    </div>
    <script type="text/javascript" src="adminlogin.js"></script>
</body>
</html>
