<%@page import="model.Faculty"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="template.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Faculty Profile</title>
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
			
		<h1>Faculty Information</h1><br><br>
		<div id="book">
		<table width="40%" bgcolor="#941414" border="1px" bordercolor="black">
			<%
				ArrayList<Faculty> facultyList = (ArrayList<Faculty>) request.getAttribute("FACULTY_LIST");
							for(Faculty fa:facultyList){
								out.println("<tr><td>Name: </td><td>"+fa.getFname()+" "+fa.getMname()+" "+fa.getLname()+"</td></tr><tr><td>Date of Birth: </td><td>"+fa.getDob_d()+"-"+fa.getDob_m()+"-"+fa.getDob_y()+"</td></tr><tr><td>Age: </td><td>"+fa.getAge()+"</td></tr><tr><td>Gender: </td><td>"+fa.getGender()+"</td></tr><tr><td>Phone No: </td><td>"+fa.getPhno()+"</td></tr><tr><td>Address: </td><td>"+fa.getAddress()+"</td></tr><tr><td>Pin Code: </td><td>"+fa.getPin()+"</td></tr><tr><td>Department: </td><td>"+fa.getDeptt()+"</td></tr><tr><td>Email id: </td><td>"+fa.getEmail_id()+"</td></tr><tr><td>Education Details: </td><td>"+fa.getEduc()+"</td></tr>");
							}
			%>
		</table><br><br>
		<a href="Faculty.jsp"><button id="submit">Back</button></a>
		</div>
		</center><br><br><br><br><br><br>
		
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
