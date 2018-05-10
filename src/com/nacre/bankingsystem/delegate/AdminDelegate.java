package com.nacre.bankingsystem.delegate;

import com.nacre.bankingsystem.dto.AccountDTO;
import com.nacre.bankingsystem.dto.CustomerDTO;
import com.nacre.bankingsystem.dto.LoginDTO;
import com.nacre.bankingsystem.serviceI.AdminServiceI;
import com.nacre.bankingsystem.serviceI.serviceImpl.AdminServiceImpl;

public class AdminDelegate {
	public long openAccount(AccountDTO account,LoginDTO login,CustomerDTO customer){
		AdminServiceI adminService=new AdminServiceImpl();
		return adminService.openAccount(account, login, customer);
	}
}
