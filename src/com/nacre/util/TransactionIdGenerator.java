package com.nacre.util;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.hibernate.HibernateException;
import org.hibernate.engine.SessionImplementor;
import org.hibernate.id.IdentifierGenerator;

public class TransactionIdGenerator implements IdentifierGenerator {

	@Override
	public Serializable generate(SessionImplementor arg0, Object arg1)throws HibernateException {
		String transactionId="TX";
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try {
			con=arg0.connection();
			st=con.createStatement();
			rs=st.executeQuery("select id from tbl_transactionId");
			rs.next();
			int id=rs.getInt("id");
			transactionId+=id;
			st.executeUpdate("update tbl_transactionId set id=id+1");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return transactionId;
	}

}
