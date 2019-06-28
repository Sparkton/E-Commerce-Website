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
 * Servlet that accesses database to delete product
 * @author akashdy
 *
 */
@WebServlet("/PdtDel")
public class PdtDel extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductService productService;

    public PdtDel() {
        productService = new ProductServiceImpl();
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
		int id = Integer.parseInt(request.getParameter("ID"));
		productService.delete(id);
		RequestDispatcher userPage = request.getRequestDispatcher("StartUpPageProduct");
		userPage.forward(request, response);
	}

}
