<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="template1.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Faculty Delete Success</title>
</head>
<body>
	<div id="templatemo_container">
		<div id="templatemo_banner">
			<div id="logo"></div>
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
	
	<form action="UpdateFacultyServlet">
	<h1>Successfully Deleted!</h1>
	<input type="submit" value="Back">
	</form>
	
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
				Copyright � 2014 Software by <a href="">Manpreet</a>, <a href="">Kuljeet</a> and <a href="">Damanpreet</a>
			</center>
			<div class="margin_bottom_10"></div>
		</div>
	</center>
	<%} %>
	</div>
</body>
</html>