<%@page import="org.apache.catalina.startup.SetAllPropertiesRule"%>
<%@page import="model.Student"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<style type="text/css">
	#head1{
		float: right;
	}
	#options{
		float: right;
	}
</style>
<link href="template.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student</title>
</head>

<body>
	<div id="templatemo_container1">
		<div id="templatemo_banner">
			<div id="logo1"></div>
		</div>
	<%
			HttpSession s = request.getSession(false);
			
			String code = (String) s.getAttribute("SECRET");
			if (code == null) {
				out.println("You are not within the session .Please Login");
			} else {
				String username = (String) s.getAttribute("USERNAME");
				String maiLid=(String) s.getAttribute("mailid");
	%>
	<div style="padding: 30px; color: red;">    
		 <h1>
		       Welcome <%=username%>
		 </h1>
		<h4 style="float: right;"><a href="LogoutServlet">Logout</a></h4>
	</div>
	<br><br><br>
	<img src="images/gtbit.gif" width="400px" height="250px" style="padding-left: 30px;">
	<div id="options" style="padding: 30px 30px 0px 0px;">
		<img alt="lib" src="images/books.jpg" width="60px" height="35px">&nbsp;&nbsp;<a href="LibraryStudent.jsp">Visit Library</a><br><br>
		<%
			out.println("<img alt='myprofile' src='images/myprofile.jpg' width='60px' height='35px'>&nbsp;&nbsp; <a href='StudentProfileServlet?email_id="+maiLid+"'> My Profile </a>");
		%><br><br>
		<img alt="Notice" src="images/notices.jpg" width="60px" height="35px">&nbsp;&nbsp;<a href="ViewStudentNotice">View Notice</a><br><br>
		<br><br>
	</div><br>
	
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