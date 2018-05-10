package com.nacre.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtils {
	private static SessionFactory factory;
	private HibernateUtils(){}
	public static SessionFactory getSessionFactory(){
		if(factory==null){
			factory=new Configuration().configure("com/nacre/bankingsystem/config/hibernate.cfg.xml").buildSessionFactory();
		}
	return factory;
	}
}
