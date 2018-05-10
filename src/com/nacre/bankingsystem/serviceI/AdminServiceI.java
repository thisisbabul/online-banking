package com.nacre.bankingsystem.serviceI;

import com.nacre.bankingsystem.dto.AccountDTO;
import com.nacre.bankingsystem.dto.CustomerDTO;
import com.nacre.bankingsystem.dto.LoginDTO;

public interface AdminServiceI {
	public long openAccount(AccountDTO account,LoginDTO login,CustomerDTO customer);
}
