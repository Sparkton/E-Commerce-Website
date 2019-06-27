package com.godrej.client;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.godrej.util.DbConnection;


/**
 * Servlet implementation class newLogin
 */
@WebServlet("/newLogin")
public class NewLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Try POST");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession sess = request.getSession();
		String uName = request.getParameter("uName");
		String uPass = request.getParameter("pass");
		Connection conn = null;
		Statement stmt = null;
		try {
			DbConnection util = new DbConnection();
			conn = util.getConn();
			stmt = conn.createStatement();
			String sql = "select  * from Login where EMAIL = '"+uName+"' AND PASS = '"+uPass+"'";
			int i = stmt.executeUpdate(sql);
			if(i==1){
				ResultSet rs = stmt.executeQuery("select * from Users where EMAIL = '"+uName+"' AND PASS = '"+uPass+"'");
				rs.next();
				request.setAttribute("ID", rs.getInt("USERID")); 
				request.setAttribute("uName",rs.getString("EMAIL")); 
				request.setAttribute("uPass", rs.getString("Pass"));
				request.setAttribute("State",rs.getString("State"));
				request.setAttribute("City", rs.getString("City"));
				request.setAttribute("Pincode", rs.getInt("Pin"));
				sess.setAttribute("ID", rs.getInt("USERID"));
				ResultSet temp = stmt.executeQuery("select isAdmin from USERS where USERID = '"+rs.getInt("USERID")+"'");
				temp.next();
				sess.setAttribute("authenticated", true);
				
				if(temp.getInt("isAdmin")==1) {
					System.out.println("BOIs an admin");
					sess.setAttribute("AdminAccess", true);
					RequestDispatcher rd = request.getRequestDispatcher("StartUpPage");//Send to Admin Page
					rd.forward(request, response);
				}
				else {
					System.out.println("BOIs a pleb");
					sess.setAttribute("AdminAccess", false);
					RequestDispatcher rd = request.getRequestDispatcher("jsp/Profile.jsp");//Send to normal page, figure it out 
					rd.forward(request, response);
				}
			}
			else {
				System.out.println("Wrong Input/Password");
				response.getWriter().println("prompt('Invalid Username/Password')");
				RequestDispatcher rd = request.getRequestDispatcher("StartUpLogin");
				rd.forward(request, response);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(conn != null) {
					conn.close();
				}
				if(stmt != null) {
					stmt.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//		List<User> tempList = new ArrayList<User>();
		//		tempList = userDao.search(1,uName);
		//		if(tempList.isEmpty() || tempList == null)
		//			response.sendRedirect("jsp/Login.jsp");
		//		for(User user:tempList) {
		//			if(user.getuPass().equals(uPass)) {
		//				
		//				  request.setAttribute("ID", user.getUserId()); 
		//				  request.setAttribute("uName",user.getuName()); 
		//				  request.setAttribute("uPass", user.getuPass());
		//				  request.setAttribute("State", user.getAddress().getState());
		//				  request.setAttribute("City", user.getAddress().getCity());
		//				  request.setAttribute("Pincode", user.getAddress().getPinCode());
		//				  RequestDispatcher rd = request.getRequestDispatcher("DisplaySingle");
		//				  rd.forward(request, response);
		//			}
		//			else {
		//				user=null;
		//				response.getWriter().print("UserName/Password incorrect");
		//				break;
		//			}
		//			
		//		}
	}
}

/*
 * out.println("<html><body><form action='UserUpdate'>");
 * out.println("<label>ID : <input type='text' name='serialIn'>"+i.getUserId()+
 * "</input></label>");
 * out.println("<label>Name: <input type='text' name='nameIn' id='nameIn'>\r\n "
 * +i.getuName()+"</label>");
 * out.println("<label>Password: <input type='text' name='passIn' id='passIn'>"
 * +i.getuPass()+"</input></label>");
 * out.println("<label>State : <input type='text' name='stateIn' id='stateIn'>"
 * +i.getAddress().getState()+"</input></label>");
 * out.println("<label>City: <input type='text' name='cityIn' id='cityIn'>\r\n"
 * +i.getAddress().getCity()+"</input></label>");
 * out.println("<label>PinCode: <input type='number' name='pinIn' id='pinIn'>"+i
 * .getAddress().getPinCode()+"</input></label>");
 * out.println("<button type='submit' class='button'>Update</button>");
 * out.println("</form></body></html>");
 */