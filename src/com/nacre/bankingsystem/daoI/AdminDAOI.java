package com.nacre.bankingsystem.daoI;

import com.nacre.bankingsystem.dto.AccountDTO;
import com.nacre.bankingsystem.dto.CustomerDTO;
import com.nacre.bankingsystem.dto.LoginDTO;

public interface AdminDAOI {
	public long openAccount(AccountDTO account,LoginDTO login,CustomerDTO customer);
}
