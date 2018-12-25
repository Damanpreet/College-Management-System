<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<link href="template.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forgot Password</title>
</head>

<body>
<div id="templatemo_container">
		<div id="templatemo_banner">
			<div id="logo"></div>
		</div>
	
	<br>
	<h1 style="padding-left: 60px;">Retrieve Password</h1><br><br>
		
			<form action="PasswordRetrieve">
			<div style="padding-left: 60px;">		
			Email: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" name="email"><br><br>
	
			Security Question: 
				<select name="secques" required>
					<option>Who is your favorite singer?</option>
					<option>What is your Mothers Maiden name?</option>
					<option>Who was your first class teacher?</option>
					<option>Which is your favorite pet?</option>
				</select><br><br>
	
			Answer: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				<input type="text" name="secans" required><br><br>
				
			<span class="Login-type" style="padding-left: 50px;">
						<input type="radio" name="type1" value="Faculty">Faculty 
						<input type="radio" name="type1" value="Student"> Student<br/><br/> 
			</span><br>
			</div>
			
			<div style="padding-left: 140px;">
				<input type="submit" value="Send Mail">
			</div>
		</form>
		<br><br><br><br><br><br><br><br><br><br><br>
		<div id="templatemo_footer">
			<ul class="footer_list">
				<li><a href="homepage.jsp" class="current">Home</a></li>
				<li><a href="AboutUs.jsp">About us</a></li>
				<li><a href="ContactUs.jsp">Contact us</a></li>
				<li><a href="Register.jsp">Register</a></li>
				<li><a href="Login.jsp">Login</a></li>
			</ul>
			
			<div class="margin_bottom_10"></div>
			<center>
				Copyright © 2014 Software by <a href="">Manpreet</a>, <a href="">Kuljeet</a> and <a href="">Damanpreet</a>
			</center>
			<div class="margin_bottom_10"></div>
	</div>
</div>

</body>
</html>