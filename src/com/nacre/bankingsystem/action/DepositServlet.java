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

import com.nacre.bankingsystem.dto.AccountDTO;
import com.nacre.bankingsystem.dto.TransactionDTO;
import com.nacre.util.HibernateUtils;

@WebServlet("/DepositServlet")
public class DepositServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long accountNo=Long.parseLong(request.getParameter("accountNo"));
		double depositAmount=Double.parseDouble(request.getParameter("depositAmount"));
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		SessionFactory factory=HibernateUtils.getSessionFactory();
	    Session session=factory.openSession();
	    Query query=session.createQuery("update AccountDTO set netBalance=netBalance+"+depositAmount+" where accountNo="+accountNo);
	    Transaction tx=session.beginTransaction();
		int i=query.executeUpdate();
		System.out.println("row updated:"+i);
		
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		if(i>0){
			AccountDTO account=(AccountDTO)session.get(AccountDTO.class, accountNo);
			double availableBalance=account.getNetBalance();
			
			TransactionDTO transaction=new TransactionDTO();
			transaction.setAccountNo(accountNo);
			transaction.setDescription("CASH DEPOSIT");
			transaction.setTransactionAmount(depositAmount);
			transaction.setNetBalance(availableBalance+depositAmount);
			transaction.setTargetAccountNo(0);
			session.save(transaction);
			tx.commit();
			out.println("<h2 style='color:green;'>Amount deposited successfully.</h2>");
			out.println("<h3 style='color:blue;'>Account Number  : "+accountNo+"</h3>");
			out.println("<h3 style='color:blue;'>Dposited Amount : "+depositAmount+"</h3>");
		}else if(i==0){
			out.println("<h2 style='color:red;'>Sorry ! account does not exist.</h2>");
		}
		session.close();
		factory.close();
	}

}
