package com.godrej.client;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Statement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.godrej.util.SqlInfo;


@WebServlet("/Test")
public class TrialDatabase extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SqlInfo util = new SqlInfo();
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();	      
		out.println("<html><head><title>Trial Database</title></head><body style='background-color: antiquewhite;'>");
		out.println("<p>Test for database</p><br>");
		try{
			Class.forName(util.getJDBC_Driver());
			Statement stmt =util.getConn().createStatement();
			String sql = "SELECT * FROM Persons";
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
			util.getConn().close();
		}
		catch(Exception e){
			System.out.println("Error occured");
			e.printStackTrace();
		}
		finally {
			System.out.println("Finished");
		}
	}
}

