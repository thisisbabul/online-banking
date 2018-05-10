package com.nacre.bankingsystem.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.google.gson.Gson;
import com.nacre.bankingsystem.dto.AccountDTO;
import com.nacre.util.HibernateUtils;

@WebServlet("/CheckExistingAccountNo")
public class CheckExistingAccountNo extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long accountNo=Long.parseLong(request.getParameter("accountNo"));
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		String json=null;
		Gson gson=new Gson();
		SessionFactory factory=HibernateUtils.getSessionFactory();
	    Session session=factory.openSession();
	    AccountDTO account=(AccountDTO)session.get(AccountDTO.class, accountNo);
	    if(account!=null){
	    	json = gson.toJson(1);
	    }else{
	    	json = gson.toJson(0);
	    }
	    session.close();
	    factory.close();
	    response.setContentType("application/json");
		PrintWriter printWriter = response.getWriter();
		printWriter.write(json);
	}

}
