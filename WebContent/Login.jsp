<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="loginbox.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript">
function clearText(field){

    if (field.defaultValue == field.value) field.value = '';
    else if (field.value == '') field.value = field.defaultValue;

}
</script>
<title>Login</title>
</head>
<body>
	<div id="templatemo_container">
		<div id="templatemo_banner">
    		<div id="logo"></div>
    	</div>	
		
		<div style="padding: 20px 0 10px 350px;">
			<div id="login-box">
				<center>
					<h1>LOGIN</h1>
				</center>

				<form action="AuthenticationServlet">
					<div id="login-box-name" style="margin-top:20px;">USERNAME: </div>
						<div id="login-box-field" style="margin-top:20px;"> <input type="text" name="username" class="form-login" size="30" value="Enter Email-id" onfocus="clearText(this)" onblur="clearText(this)"/> </div>
					<div id="login-box-name">PASSWORD: </div>
						<div id="login-box-field1"> <input name="userpass" type="password" class="form-login" size="30"/> </div>
		
					<span class="Login-type">
						<input type="radio" name="type1" value="Admin" required checked>Adminstrator 
						<input type="radio" name="type1" value="Faculty">Faculty 
						<input type="radio" name="type1" value="Student"> Student<br/><br/> 
					</span>
	
					<span class="login-box-options"><a href="ForgotPassword.jsp" style="margin-left:30px;">Forgot password?</a></span><br/><br/>
			
					<input type="submit" value="Login" id="submit" style="margin-left:115px;">
				</form>
			</div>
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

</body>
</html>