package com.godrej.client;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.godrej.util.DbConnection;

@WebServlet("/StartUpCart")
public class StartUpCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ResultSet a = null;
		int arr;
		DbConnection util = new DbConnection();
		String id = request.getParameter("ID");
		Connection conn = util.getConn();
		try {
			Class.forName(util.getJDBC_Driver());
			PreparedStatement ps = conn.prepareStatement("select PID from Users WHERE ID = ?");
			ps.setString(1, id);
			a = ps.executeQuery();
			while(a.next()) {
				arr = a.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
		}
	}

}