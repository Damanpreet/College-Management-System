<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="template.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
</head>

<body>
	<div id="templatemo_container">
		<div id="templatemo_banner">
			<div id="logo"></div>
		</div>
		<br><br><br>
		<center>
			<div style="color: red;">
			<h2>Register a Student/Teacher</h2><br>
			<h4>To register a new Student choose Register Student and click the SUBMIT button.</h4>
			<h4>To register a new Teacher choose Register Faculty and click the SUBMIT button.</h4><br><br><br></div>
			
			<form action="RegistrationServlet">
				<h3><input type="radio" name="type1" value="Faculty">Register Faculty &nbsp;
				<input type="radio" name="type1" value="Student">Register Student<br><br><br><br>
				 <input type="submit" value="Register" id="submit"></h3>
			</form><br><br>
			<a href="homepage.jsp"><button id="submit">Back</button></a><br><br><br><br>
		</center>
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