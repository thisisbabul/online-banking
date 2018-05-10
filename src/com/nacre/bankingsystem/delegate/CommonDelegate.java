package com.nacre.bankingsystem.delegate;

import com.nacre.bankingsystem.dto.LoginDTO;
import com.nacre.bankingsystem.serviceI.CommonServiceI;
import com.nacre.bankingsystem.serviceI.serviceImpl.CommonServiceImpl;

public class CommonDelegate {
	public String getLogin(LoginDTO login){
		CommonServiceI loginServiceI=new CommonServiceImpl();
		return loginServiceI.getLogin(login);
	}
}
