<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<link href="template.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Faculty Register</title>
<script type="text/javascript">
function funcSubmit()
{
	if(reg.pass.value != reg.cpass.value)
	{
		alert('Error: Passwords do not match');   
		return false;
	}
	if(reg.pass.value != "" && reg.pass.value == reg.cpass.value) {
	      if(reg.pass.value.length < 9) {
	        alert("Error: Password must contain at least 9 characters!");
	        return false;
	      }
	      re=/[@,!,$,*]/;
	      if(!re.test(reg.pass.value)) {
		        alert("Error: Password must contain at least one special character (@,!,$,*)");
		        return false;
		  }	      
	      re = /[0-9]/;
	      if(!re.test(reg.pass.value)) {
	        alert("Error: Password must contain at least one number (0-9)!");
	        return false;
	      }
	      re = /[a-z]/;
	      if(!re.test(reg.pass.value)) {
	        alert("Error: Password must contain at least one lowercase letter (a-z)!");
	        return false;
	      }
	      re = /[A-Z]/;
	      if(!re.test(reg.pass.value)) {
	        alert("Error: PPassword must contain at least one uppercase letter (A-Z)!");
	        return false;
	      }
	   } 
}
</script>
</head>

<body>

<div id="templatemo_contain">
	<div id="templatemo_banner">
		<div id="logo1"></div>
	</div>
	
	<form action="AddFacultyServlet" name="reg" onsubmit="return funcSubmit(this);" style="padding-left: 80px;">
		Name: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="fname" required> - <input type="text" name="mname" required> - <input type="text" name="lname"><br><br>
		
		Date of Birth: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="Number" name="dob_d" max="31" min="1" step="1" required> - <input type="Number" name="dob_m" max="12" min="1" step="1" required> - <input type="Number" name="dob_y" max="2010" min="1954" step="1" required><br><br>
		
		Age: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="Number" name="age" max="60" min="21" step="1" required><br><br>
		
		Gender: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="gender" value="male" required checked>Male
				<input type="radio" name="gender" value="female" required>Female<br><br>
		
		Phone no.: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="Double" name="phno" required><br><br>
		
		Address: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="address" required><br><br>
		
		Pin Code: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="pin" required><br><br>
		
		Department: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<select name="stream_type" required>
						<option>Department of Computer Science and Engineering</option>
						<option>Department of Information Technology</option>
						<option>Department of Electronics and Communication Engineering</option>
						<option>Department of Electrical and Electronics Engineering</option>
						<option>Department of Applied Sciences and Engineering</option>
					</select><br><br>
		
		Email Id: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="email" name="email_id" required><br><br>
		
		Password: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="password" name="pass" required> &nbsp; <a href="PasswordCondition.html">Password Strength</a><br><br>
		
		Confirm password: &nbsp;&nbsp;&nbsp;
			<input type="password" name="cpass" required><br><br>
		
		Qualification: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="educ" required><br><br><br>
			
		Security Question: &nbsp; &nbsp;
				<select name="secques" required>
					<option>Who is your favorite singer?</option>
					<option>What is your Mothers Maiden name?</option>
					<option>Who was your first class teacher?</option>
					<option>Which is your favorite pet?</option>
					</select><br><br>
			
		Answer: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" name="secans"><br><br><br>
				
		<div style="padding-left: 120px;">
			<input type="submit" value="Submit"><br><br>
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
</body>

</html>