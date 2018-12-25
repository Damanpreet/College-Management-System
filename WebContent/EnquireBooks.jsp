<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="template.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Enquire Books</title>
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
		</center>
		
		<br><br>
		<form action="UpdateBooksServlet" style="padding-left: 100px;">
			Book Type: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<select name="btype">  
						<option>Teacher Copy</option>
						<option>Student Copy</option>
					</select><br><br><br>
		
			Book Name: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name="bname"><br><br><br> 
		
			Book Author: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name="bauthor"><br><br><br> 
		
			No of Copies available: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="Number" name="nocopies"><br><br><br> 
					
			<div style="padding-left: 90px;">		
			<input type="submit" value="Submit" id="submit"><br><br><br>
			</div>
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
				Copyright © 2014 Software by <a href="">Manpreet</a>, <a href="">Kuljeet</a> and <a href="">Damanpreet</a>
			</center>
			<div class="margin_bottom_10"></div>
		</div>
	</div>
	<%  }  %>


</body>
</html>