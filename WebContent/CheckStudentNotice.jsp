<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.Notice" %>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="template1.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Check Student Notice</title>
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
			
		<h1>Notices</h1><br><br>
		<div id="notice">
		<table width="90%" bgcolor="#941414" border="1px" bordercolor="black">
			<%
				ArrayList<Notice> noticeList = (ArrayList<Notice>) request.getAttribute("NOTICE_LIST");
							for(Notice n:noticeList){
								out.println("<tr><td><a href='http://localhost:9090//CollegeManagementSystem//"+n.getUrlname()+"'>"+n.getName()+"</td></tr></a>");
							}
			%>
		</table><br><br>
		<a href="Faculty.jsp"><button id="submit">Back</button></a><br><br>
		</div>
	</center>
	</div>		
	
	<%} %>


</body>
</html>