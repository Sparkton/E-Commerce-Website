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
 * Servlet that leads to Manage Producs page for admin access
 * @author akashdy
 *
 */
@WebServlet("/StartUpPageProduct")
public class StartUpPageProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sess = request.getSession();
		try{
			if(!(boolean)sess.getAttribute("authenticated")==true || sess == null)
			response.sendRedirect("StartUpLogin");
		}catch(NullPointerException e) {
			e.printStackTrace();
			response.sendRedirect("StartUpLogin");
		}
		RequestDispatcher rd;
		if((boolean)sess.getAttribute("AdminAccess") == true)
			rd = request.getRequestDispatcher("jsp/Product.jsp");
		else
			rd = request.getRequestDispatcher("jsp/AllProduct.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
