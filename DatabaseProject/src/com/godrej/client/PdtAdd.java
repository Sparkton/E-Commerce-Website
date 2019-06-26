package com.godrej.client;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.godrej.model.Product;
import com.godrej.service.ProductService;
import com.godrej.serviceimpl.ProductServiceImpl;

@WebServlet("/PdtAdd")
public class PdtAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductService productService = new ProductServiceImpl();
    public PdtAdd() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sess = request.getSession();
		if(!(boolean)sess.getAttribute("authenticated")==true || sess == null)
			response.sendRedirect("StartUpLogin");
		Product pdt = new Product();
		pdt.setProduct_Id(1);
		pdt.setProduct_Name(request.getParameter("nameIn"));
		pdt.setProduct_Cat(request.getParameter("catIn")); 
		pdt.setProduct_Price(Integer.parseInt(request.getParameter("priceIn"))); 
		productService.insert(pdt);
		productService.display();
		RequestDispatcher userPage = request.getRequestDispatcher("PdtDisplay");
		userPage.forward(request, response);
	}
}
