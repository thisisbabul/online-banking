package com.nacre.bankingsystem.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CheckUser")
public class CheckUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int ano=Integer.parseInt(request.getParameter("accountNo"));
		System.out.println(ano);
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		out.println("<h2>Account No: "+ano+"</h2>");
	}

}
