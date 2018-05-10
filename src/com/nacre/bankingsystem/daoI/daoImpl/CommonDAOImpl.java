package com.nacre.bankingsystem.daoI.daoImpl;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.nacre.bankingsystem.daoI.CommonDAOI;
import com.nacre.bankingsystem.dto.LoginDTO;
import com.nacre.util.HibernateUtils;

public class CommonDAOImpl implements CommonDAOI{

	@Override
	public String getLogin(LoginDTO login) {
		
		String username=login.getLoginId();
		String password=login.getLoginPassword();
		SessionFactory factory=HibernateUtils.getSessionFactory();
		Session session=factory.openSession();
		Query query=session.createQuery("from LoginDTO where loginId='"+username+"' and loginPassword='"+password+"'");
		List<LoginDTO> list=query.list();
		Iterator<LoginDTO> it=list.iterator();
		while(it.hasNext()){
			login=it.next();
			String loginType=login.getLoginType();
			if(loginType.equals("A")){
				return "ADMIN";
			}else if(loginType.equals("C")){
				return "CUSTOMER";
			}
		}
		return "OTHER";
	}
	
}
