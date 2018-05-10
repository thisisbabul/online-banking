package com.nacre.bankingsystem.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

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
import com.nacre.bankingsystem.dto.CustomerDTO;
import com.nacre.util.HibernateUtils;

@WebServlet("/ChangeTransactionPasswordServlet")
public class ChangeTransactionPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String currentTxnUsername=request.getParameter("currentTxnUsername");
		String oldTxnPassword=request.getParameter("oldTxnPassword");
		String newTxnPassword=request.getParameter("newTxnPassword");
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		PrintWriter out=response.getWriter();
		SessionFactory factory=HibernateUtils.getSessionFactory();
		Session session=factory.openSession();
		Query query=session.createQuery("from CustomerDTO where loginId='"+currentTxnUsername+"'");
		List list=query.list();
		Iterator it=list.iterator();
		CustomerDTO customer=null;
		int i=0;
		while(it.hasNext()){
				customer=(CustomerDTO)it.next();System.out.println("while");
				long accountNo=customer.getAccountNo();System.out.println("get ano");
				AccountDTO account=(AccountDTO)session.get(AccountDTO.class,accountNo);
				String existingTransactionPassword=account.getTransactionPassword();
				if(existingTransactionPassword.equals(oldTxnPassword)){
					Transaction tx=session.beginTransaction();System.out.println("second if");
					query=session.createQuery("update AccountDTO set transactionPassword='"+newTxnPassword+"' where accountNo="+accountNo);
					query.executeUpdate();
					tx.commit();
					i++;
				}
			}
		if(i>0){
			out.println(1);
		}else{
			out.println(0);
		}
		session.close();
		factory.close();
	}
}
