package com.godrej.client;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.godrej.service.UserService;
import com.godrej.serviceimpl.UserServiceImpl;

@WebServlet("/UserUpdate")
public class UserUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserService userService;
	public UserUpdate() {
		userService = new UserServiceImpl();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int UserId = Integer.parseInt(request.getParameter("updateID"));

		if(request.getParameter("updateName").trim().length()!=0)
			userService.update(UserId, request.getParameter("updateName"), 1);
		if(request.getParameter("updatePass").trim().length()!=0)
			userService.update(UserId,request.getParameter("updatePass") , 2);
		if(request.getParameter("updateState").trim().length()!=0)
			userService.update(UserId, request.getParameter("updateState"), 3);
		if(request.getParameter("updateCity").trim().length()!=0)
			userService.update(UserId, request.getParameter("updateCity"), 4);
		if(request.getParameter("updatePin").trim().length()!=0)
			userService.update(UserId, request.getParameter("updatePin"), 5);

		RequestDispatcher userPage = request.getRequestDispatcher("DisplayProfile");
		userPage.forward(request, response);

	}
}