<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<link href="template.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Library Faculty</title>
</head>

<body>
	<div id="templatemo_container1">
		<div id="templatemo_banner">
			<div id="logo1"></div>
		</div>

	<center>
		<%
			HttpSession s = request.getSession(false);

			String code = (String) s.getAttribute("SECRET");
			if (code == null) {
				out.println("You are not within the session .Please Login");
			} else {
				String username = (String) s.getAttribute("USERNAME");
		%>
	
		<div style="background-image: url('images/librarypic.jpg'); color: red;">
	        <h4 style="float: right; "><a href="LogoutServlet">Logout</a></h4><br>
		    <center><br><br><br><br>
			<h1>Welcome to GTBIT Library</h1><br><br><br>
				<a href="ViewFacultyLibServlet">
					<input type="submit" value="VIEW BOOKS" id="submit1">
				</a><br><br><br>
				<a href="Faculty.jsp">
					<input type="submit" value="BACK" id="submit1">
				</a><br><br><br>
			</center>
		</div>

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
		<%} %>
</body>
</html>