package com.godrej.client;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.godrej.model.Address;
import com.godrej.model.User;
import com.godrej.service.UserService;
import com.godrej.serviceimpl.UserServiceImpl;

@WebServlet("/UserAdd")
public class UserAdd extends HttpServlet{
	private static final long serialVersionUID = 1L;
	UserService userService = new UserServiceImpl();
    public UserAdd() {
        super();
    }

	/*
	 * protected void doGet(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { HttpSession sess =
	 * request.getSession(); if(!(boolean)sess.getAttribute("authenticated")==true
	 * || sess == null) response.sendRedirect("StartUpLogin"); User user = new
	 * User(); Address address = new Address(); System.out.println("Reached post");
	 * user.setUserId(1); user.setuName(request.getParameter("nameIn"));
	 * user.setuPass(request.getParameter("passIn"));
	 * address.setCity(request.getParameter("cityIn"));
	 * address.setState(request.getParameter("stateIn"));
	 * address.setPinCode(Integer.parseInt(request.getParameter("pinIn")));
	 * user.setAddress(address); userService.insert(user); userService.display();
	 * response.sendRedirect("StartUpLogin"); }
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * HttpSession sess = request.getSession();
		 * if(!(boolean)sess.getAttribute("authenticated")==true || sess == null)
		 * response.sendRedirect("StartUpLogin");
		 */
		User user = new User();
		Address address = new Address();
		System.out.println("Reached post");
		user.setUserId(1);
		user.setuName(request.getParameter("nameIn"));
		user.setuPass(request.getParameter("passIn")); 
		address.setCity(request.getParameter("cityIn"));
		address.setState(request.getParameter("stateIn"));
		address.setPinCode(Integer.parseInt(request.getParameter("pinIn")));
		user.setAddress(address);
		userService.insert(user);
		userService.display();
		RequestDispatcher userPage = request.getRequestDispatcher("UserDisplay");//html/User.html);
		userPage.forward(request, response);
	}
}
