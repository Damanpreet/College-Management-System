<%@page import="model.Student"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="template1.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Student</title>
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
		<table width="90%" bgcolor="#941414" border="1px" bordercolor="black">
			<thead>
				<th>Name</th>
				<th>Date of Birth</th>
				<th>Age</th>
				<th>Gender</th>
				<th>Phone No</th>
				<th>Address</th>
				<th>Pin</th>
				<th>Stream</th>
				<th>Session</th>
				<th>Email id</th>
				<th>Class10 percentage</th>
				<th>Class12 percentage</th>
			</thead>
			<%
				ArrayList<Student> studentList = (ArrayList<Student>) request.getAttribute("STUDENT_LIST");
							for(Student st:studentList){
								out.println("<tr><td>"+st.getFname()+" "+st.getMname()+" "+st.getLname()+"</td><td>"+st.getDob_d()+"-"+st.getDob_m()+"-"+st.getDob_y()+"</td><td>"+st.getAge()+"</td><td>"+st.getGender()+"</td><td>"+st.getPhno()+"</td><td>"+st.getAddress()+"</td><td>"+st.getPin()+"</td><td>"+st.getStream_type()+"</td><td>"+st.getSession_id1()+" - "+st.getSession_id2()+"</td><td>"+st.getEmail_id()+"</td><td>"+st.getPerc10()+"</td><td>"+st.getPerc12()+"</td></tr>");
							}
			%>
		</table><br><br>
		<a href="Admin.jsp"><button id="submit">Back</button></a>
		</div>
	</center>
	</div>		
		<%} %>	
</body>
</html>
