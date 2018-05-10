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

import com.google.gson.Gson;
import com.nacre.bankingsystem.dto.AccountDTO;
import com.nacre.bankingsystem.dto.CustomerDTO;
import com.nacre.bankingsystem.dto.TransactionDTO;
import com.nacre.util.HibernateUtils;

@WebServlet("/QuickTransactionServlet")
public class QuickTransactionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long accountNo=Long.parseLong(request.getParameter("accountNo"));
		String json=null;
		Gson gson=new Gson();
		
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		SessionFactory factory=HibernateUtils.getSessionFactory();
	    Session session=factory.openSession();
	    AccountDTO account=(AccountDTO)session.get(AccountDTO.class,accountNo);
	    
		if(account!=null){
			CustomerDTO customer=(CustomerDTO)session.get(CustomerDTO.class, accountNo);
			Query query=session.createQuery("from TransactionDTO where accountNo=?");
			query.setLong(0,accountNo);
			@SuppressWarnings("unchecked")
			List<TransactionDTO> transactionDTOs=(List<TransactionDTO>)query.list();
			customer.setTransactionDTOs(transactionDTOs);
			json = gson.toJson(customer);
			Iterator it=customer.getTransactionDTOs().iterator();
			while(it.hasNext()){
				TransactionDTO t=(TransactionDTO)it.next();
				System.out.println(t.getTransactionId());
			}
		}else{
			System.out.println("account does not exist");
			json = gson.toJson(null);
		}
		response.setContentType("application/json");
		PrintWriter printWriter = response.getWriter();
		printWriter.write(json);
	}

}
