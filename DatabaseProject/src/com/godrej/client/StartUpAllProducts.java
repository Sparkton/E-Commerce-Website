package com.godrej.client;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/StartUpAllProducts")
public class StartUpAllProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sess = request.getSession();
		if(!(boolean)sess.getAttribute("authenticated")==true || sess.getAttribute("authenticated") == null)
			response.sendRedirect("StartUpPage");
		RequestDispatcher rd = request.getRequestDispatcher("jsp/AllProduct.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sess = request.getSession();
		if(!(boolean)sess.getAttribute("authenticated"))
			response.sendRedirect("StartUpPage");
		RequestDispatcher rd = request.getRequestDispatcher("jsp/AllProduct.jsp");
		rd.forward(request, response);
	}

}
