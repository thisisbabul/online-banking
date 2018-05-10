package com.nacre.bankingsystem.dto;

import java.io.Serializable;
import java.util.Date;

public class AccountDTO implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private long accountNo;
	private String accountType;
	private Date accountOpeningDate;
	private double netBalance;
	private String transactionPassword;
	public long getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(long accountNo) {
		this.accountNo = accountNo;
	}
	public String getAccountType() {
		return accountType;
	}
	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}
	public Date getAccountOpeningDate() {
		return accountOpeningDate;
	}
	public void setAccountOpeningDate(Date accountOpeningDate) {
		this.accountOpeningDate = accountOpeningDate;
	}
	public double getNetBalance() {
		return netBalance;
	}
	public void setNetBalance(double netBalance) {
		this.netBalance = netBalance;
	}
	public String getTransactionPassword() {
		return transactionPassword;
	}
	public void setTransactionPassword(String transactionPassword) {
		this.transactionPassword = transactionPassword;
	}
	@Override
	public String toString() {
		return "AccountDTO [accountNo=" + accountNo + ", accountType="
				+ accountType + ", accountOpeningDate=" + accountOpeningDate
				+ ", netBalance=" + netBalance + ", transactionPassword="
				+ transactionPassword + "]";
	}
	
	
}
