<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="jdbc.JdbcCode"%>
<%@page import="dto.User"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="style.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>HOME PAGE</title>
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
	
	String w_msg = "";

	w_msg = (String)request.getAttribute("withdraw_msg");

	if(w_msg != null)
	{
	%>
		<h1 style="color: red"><p align="center"><%=w_msg %></p></h1>
	<%
	}

	String d_msg = "";

	d_msg = (String)request.getAttribute("deposit_msg");

	if(d_msg != null)
	{
	%>
		<h1 style="color: red"><p align="center"><%=d_msg %></p></h1>
	<%
	}
	
	HttpSession hs = request.getSession(false);
	
	if(hs != null)
	{
	User u = (User)hs.getAttribute("userbean");

%>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Online Banking App</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="home.jsp">Home</a></li>
      <li><a href="WithdrawMoney.jsp">Withdraw Money</a></li>
      <li><a href="DepositMoney.jsp">Deposit Money</a></li>
      <li><a href="TransactionHistory.jsp">Transaction History</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="logout.jsp"><span class="glyphicon glyphicon-user"></span> Log Out</a></li>
    </ul>
  </div>
</nav>

<p style="font-size: 30px" align="center"><u><b>Account Details</b></u></p>

<table class="table" border="2"  align="center">
	<tr>
		<th>Name</th>
		<td><%=u.getName() %></td>
	</tr>
	<tr>
		<th>Registered ID</th>
		<td><%=u.getUid() %></td>
	</tr>
	<tr>
		<th>Address</th>
		<td><%=u.getAddress() %></td>
	</tr>
	<tr>
		<th>Phone No.</th>
		<td><%=u.getPh_no() %></td>
	</tr>
	<tr>
		<th>City</th>
		<td><%=u.getCity() %></td>
	</tr>
	<tr>
		<th>Balance</th>
		<td><%=u.getBalance() %></td>
	</tr>
	
</table>

</body>
<%
	}
%>
</html>