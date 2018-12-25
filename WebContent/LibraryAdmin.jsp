<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
	a{
		text-decoration: none;
	}
</style>
<link href="template.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Library Admin</title>
</head>

<body>
	<div id="templatemo_container1">
		<div id="templatemo_banner">
			<div id="logo1"></div>
		</div>
		<%
			HttpSession s = request.getSession(false);

			String val = (String) s.getAttribute("SECRET");
			if (val == null) {
				out.println("You are not within the session .Please Login");
			} else {
				String username = (String) s.getAttribute("USERNAME");
		%>    
		
				
		<div style="background-image: url('images/librarypic.jpg'); color: red;">
			<h3 style="padding: 20px 0 0 20px;">
			       Welcome <%=username%>
	        </h3>
	        <h4 style="float: right; "><a href="LogoutServlet">Logout</a></h4>
		    <center>
			<h1>Welcome to GTBIT Library</h1><br><br>
				<a href="ViewLibServlet">
					<input type="submit" value="VIEW BOOKS" id="submit1">
				</a><br><br>
				
				<a href="AddBooks.jsp">
					<input type="submit" value="ADD NEW BOOKS" id="submit1">
				</a><br><br>
				
				<a href="UpdateLibServlet">
					<input type="submit" value="UPDATE BOOK DETAILS" id="submit1">
				</a><br><br>
				
				<a href="Admin.jsp">
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