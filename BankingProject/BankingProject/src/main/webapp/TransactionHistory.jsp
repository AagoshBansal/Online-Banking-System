<%@page import="java.sql.ResultSet"%>
<%@page import="dto.User"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="jdbc.JdbcCode"%>
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
<title>TRANSACTION HISTORY</title>
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

	<p style="font-size: 30px; color: brown" align="center"><u><b>Transaction History</b></u></p>

	<table border="2" class="table" align="center">
		<th>Date</th>
		<th>Amount</th>
		<th>Transaction Type</th>
		<th>Current Balance</th>

		
	<% 
	try
	{
		HttpSession hs = request.getSession(false);
		String c_user = (String) hs.getAttribute("current_user");
		
		if(c_user != null)
		{	
		
			User u = (User)hs.getAttribute("userbean");
			
			Class.forName(JdbcCode.driver);
			
			java.sql.Connection con = DriverManager.getConnection(jdbc.JdbcCode.url, JdbcCode.id ,"");
			
			PreparedStatement pst1 = con.prepareStatement("select * from transaction_history where User_ID = ?");
			pst1.setString(1, u.getUid());
			
			ResultSet rs = pst1.executeQuery();
			
			while(rs.next())
			{
			%>	
				<tr>
					<td><%=rs.getString("Date") %></td>
					<td><%=rs.getInt("Amount") %></td>
					<td><%=rs.getString("Transaction_Type") %></td>
					<td><%=rs.getInt("Current_Amount") %></td>
				</tr>
			<%	
			}
			
		}	
			
		else
		{
			request.setAttribute("session_msg", "Session has expired .. Please Login again !!");
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}
		}
		
		catch (Exception e) {
			request.setAttribute("session_msg", "Session has expired .. Please Login again !!");
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}		
		
%>
	</table>
</body>
</html>