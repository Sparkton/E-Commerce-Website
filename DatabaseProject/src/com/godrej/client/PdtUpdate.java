package com.godrej.client;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.godrej.service.ProductService;
import com.godrej.serviceimpl.ProductServiceImpl;

/**
 * Servlet that accesses database and updates product
 * @author akashdy
 *
 */
@WebServlet("/PdtUpdate")
public class PdtUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
    ProductService productService;   

    public PdtUpdate() {
        productService = new ProductServiceImpl();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
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
		int id = Integer.parseInt(request.getParameter("updateID"));
		if(request.getParameter("updateName").trim().length()!=0)
			productService.update(id, request.getParameter("updateName"), 1);
		if(request.getParameter("updateCat").trim().length()!=0)
			productService.update(id,request.getParameter("updateCat") , 2);
		if(request.getParameter("updatePrice").trim().length()!=0)
			productService.update(id, request.getParameter("updatePrice"), 3);
		RequestDispatcher userPage = request.getRequestDispatcher("StartUpPageProduct");
		userPage.forward(request, response);
	}

}
