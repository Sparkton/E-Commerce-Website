package com.godrej.client;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet that leads to manage user page
 * @author akashdy
 *
 */
@WebServlet({"/", "/StartUpPage"})
public class StartUpPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*HttpSession sess = request.getSession();
		 *
		 * if((boolean)sess.getAttribute("authenticated")==false || sess == null)
		 * response.sendRedirect("StartUpLogin");
		 */
		RequestDispatcher rd = request.getRequestDispatcher("jsp/User.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
