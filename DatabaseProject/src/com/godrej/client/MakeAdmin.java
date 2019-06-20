package com.godrej.client;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.godrej.util.DbConnection;

@WebServlet("/MakeAdmin")
public class MakeAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int i = Integer.parseInt(request.getParameter("ID"));
		int check = Integer.parseInt(request.getParameter("check"));
		DbConnection util = new DbConnection();
		Connection conn = util.getConn();
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
			Class.forName(util.getJDBC_Driver());
			if(check==1)
				stmt.execute("update Users set isAdmin = 1 where USERID = "+i);
			else
				stmt.execute("update Users set isAdmin = 0 where USERID = "+i);				
				
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
