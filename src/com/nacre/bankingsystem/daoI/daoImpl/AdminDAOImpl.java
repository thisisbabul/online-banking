package com.nacre.bankingsystem.daoI.daoImpl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.nacre.bankingsystem.daoI.AdminDAOI;
import com.nacre.bankingsystem.dto.AccountDTO;
import com.nacre.bankingsystem.dto.CustomerDTO;
import com.nacre.bankingsystem.dto.LoginDTO;
import com.nacre.util.HibernateUtils;

public class AdminDAOImpl implements AdminDAOI{

	@Override
	public long openAccount(AccountDTO account, LoginDTO login,CustomerDTO customer) {
		
		SessionFactory factory=HibernateUtils.getSessionFactory();
	    Session session=factory.openSession();
	    Transaction tx=session.beginTransaction();	    
	    
	    Long accountNo=(Long)session.save(account);  // Store data into tbl_account table
		    
		String loginId=accountNo.toString();
		login.setLoginId("U"+loginId);
		session.save(login);  // store data into tbl_login table
		    
		    
		customer.setAccountNo(accountNo);
		customer.setLoginId("U"+loginId);
		session.save(customer);  // store data into tbl_customer table	    
		
		tx.commit();
		session.close();
	    factory.close();
	    
		return accountNo;
	}
}
