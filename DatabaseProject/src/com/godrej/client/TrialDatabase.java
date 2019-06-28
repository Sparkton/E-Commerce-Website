package com.godrej.client;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.godrej.util.DbConnection;

/**
 * Example database
 * @author akashdy
 *
 */
@WebServlet("/Test")
public class TrialDatabase extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DbConnection util = new DbConnection();
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();	      
		Connection conn = util.getConn();
		Statement stmt = null;
		try{
			String sql = "SELECT * FROM Persons";
			stmt = conn.createStatement();
			ResultSet rs =stmt.executeQuery(sql);
			while(rs.next()){
				int id  = rs.getInt("PERSONID");
				String first = rs.getString("FIRSTNAME");
				String last = rs.getString("LASTNAME");
				String address = rs.getString("ADDRESS");
				String city = rs.getString("CITY");

				out.println("ID: " + id + "<br>");
				out.println(" First: " + first + "<br>");
				out.println(" Last: " + last + "<br>");
				out.println(" State: " + address + "<br>");
				out.println(" City: " + city + "<br>");
			}
			out.println("</body></html>");
			stmt.close();
		}
		catch(Exception e){
			System.out.println("Error occured");
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
				/*
				 * if(rs != null) { rs.close(); }
				 */
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
	/*private static String JDBC_Driver;
	private static String USER;
	private static String PASS;
	private static Connection conn;
	
	public TrialDatabase() {
		JDBC_Driver = "oracle.jdbc.driver.OracleDriver";
		USER = "system";
		PASS = "seema@2019";
		conn = null;
	}
	
	
	public static Connection getConnection() {
		
		try{
			Class.forName(JDBC_Driver);
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", USER, PASS);
			fsdfsdfsdfsdf
			conn.close();
			return conn
		}
		catch(Exception e){
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
				if(rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return conn;
	}	
}*/

