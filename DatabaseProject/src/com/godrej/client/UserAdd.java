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
/**
 * Servlet to add users into database
 * @author akashdy
 *
 */
@WebServlet("/UserAdd")
public class UserAdd extends HttpServlet{
	private static final long serialVersionUID = 1L;
	UserService userService = new UserServiceImpl();
    public UserAdd() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		//userService.display();
		RequestDispatcher userPage = request.getRequestDispatcher("DisplayProfile");//html/User.html);
		userPage.forward(request, response);
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("UserDisplay");
	}
}
