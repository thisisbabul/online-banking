package com.nacre.bankingsystem.dto;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Date;
import java.util.List;

public class CustomerDTO implements Serializable {

	private static final long serialVersionUID = 1L;
	private long accountNo;
	private String firstName;
	private String lastName;
	private String fatherName;
	private Date dateOfBirth;
	private String gender;
	private String nationality;
	private String maritalStatus;
	private String mobileNo;
	private String emailId;
	private String address;
	private Blob photograph;
	private String loginId;
	private AccountDTO accountDTO;
	private List<TransactionDTO> transactionDTOs;

	public long getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(long accountNo) {
		this.accountNo = accountNo;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getFatherName() {
		return fatherName;
	}

	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public String getMaritalStatus() {
		return maritalStatus;
	}

	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Blob getPhotograph() {
		return photograph;
	}

	public void setPhotograph(Blob photograph) {
		this.photograph = photograph;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public AccountDTO getAccountDTO() {
		return accountDTO;
	}

	public void setAccountDTO(AccountDTO accountDTO) {
		this.accountDTO = accountDTO;
	}
	

	public List<TransactionDTO> getTransactionDTOs() {
		return transactionDTOs;
	}

	public void setTransactionDTOs(List<TransactionDTO> transactionDTOs) {
		this.transactionDTOs = transactionDTOs;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "CustomerDTO [accountNo=" + accountNo + ", firstName="
				+ firstName + ", lastName=" + lastName + ", fatherName="
				+ fatherName + ", dateOfBirth=" + dateOfBirth + ", gender="
				+ gender + ", nationality=" + nationality + ", maritalStatus="
				+ maritalStatus + ", mobileNo=" + mobileNo + ", emailId="
				+ emailId + ", address=" + address + ", photograph="
				+ photograph + ", loginId=" + loginId + ", accountDTO="
				+ accountDTO + "]";
	}

}
