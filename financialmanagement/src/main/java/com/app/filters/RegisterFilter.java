package com.app.filters;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.dao.RegisterDao;
import com.app.models.RegisterModel;
import com.app.services.RegisterService;


@WebFilter("/register")
public class RegisterFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest)request;
		String uname=req.getParameter("username");
		String email=req.getParameter("email");
		
		RegisterModel rm=new RegisterModel(uname, email);
		System.out.println(rm.getUname()+" "+rm.getEmail());
		
		RegisterService rs=new RegisterService();
			if(rs.checkUser(rm)) {
				HttpServletResponse res=(HttpServletResponse)response;
				System.out.print("already exist");
				res.sendRedirect("register.jsp");
			}
			else {
			chain.doFilter(request, response);
			}
	}

	
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
