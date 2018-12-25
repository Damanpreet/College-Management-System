<%@page import="model.Books"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="template1.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Books</title>
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
			
		<br><h1>Books Information</h1><br><br>
		<div id="book">
		<table width="80%" bgcolor="#941414" border="1px" bordercolor="black">
			<thead>
				<th>Book Type</th>
				<th>Book Name</th>
				<th>Book Author</th>
				<th>No of Copies Available</th>
			</thead>
			<%
				ArrayList<Books> bookList = (ArrayList<Books>) request.getAttribute("BOOK_LIST");
							for(Books bl:bookList){
								out.println("<tr><td>"+bl.getbtype()+"</td><td>"+bl.getbname()+"</td><td>"+bl.getbauthor()+"</td><td>"+bl.getnocopies()+"</td></tr>");
							}
			%>
		</table><br><br>
		<a href="AddBooks.jsp"><button id="submit1">ADD NEW BOOKS</button></a> &nbsp;
		<a href="LibraryAdmin.jsp"><button id="submit1">BACK</button></a>
		</div><br><br>
		</center>
		<%} %>		
</body>
</html>
