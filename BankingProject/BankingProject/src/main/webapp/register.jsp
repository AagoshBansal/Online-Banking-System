<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript">

function check()
{
	var val = document.getElementById("upass").value
	var box = document.getElementById("upasscheck")

	if (val.length < 5) 
	{
		box.innerHTML = "Password Short"
		box.style.color = "red"
	}	

	else{
		box.innerHTML = "Password Good"
		box.style.color = "green"
	}
}
</script>

  <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="style.css">
<title>REGISTRATON FORM</title>
<style>
table {
    border-collapse: collapse;
    border-spacing: 0;
    width: 100%;
    border: 1px solid #ddd;
}

th, td {
    text-align: left;
    padding: 16px;
	width: 25%;
}

tr:nth-child(even) {
    background-color: #f2f2f2
}
</style>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Online Banking App</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="login.jsp">Login</a></li>
      <li><a href="register.jsp">Register Here</a></li>
    </ul>
  </div>
</nav>

	<form action="RegisterUser" method="post">

		<table class="table" align="center" border="2">
			<tr>
				<td>Name :</td>
				<td><input type="text" id="u_name" required></td>
				<td></td>
			</tr>
			<tr>
				<td>E-mail :</td>
				<td><input type="text" id="u_mail" required></td>
				<td></td>
			</tr>
			<tr>
				<td>Password :</td>
				<td><input type="password" id="u_pass" required onkeyup="check()"></td>
				<td id="v_pass"></td>
			</tr>
			<tr>
				<td>Re-enter Password :</td>
				<td><input type="password" id="u_repass" required></td>
				<td></td>
			</tr>
			<tr>
				<td>Phone No. :</td>
				<td><input type="text" id="u_phone" required></td>
				<td></td>
			</tr>
			<tr>
				<td>Address :</td>
				<td><input type="text" id="u_address" required></td>
				<td></td>
			</tr>
			<tr>
				<td>City :</td>
				<td><input type="text" id="u_city" required></td>
				<td></td>
			</tr>
			<tr>
				<td>Balance :</td>
				<td><input type="text" id="u_balance" required></td>
				<td></td>
			</tr>
		</table>
		<br>
		<p align="left">
			<input type="submit" value="SUBMIT" class="button">
			<input type="reset" value="CLEAR" class="button">
		</p>
	</form>	
</body>
</html>