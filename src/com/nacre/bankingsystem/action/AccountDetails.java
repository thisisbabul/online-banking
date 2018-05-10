package com.nacre.bankingsystem.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.google.gson.Gson;
import com.nacre.bankingsystem.dto.AccountDTO;
import com.nacre.bankingsystem.dto.CustomerDTO;
import com.nacre.util.HibernateUtils;

@WebServlet("/AccountDetails")
public class AccountDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		long accountNo = Long.parseLong(request.getParameter("accountNo"));
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		String json=null;
		Gson gson=new Gson();
		
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		AccountDTO account = (AccountDTO) session.get(AccountDTO.class,accountNo);
		
		if(account!=null){
			CustomerDTO customer = (CustomerDTO) session.get(CustomerDTO.class,accountNo);
			Blob b=customer.getPhotograph();
			int length;
			try {
				length=(int)b.length();
				byte image[]=b.getBytes(1,length);
				//String encodedImage = Base64.encode(image);
				HttpSession httpSession=request.getSession();
				//httpSession.setAttribute("image", encodedImage);
				//System.out.println("image="+encodedImage);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			customer.setAccountDTO(account);
			json = gson.toJson(customer);
		}else{
			json = gson.toJson(null);
		}
		session.close();
		factory.close();

		response.setContentType("application/json");
		PrintWriter printWriter = response.getWriter();
		printWriter.write(json);

	}

}
