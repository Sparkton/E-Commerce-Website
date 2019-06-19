package com.godrej.client;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.godrej.service.ProductService;
import com.godrej.serviceimpl.ProductServiceImpl;


@WebServlet("/PdtUpdate")
public class PdtUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
    ProductService productService;   

    public PdtUpdate() {
        productService = new ProductServiceImpl();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Try Post");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("updateID"));
		if(request.getParameter("updateName").trim().length()!=0)
			productService.update(id, request.getParameter("updateName"), 1);
		if(request.getParameter("updateCat").trim().length()!=0)
			productService.update(id,request.getParameter("updateCat") , 2);
		if(request.getParameter("updatePrice").trim().length()!=0)
			productService.update(id, request.getParameter("updatePrice"), 3);
		RequestDispatcher userPage = request.getRequestDispatcher("PdtDisplay");
		userPage.forward(request, response);
	}

}
