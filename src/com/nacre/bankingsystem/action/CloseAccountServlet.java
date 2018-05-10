package com.nacre.bankingsystem.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.nacre.bankingsystem.dto.CustomerDTO;
import com.nacre.util.HibernateUtils;

@WebServlet("/CloseAccountServlet")
public class CloseAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		long accountNo=Long.parseLong(request.getParameter("accountNo"));
		System.out.println(accountNo);
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		SessionFactory factory=HibernateUtils.getSessionFactory();
	    Session session=factory.openSession();
	    Transaction tx=session.beginTransaction();
	    Query query=session.createQuery("delete AccountDTO where accountNo="+accountNo);
	    int i=query.executeUpdate();
	    if(i>0){
	    	CustomerDTO customer=(CustomerDTO)session.get(CustomerDTO.class, accountNo);
	    	String loginId=customer.getLoginId();
	    	query=session.createQuery("delete LoginDTO where loginId='"+loginId+"'");
		    i=query.executeUpdate();
		    if(i>0){
		    	tx.commit();
		    	out.println("<h2 style='color:green;'>Account closed successfully.</h2>");
				out.println("<h3 style='color:blue;'>Account Number  : "+accountNo+"</h3>");
		    }
	    }else{
	    	out.println("<h2 style='color:red;'>Sorry ! account does not exist.</h2>");
	    }
	}

}
