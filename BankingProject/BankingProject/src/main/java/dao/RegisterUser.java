package dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.JdbcCode;

public class RegisterUser extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String name = request.getParameter("u_name");
		String mail = request.getParameter("u_mail");
		String pass = request.getParameter("u_pass");
		String phone = request.getParameter("u_phone");
		String address = request.getParameter("u_address");
		String city = request.getParameter("u_city");
		int balance = Integer.parseInt(request.getParameter("u_balance"));
		
		
		
		try
		{
			
		Class.forName(JdbcCode.driver);
		java.sql.Connection con = DriverManager.getConnection(JdbcCode.url,JdbcCode.id,"");
		PreparedStatement pst = con.prepareStatement("insert into customer_details values(?,?,?,?,?,?,?)");

		pst.setString(1, name);
		pst.setString(2, mail);
		pst.setString(3, pass);
		pst.setString(4, phone);
		pst.setString(5, address);
		pst.setString(6, city);
		pst.setInt(7, balance);
		
		int count = pst.executeUpdate();
		PrintWriter pd = response.getWriter();

		if(count > 0)
		{
			pd.print("<h1>Congratulations "+ name +"... you are Registered !!!</h1>");
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.include(request, response);
		}		
		
		else
		{
			pd.print("<h1>Sorry "+ name +"... some error occurred !!!</h1>");
			RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
			rd.forward(request, response);
		}
		
		}

		catch (Exception e) 
		{
			PrintWriter pd = response.getWriter();
			pd.print("There was an Exception in Code !!!");
		}
	
	}

}
