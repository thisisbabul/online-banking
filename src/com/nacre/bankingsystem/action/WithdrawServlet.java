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

@WebServlet("/WithdrawServlet")
public class WithdrawServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long accountNo=Long.parseLong(request.getParameter("accountNo"));
		double withdrawAmount=Double.parseDouble(request.getParameter("withdrawAmount"));
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		SessionFactory factory=HibernateUtils.getSessionFactory();
	    Session session=factory.openSession();
	    AccountDTO account=(AccountDTO)session.get(AccountDTO.class,accountNo);
	    
	    response.setContentType("text/html");
		PrintWriter out=response.getWriter();
	    if(account!=null){
	    	double netBalance=account.getNetBalance();
	    	if((netBalance-withdrawAmount)>=0){
	    		Query query=session.createQuery("update AccountDTO set netBalance=netBalance-"+withdrawAmount+" where accountNo="+accountNo);
	    	    Transaction tx=session.beginTransaction();
	    		int i=query.executeUpdate();
	    		
	    		
	    		if(i!=0){
	    			TransactionDTO transaction=new TransactionDTO();
	    			transaction.setAccountNo(accountNo);
	    			transaction.setDescription("CASH WITHDRAW");
	    			transaction.setTransactionAmount(withdrawAmount);
	    			transaction.setNetBalance(netBalance-withdrawAmount);
	    			transaction.setTargetAccountNo(0);
	    			session.save(transaction);
	    			tx.commit();
		    		out.println("<h2 style='color:green;'>Amount withdrawn successfully.</h2>");
					out.println("<h3 style='color:blue;'>Account Number  : "+accountNo+"</h3>");
					out.println("<h3 style='color:blue;'>Withdrawn Amount   : "+withdrawAmount+"</h3>");
					out.println("<h3 style='color:blue;'>Available Balance  : "+(netBalance-withdrawAmount)+"</h3>");
	    		}
	    	}else{
	    		out.println("<h2 style='color:red;'>Sorry ! No Sufficient Balance.</h2>");
				out.println("<h3 style='color:blue;'>Available Balance  : "+netBalance+"</h3>");
	    	}
	    }else{
	    	out.println("<h2 style='color:red;'>Sorry ! account does not exist.</h2>");
	    }
	    session.close();
		factory.close(); 
	}
}
