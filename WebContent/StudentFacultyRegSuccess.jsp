<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="template.css" rel="stylesheet" type="text/css">
<title>Student and Faculty Registration Success</title>
</head>
<body>
<div id="templatemo_container">
	<div id="templatemo_banner">
		<div id="logo"></div>
	</div>
	
	<center>
		<div style="color: red;">
			<br><br><br><br><br><br><br><h1>SUCCESSFULLY REGISTERED</h1><br><br><br>
		</div>	
		
		<!--  Display Username and Password -->
		<h3>Your USERNAME is  <b> <%= request.getAttribute("emailid") %> </b></h3><br>
		<h3>Your PASSWORD is <b> <%= request.getAttribute("pass") %> </b></h3><br><br>
		
		<a href="homepage.jsp"><button>Back</button></a><br><br><br><br><br><br>
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