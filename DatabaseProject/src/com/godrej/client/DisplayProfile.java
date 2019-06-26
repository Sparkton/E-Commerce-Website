package com.godrej.client;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DisplaySingle
 */
@WebServlet("/DisplayProfile")
public class DisplayProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sess = request.getSession();
		if(!(boolean)sess.getAttribute("authenticated")==true || sess == null)
			response.sendRedirect("StartUpLogin");
		RequestDispatcher userPage;
		if((boolean)sess.getAttribute("AdminAccess")==true) 
			userPage = request.getRequestDispatcher("StartUpPage");
		else 
		userPage = request.getRequestDispatcher("jsp/Profile.jsp");
		
		userPage.forward(request, response);
		
	}

}
