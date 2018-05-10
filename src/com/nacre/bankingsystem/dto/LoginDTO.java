package com.nacre.bankingsystem.dto;

import java.io.Serializable;

public class LoginDTO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 8952899293595017571L;
	private String loginId;
	private String loginPassword;
	private String loginType;
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getLoginPassword() {
		return loginPassword;
	}
	public void setLoginPassword(String loginPassword) {
		this.loginPassword = loginPassword;
	}
	public String getLoginType() {
		return loginType;
	}
	public void setLoginType(String loginType) {
		this.loginType = loginType;
	}
}
