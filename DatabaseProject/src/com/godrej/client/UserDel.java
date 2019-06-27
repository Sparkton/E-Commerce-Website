package com.godrej.client;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.godrej.service.UserService;
import com.godrej.serviceimpl.UserServiceImpl;

@WebServlet("/UserDel")
public class UserDel extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserService userService;
    public UserDel() {
        userService = new UserServiceImpl();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Try POST for Delete");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sess = request.getSession();
		try{
			if(!(boolean)sess.getAttribute("authenticated")==true || sess == null)
			response.sendRedirect("StartUpLogin");
		}catch(NullPointerException e) {
			e.printStackTrace();
			response.sendRedirect("StartUpLogin");
		}
		int UserId = Integer.parseInt(request.getParameter("ID"));
		userService.delete(UserId);
		RequestDispatcher userPage = request.getRequestDispatcher("UserDisplay");
		userPage.forward(request, response);
	}
}
