<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="style.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>LOGIN HERE</title>
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
}

tr:nth-child(even) {
    background-color: #f2f2f2
}
</style>

</head>

<body>

<%
	String msg = "";
	
	msg = (String)request.getAttribute("errormsg");
	
	if(msg != null)
	{
	%>
		<h1 style="color: red" align="center"><%=msg %></h1>
	<%
	}
	
	String s_msg = (String) request.getAttribute("session_msg");
	
	if(s_msg != null)
	{
	%>
		<h1 style="color: red" align="center"><%=s_msg %></h1>
	<%
	}
	
%>

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
	

<form action="CheckUser" method="post">
	<div class="form-group">

		<table  class="table" border="2" align="center">
		<tr>
			<td>Enter ID :</td>
			<td><input type="text" name="u_id" required style="width: 400px"></td>
		</tr>
		<tr>
			<td>Enter Password :</td>
			<td><input type="password" name="u_pass" required style="width: 400px"></td>
		</tr>
		<tr>
		</tr>
	</table>
	<br>
	
		<p><a href="">Forgot Password ?</a></p>
		
	<br>
		<input type="submit" value="SUBMIT" class="button">
		<input type="reset" class="button" value="CLEAR">
	
		<br><br>
	<p align="left">NEW USER ? <a href="register.jsp" >CLICK HERE TO REGISTER !!</a>
	</p>
	</div>	
	</form>

</body>
</html>