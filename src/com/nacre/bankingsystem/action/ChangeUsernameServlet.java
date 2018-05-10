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

import com.nacre.bankingsystem.dto.LoginDTO;
import com.nacre.util.HibernateUtils;

@WebServlet("/ChangeUsernameServlet")
public class ChangeUsernameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oldUsername=request.getParameter("oldUsername");
		String newUsername=request.getParameter("newUsername");
		String loginPassword=request.getParameter("loginPassword");
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		PrintWriter out=response.getWriter();
		SessionFactory factory=HibernateUtils.getSessionFactory();
		Session session=factory.openSession();
		LoginDTO login=(LoginDTO)session.get(LoginDTO.class, oldUsername);
		if(login!=null){
			String existingLoginPassword=login.getLoginPassword();
			if(existingLoginPassword.equals(loginPassword)){
				Transaction tx=session.beginTransaction();
				Query query=session.createQuery("update LoginDTO set loginId='"+newUsername+"' where loginId='"+oldUsername+"'");
				query.executeUpdate();
				tx.commit();
				out.println(1);
			}
		}else{
			out.println(0);
		}
		session.close();
		factory.close();
	}

}
