package com.nacre.bankingsystem.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.nacre.bankingsystem.dto.AccountDTO;
import com.nacre.bankingsystem.dto.TransactionDTO;
import com.nacre.util.HibernateUtils;

@WebServlet("/CustomerFundTransferServlet")
public class CustomerFundTransferServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		long sourceAccountNo=(long)session.getAttribute("accountNo");
		long targetAccountNo=Long.parseLong(request.getParameter("targetAccountNo"));
		double transferAmount=Double.parseDouble(request.getParameter("transferAmount"));
		String transactionPassword=request.getParameter("transactionPassword");
		System.out.println(transactionPassword);
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		SessionFactory factory=HibernateUtils.getSessionFactory();
	    Session hsession=factory.openSession();
	    AccountDTO sourceAccount=(AccountDTO)hsession.get(AccountDTO.class,sourceAccountNo);
	    AccountDTO targetAccount=(AccountDTO)hsession.get(AccountDTO.class,targetAccountNo);
		if(sourceAccount!=null && targetAccount!=null){
			String txnPassword=sourceAccount.getTransactionPassword();
			if(txnPassword.equals(transactionPassword)){
				double availableBalance=sourceAccount.getNetBalance();
				if(availableBalance>=transferAmount){
					 Query query1=hsession.createQuery("update AccountDTO set netBalance=netBalance+"+transferAmount+" where accountNo="+targetAccountNo);
					 Query query2=hsession.createQuery("update AccountDTO set netBalance=netBalance-"+transferAmount+" where accountNo="+sourceAccountNo);
					 Transaction tx=hsession.beginTransaction();
					 query1.executeUpdate();
					 query2.executeUpdate();
					 
					 TransactionDTO transaction=new TransactionDTO();
		    			transaction.setAccountNo(sourceAccountNo);
		    			transaction.setDescription("FUND TRANSFER");
		    			transaction.setTransactionAmount(transferAmount);
		    			transaction.setNetBalance(availableBalance-transferAmount);
		    			transaction.setTargetAccountNo(targetAccountNo);
		    			hsession.save(transaction);
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
				out.println("<h2 style='color:red;'>Sorry ! Account No or Transaction password has not matched</h2>");
			}
		}else{
			out.println("<h2 style='color:red;'>Sorry ! Accounts does not exist.</h2>");
		}
		hsession.close();
		factory.close();
		
	}

}
