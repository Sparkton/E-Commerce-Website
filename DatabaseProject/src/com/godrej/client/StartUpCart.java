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

@WebServlet("/StartUpCart")
public class StartUpCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sess = request.getSession();
		if(!(boolean)sess.getAttribute("authenticated")==true || sess.getAttribute("authenticated") == null)
			response.sendRedirect("StartUpPage");
		ResultSet a = null;
		String id = (String) request.getSession().getAttribute("ID");
		Connection conn = null;
		Statement stmt = null;
		try {
			DbConnection util = new DbConnection();
			conn = util.getConn();
			stmt = conn.createStatement();
			String sql = "select * FROM ProductBought where USERID = '"+id+"'";
			a = stmt.executeQuery(sql);
			request.setAttribute("productsList", a);
			RequestDispatcher rd = request.getRequestDispatcher("jsp/Cart.jsp");
			rd.forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
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
	}

}