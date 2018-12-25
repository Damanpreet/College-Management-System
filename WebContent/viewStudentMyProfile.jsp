<%@page import="model.Student"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="template.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Student Profile</title>
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
			
			<h1>Student Information</h1><br><br>
			<div id="book">
			<table width="40%" bgcolor="#941414" border="1px" bordercolor="black">
	
			<%
				ArrayList<Student> studentList = (ArrayList<Student>) request.getAttribute("STUDENT_LIST");
					for(Student st:studentList){
						out.println("<tr><td>Name: </td><td>"+st.getFname()+" "+st.getMname()+" "+st.getLname()+"</td></tr><tr><td>Date of Birth: </td><td>"+st.getDob_d()+"-"+st.getDob_m()+"-"+st.getDob_y()+"</td></tr><tr><td>Age: </td><td>"+st.getAge()+"</td></tr><tr><td>Gender: </td><td>"+st.getGender()+"</td></tr><tr><td>Phone No: </td><td>"+st.getPhno()+"</td></tr><tr><td>Address: </td><td>"+st.getAddress()+"</td></tr><tr><td>Pin Code: </td><td>"+st.getPin()+"</td></tr><tr><td>Stream: </td><td>"+st.getStream_type()+"</td></tr><tr><td>Session: </td><td>"+st.getSession_id1()+" - "+st.getSession_id2()+"</td></tr><tr><td>Email id: </td><td>"+st.getEmail_id()+"</td></tr><tr><td>Class10 Percentage: </td><td>"+st.getPerc10()+"</td></tr><tr><td>Class12 Percentage: </td><td>"+st.getPerc12()+"</td></tr>");
					}
			%>
		</table><br><br>
		<a href="Student.jsp"><button id="submit">Back</button></a><br><br><br><br>
		</div>
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
		<%} %>		
</body>
</html>
