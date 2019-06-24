package com.godrej.client;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.godrej.util.DbConnection;

@WebServlet("/PdtBuy")
public class PdtBuy extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String id;		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		id = request.getParameter("PID");
		DbConnection util = new DbConnection();
		Connection conn = util.getConn();
		Statement stmt = null;
		try {
			Class.forName(util.getJDBC_Driver());
			stmt = conn.createStatement();
			PreparedStatement ps = conn.prepareStatement("insert into PRODUCTBOUGHT values(?,?)");
			ps.setString(1, request.getParameter("ID"));
			ps.setString(2, id);
			ps.execute();
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

