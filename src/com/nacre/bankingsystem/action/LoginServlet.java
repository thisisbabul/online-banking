package com.nacre.bankingsystem.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.nacre.bankingsystem.delegate.CommonDelegate;
import com.nacre.bankingsystem.dto.LoginDTO;
import com.nacre.util.HibernateUtils;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=(String)request.getParameter("username");
		String password=(String)request.getParameter("password");
		
		
		LoginDTO login=new LoginDTO();
		login.setLoginId(username);
		login.setLoginPassword(password);
		CommonDelegate loginDelegate=new CommonDelegate();
		String userType=loginDelegate.getLogin(login);
		if(userType.equals("ADMIN")){
			
			HttpSession session=request.getSession();
			session.setAttribute("username", username);
			session.setAttribute("userType", userType);
			session.setAttribute("message", "LOGIN SUCCESS");
			//RequestDispatcher rd=request.getRequestDispatcher("jsp/welcome.jsp");
			//rd.forward(request, response);
			response.sendRedirect("jsp/adminHomePage.jsp");
		}else if(userType.equals("CUSTOMER")){
			SessionFactory factory=HibernateUtils.getSessionFactory();
		    Session hsession=factory.openSession();
		    Query query=hsession.createQuery("select accountNo from CustomerDTO where loginId='"+username+"'");
		    List list=query.list();
		    long accountNo=(long)list.get(0);
		    hsession.close();
		    factory.close();
			HttpSession session=request.getSession();
			session.setAttribute("username", username);
			session.setAttribute("userType", userType);
			session.setAttribute("accountNo", accountNo);
			session.setAttribute("message", "LOGIN SUCCESS");
			response.sendRedirect("jsp/customerHomePage.jsp");
		}else{
			HttpSession session=request.getSession();
			session.setAttribute("message", "LOGIN FAIL");
			response.sendRedirect("jsp/login.jsp");
		}
	}

}
