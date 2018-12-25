<%@page import="model.Faculty"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="template1.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Faculty</title>
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
		<table width="90%" bgcolor="#941414" border="1px" bordercolor="black">
			<thead>
				<th>Name</th>
				<th>Date of Birth</th>
				<th>Age</th>
				<th>Gender</th>
				<th>Phone No</th>
				<th>Address</th>
				<th>Pin</th>
				<th>Department</th>
				<th>Email id</th>
				<th>Education Details</th>
			</thead>
			<%
				ArrayList<Faculty> facultyList = (ArrayList<Faculty>) request.getAttribute("FACULTY_LIST");
							for(Faculty fl:facultyList){
								out.println("<tr><td>"+fl.getFname()+" "+fl.getMname()+" "+fl.getLname()+"</td><td>"+fl.getDob_d()+"-"+fl.getDob_m()+"-"+fl.getDob_y()+"</td><td>"+fl.getAge()+"</td><td>"+fl.getGender()+"</td><td>"+fl.getPhno()+"</td><td>"+fl.getAddress()+"</td><td>"+fl.getPin()+"</td><td>"+fl.getDeptt()+"</td><td>"+fl.getEmail_id()+"</td><td>"+fl.getEduc()+"</td></tr>");
							}
			%>
		</table><br><br>
		<a href="Admin.jsp"><button id="submit">Back</button></a><br><br>
		</div>
	</center>
	</div>		
	
	<%} %>

</body>
</html>
