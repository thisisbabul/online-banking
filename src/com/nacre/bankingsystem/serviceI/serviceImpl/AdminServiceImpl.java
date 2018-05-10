package com.nacre.bankingsystem.serviceI.serviceImpl;

import com.nacre.bankingsystem.daoI.AdminDAOI;
import com.nacre.bankingsystem.daoI.daoImpl.AdminDAOImpl;
import com.nacre.bankingsystem.dto.AccountDTO;
import com.nacre.bankingsystem.dto.CustomerDTO;
import com.nacre.bankingsystem.dto.LoginDTO;
import com.nacre.bankingsystem.serviceI.AdminServiceI;

public class AdminServiceImpl implements AdminServiceI{

	@Override
	public long openAccount(AccountDTO account, LoginDTO login,CustomerDTO customer) {
		AdminDAOI adminDao=new AdminDAOImpl();
		return adminDao.openAccount(account, login, customer);
	}

}
