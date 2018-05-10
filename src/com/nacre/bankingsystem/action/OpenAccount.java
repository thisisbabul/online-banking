package com.nacre.bankingsystem.action;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.hibernate.Hibernate;

import com.nacre.bankingsystem.delegate.AdminDelegate;
import com.nacre.bankingsystem.dto.AccountDTO;
import com.nacre.bankingsystem.dto.CustomerDTO;
import com.nacre.bankingsystem.dto.LoginDTO;
import com.nacre.util.DateUtils;
import com.nacre.util.PasswordUtils;


//import org.apache.commons.codec.binary.Base64;

/**
 * Servlet implementation class OpenAccount
 */
@WebServlet("/OpenAccount")
@MultipartConfig(maxFileSize=12989891)
public class OpenAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String firstName=request.getParameter("firstName");
		String lastName=request.getParameter("lastName");
		String fatherName=request.getParameter("fatherName");
		String gender=request.getParameter("gender");
		String nationality=request.getParameter("nationality");
		String maritalStatus=request.getParameter("maritalStatus");
		String accountType=request.getParameter("accountType");
		String emailId=request.getParameter("emailId");
		String mobileNo=request.getParameter("mobileNo");
		String address=request.getParameter("address");
		String dob=request.getParameter("dateOfBirth");
		//string to date conversion
		java.sql.Date dateOfBirth=DateUtils.getSqlDate(dob);
		double netBalance=Double.parseDouble(request.getParameter("balance"));
		
		//converting image to Blob type		
		
		//Convert image into blob type
		
		Blob photograph=null;
		Part filePart=request.getPart("photograph");
	    if(filePart !=null){
	    	 InputStream inputStream=filePart.getInputStream();
	    	 byte []imageByteArray=new byte[(int)filePart.getSize()];
	    	 inputStream.read(imageByteArray);
	    	 photograph=Hibernate.createBlob(imageByteArray);
	     }
	    
		/*String photograph=null;
		Part filePart=request.getPart("photograph");
	    if(filePart !=null){
	    	 InputStream inputStream=filePart.getInputStream();
	    	 byte []imageByteArray=new byte[(int)filePart.getSize()];
	    	 inputStream.read(imageByteArray);
	    	 photograph=new String(imageByteArray);
	     }*/
		
	    // create AccountDTO object
	    AccountDTO account=new AccountDTO();
	    account.setAccountType(accountType);
	    account.setAccountOpeningDate(new java.util.Date());
	    account.setNetBalance(netBalance);
	    String transactionPassword=PasswordUtils.getPassword();
	    account.setTransactionPassword(transactionPassword);
	    
	 // create LoginDTO object
	    LoginDTO login=new LoginDTO();
	    //login.setLoginId(accountNo.toString());
	    String loginPassword=PasswordUtils.getPassword();
	    login.setLoginPassword(loginPassword);
	    login.setLoginType("C");
	    
	    // create CusomerDTO object
	    CustomerDTO customer=new CustomerDTO();
	    customer.setFirstName(firstName);
	    customer.setLastName(lastName);
	    customer.setFatherName(fatherName);
	    customer.setDateOfBirth(dateOfBirth);
	    customer.setGender(gender);
	    customer.setNationality(nationality);
	    customer.setMaritalStatus(maritalStatus);
	    customer.setEmailId(emailId);
	    customer.setMobileNo(mobileNo);
	    customer.setAddress(address);
	    customer.setPhotograph(photograph);
	    
	    AdminDelegate adminDelegate=new AdminDelegate();
	    long accountNo=adminDelegate.openAccount(account,login,customer);
	    String username="U"+accountNo;
	    if(accountNo!=0){
	    	HttpSession session=request.getSession();
	    	session.setAttribute("accountNo", accountNo);
	    	session.setAttribute("username", username);
	    	session.setAttribute("loginPassword", loginPassword);
	    	session.setAttribute("transactionPassword", transactionPassword);
	    	session.setAttribute("message", "ACCOUNT CREATED SUCCESSFULLY");
	    	response.sendRedirect(request.getContextPath()+"/jsp/openAccount.jsp");
	    	//System.out.println("sucessfull...");
	    }
	    
	    
	    
	    //System.out.println(firstName+","+lastName+","+fatherName+","+gender+","+nationality+","+maritalStatus+","+accountType+","+emailId+","+mobileNo+","+address+","+dateOfBirth+","+photograph);
		
		
	}

}
