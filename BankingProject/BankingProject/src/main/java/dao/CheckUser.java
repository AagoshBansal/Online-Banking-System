package dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.User;
import jdbc.JdbcCode;

public class CheckUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("u_id");
		String pass = request.getParameter("u_pass");
		
		try
		{
			
		Class.forName(JdbcCode.driver);
		
		java.sql.Connection con = DriverManager.getConnection(jdbc.JdbcCode.url, JdbcCode.id ,"");
		
		PreparedStatement pst = con.prepareStatement("select * from customer_details where Mail = ? and Password = ?");
		pst.setString(1, id);
		pst.setString(2, pass);
		
		ResultSet rs = pst.executeQuery();
		
		if(rs.next())
		{
			HttpSession hs = request.getSession(true);
			
			User u = new User();
			
			u.setName(rs.getString("Name"));
			u.setUid(rs.getString("Mail"));
			u.setPassword(rs.getString("Password"));
			u.setPh_no(rs.getString("Phone_Number"));
			u.setAddress(rs.getString("Address"));
			u.setCity(rs.getString("City"));
			u.setBalance(rs.getInt("Balance"));
			
			hs.setAttribute("current_user", rs.getString("Mail"));
			hs.setAttribute("userbean", u);
			
			RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
			rd.forward(request, response);
			
		}
		
		else 
		{
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			request.setAttribute("errormsg", "Invalid User ID or Password !!");
			rd.forward(request, response);
		}
		
		}
		
		catch (Exception e)
		{
			PrintWriter pd = response.getWriter();
			pd.print("Some Exception Occurred !!!!!!");
			e.printStackTrace();
		}
		
		}

	}
	
