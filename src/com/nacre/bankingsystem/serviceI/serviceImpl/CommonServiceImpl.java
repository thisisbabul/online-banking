package com.nacre.bankingsystem.serviceI.serviceImpl;

import com.nacre.bankingsystem.daoI.CommonDAOI;
import com.nacre.bankingsystem.daoI.daoImpl.CommonDAOImpl;
import com.nacre.bankingsystem.dto.LoginDTO;
import com.nacre.bankingsystem.serviceI.CommonServiceI;

public class CommonServiceImpl implements CommonServiceI{

	@Override
	public String getLogin(LoginDTO login) {
		CommonDAOI loginDAOImpl=new CommonDAOImpl();
		return loginDAOImpl.getLogin(login);
	}

}
