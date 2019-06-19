package com.godrej.client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.godrej.model.Product;

@WebServlet("/PdtDisplay")
public class PdtDisplay extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Product pdt = new Product();

    public PdtDisplay() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Reached post");
		response.sendRedirect("StartUpPageProduct");
	}

}
