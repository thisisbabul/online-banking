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

@WebServlet("/FundTransferServlet")
public class FundTransferServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long sourceAccountNo=Long.parseLong(request.getParameter("sourceAccountNo"));
		long targetAccountNo=Long.parseLong(request.getParameter("targetAccountNo"));
		double transferAmount=Double.parseDouble(request.getParameter("transferAmount"));
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		SessionFactory factory=HibernateUtils.getSessionFactory();
	    Session session=factory.openSession();
	    AccountDTO sourceAccount=(AccountDTO)session.get(AccountDTO.class,sourceAccountNo);
	    AccountDTO targetAccount=(AccountDTO)session.get(AccountDTO.class,targetAccountNo);
		if(sourceAccount!=null && targetAccount!=null){
			double availableBalance=sourceAccount.getNetBalance();
			if(availableBalance>=transferAmount){
				 Query query1=session.createQuery("update AccountDTO set netBalance=netBalance+"+transferAmount+" where accountNo="+targetAccountNo);
				 Query query2=session.createQuery("update AccountDTO set netBalance=netBalance-"+transferAmount+" where accountNo="+sourceAccountNo);
				 Transaction tx=session.beginTransaction();
				 query1.executeUpdate();
				 query2.executeUpdate();
				 
				 TransactionDTO transaction=new TransactionDTO();
	    			transaction.setAccountNo(sourceAccountNo);
	    			transaction.setDescription("FUND TRANSFER");
	    			transaction.setTransactionAmount(transferAmount);
	    			transaction.setNetBalance(availableBalance-transferAmount);
	    			transaction.setTargetAccountNo(targetAccountNo);
	    			session.save(transaction);
	    			tx.commit();
				 	out.println("<h2 style='color:green;'>Amount transfred successfully.</h2>");
					out.println("<h3 style='color:blue;'>Account Number  : "+sourceAccountNo+"</h3>");
					out.println("<h3 style='color:blue;'>Transfred Amount   : "+transferAmount+"</h3>");
					out.println("<h3 style='color:blue;'>Available Balance  : "+(availableBalance-transferAmount)+"</h3>");
				  
			}else{
				out.println("<h2 style='color:red;'>Sorry ! No Sufficient Balance.</h2>");
				out.println("<h3 style='color:blue;'>Available Balance  : "+availableBalance+"</h3>");
			}
		}else{
			out.println("<h2 style='color:red;'>Sorry ! Accounts does not exist.</h2>");
		}
		session.close();
		factory.close();
		
	}

}
