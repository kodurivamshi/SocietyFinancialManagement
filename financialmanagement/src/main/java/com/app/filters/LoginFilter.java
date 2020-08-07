package com.app.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.models.LoginModel;
import com.app.services.LoginService;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/login")
public class LoginFilter implements Filter {


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest)request;
		String uname=req.getParameter("username");
		String password=request.getParameter("password");
		
		LoginModel lm=new LoginModel(uname, password);
		LoginService ls=new LoginService();
	
		
		
			if(ls.checkData(lm)) {
				chain.doFilter(request, response);
			}
			else {
				HttpServletResponse res=(HttpServletResponse)response;
				HttpSession session=req.getSession();
				session.setAttribute("invalid", "yes");
				System.out.print("Invalid Credentials");
				res.sendRedirect("login.jsp");
			} 

	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
