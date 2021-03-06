package dao;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.User;
import jdbc.JdbcCode;

public class DepositMoney extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

		HttpSession hs = request.getSession(false);
String c_user = (String) hs.getAttribute("current_user");
		
		try
		{
		if(c_user != null)
		{
			User u = (User) hs.getAttribute("userbean");
			String u_id = u.getUid();
				
			try
			{
				
				String veri_pass = request.getParameter("pass");
				String pass = u.getPassword();
			
				int acc_amt = u.getBalance();
			
				int d_amt = Integer.parseInt(request.getParameter("w_amt"));
			
				if(veri_pass.equals(pass))
				{

					if(d_amt > 0)
					{
					acc_amt = acc_amt + d_amt; 
					
					Class.forName(JdbcCode.driver);
					
					java.sql.Connection con = DriverManager.getConnection(jdbc.JdbcCode.url, JdbcCode.id ,"");
						
					PreparedStatement pst = con.prepareStatement("update customer_details set Balance = ? where Mail = ?");
					
					pst.setInt(1, acc_amt);
					pst.setString(2, u_id);
							
					int count = pst.executeUpdate();
				
//					System.out.println(count);
					
					if(count > 0)
					{
						String timestamp = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(new Date());
						
						PreparedStatement pst1 = con.prepareStatement("insert into transaction_history values (?,?,'Deposit',?,?)");
						pst1.setString(1, u.getUid());
						pst1.setInt(2, d_amt);
						pst1.setString(3, timestamp);
						pst1.setInt(4, acc_amt);
						
						int t_count = pst1.executeUpdate();
						
						if(t_count >0)
						{
//							System.out.println("Transaction History updated !!");
							request.setAttribute("withdraw_msg", "Deposit Successfull and Transaction History updated !!");
						}
						
						else
							System.out.println("Transaction History not updated !!");
						
						u.setBalance(acc_amt);
						
						RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
						rd.forward(request, response);
					}
					
					else
					{
						request.setAttribute("deposit_msg", "Deposit was not completed .. Please try again !!");
						RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
						rd.forward(request, response);
					}
					
					}
					
					else
					{
						request.setAttribute("deposit_msg", "Insufficient Balance !!");
						RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
						rd.forward(request, response);
					}
				}
				
				else
				{
					request.setAttribute("deposit_msg", "Wrong Password !!");
					RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
					rd.forward(request, response);
				}
			
			}
			
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			
			}
			
		}
		
		catch (Exception e) 
		{
			request.setAttribute("session_msg", "Session has expired .. Please Login again !!");
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}
	}
		
}
