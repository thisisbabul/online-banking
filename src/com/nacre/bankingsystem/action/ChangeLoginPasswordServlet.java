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

@WebServlet("/ChangeLoginPasswordServlet")
public class ChangeLoginPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String currentUsername=request.getParameter("currentUsername");
		String oldPassword=request.getParameter("oldPassword");
		String newPassword=request.getParameter("newPassword");
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		PrintWriter out=response.getWriter();
		SessionFactory factory=HibernateUtils.getSessionFactory();
		Session session=factory.openSession();
		LoginDTO login=(LoginDTO)session.get(LoginDTO.class, currentUsername);
		if(login!=null){
			String existingPassword=login.getLoginPassword();
			if(oldPassword.equals(existingPassword)){
				Transaction tx=session.beginTransaction();
				Query query=session.createQuery("update LoginDTO set loginPassword='"+newPassword+"' where loginId='"+currentUsername+"'");
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
