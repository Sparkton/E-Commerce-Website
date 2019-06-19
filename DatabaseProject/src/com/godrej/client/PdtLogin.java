package com.godrej.client;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.godrej.dao.ProductDao;
import com.godrej.daoimpl.ProductDaoImpl;
import com.godrej.model.Product;

@WebServlet("/PdtLogin")
public class PdtLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDao pdtDao = new ProductDaoImpl();
		String uName = request.getParameter("pName");
		List<Product> tempList = new ArrayList<Product>();
		tempList = pdtDao.search(1,uName);
		if(tempList.isEmpty() || tempList == null)
			response.sendRedirect("jsp/Login.jsp");
		for(Product user:tempList) {
				  request.setAttribute("ID", user.getProduct_Id()); 
				  request.setAttribute("uName",user.getProduct_Name()); 
				  request.setAttribute("uPass", user.getProduct_Cat());
				  request.setAttribute("State", user.getProduct_Price());
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("DisplaySingle");
			rd.forward(request, response);
		}
	}
