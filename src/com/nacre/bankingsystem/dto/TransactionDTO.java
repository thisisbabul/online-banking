package com.nacre.bankingsystem.dto;

import java.io.Serializable;
import java.sql.Timestamp;

public class TransactionDTO implements Serializable{
	private static final long serialVersionUID = 1L;
	private String transactionId;
	private Timestamp transactionDate;
	private double transactionAmount;
	private long accountNo;
	private long targetAccountNo;
	private String description;
	private double netBalance;
	public String getTransactionId() {
		return transactionId;
	}
	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}
	public Timestamp getTransactionDate() {
		return transactionDate;
	}
	public void setTransactionDate(Timestamp transactionDate) {
		this.transactionDate = transactionDate;
	}
	public double getTransactionAmount() {
		return transactionAmount;
	}
	public void setTransactionAmount(double transactionAmount) {
		this.transactionAmount = transactionAmount;
	}
	public long getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(long accountNo) {
		this.accountNo = accountNo;
	}
	public long getTargetAccountNo() {
		return targetAccountNo;
	}
	public void setTargetAccountNo(long targetAccountNo) {
		this.targetAccountNo = targetAccountNo;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public double getNetBalance() {
		return netBalance;
	}
	public void setNetBalance(double netBalance) {
		this.netBalance = netBalance;
	}
	
	
}
