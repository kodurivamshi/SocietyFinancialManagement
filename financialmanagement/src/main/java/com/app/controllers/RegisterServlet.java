package com.app.controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.config.Mail;
import com.app.config.PasswordHash;
import com.app.models.MembersModal;
import com.app.models.RegisterModel;
import com.app.services.RegisterService;

//@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname=request.getParameter("username");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String fullname=request.getParameter("fullname");
		String mobile=request.getParameter("mobile");
		String gender=request.getParameter("gender");
		String floor=request.getParameter("floor");
		String flat=request.getParameter("flat");
		//System.out.println(fullname+" "+uname+" "+email+" "+mobile+" "+password+" "+gender+" "+floor+" "+flat);
		
		ArrayList<String>a=new ArrayList<String>();
		a.add(email);
		a.add("Regarding Society Financial Management Loign credentials.");
		a.add("Welcome to our green Society.\n Below are the our acount Login credentials. Please login and get an idea of our monthly financial details.\n username: "+uname+"\npassword: "+password+" \n Have a login in below website.\nwebsite: http://localhost:8081/financialmanagement/login.jsp");
		Mail m=new Mail();
		try {
			m.sendMail(a);
		} catch (MessagingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		int n=Integer.parseInt(request.getParameter("family"));
		RegisterService registerservice=new RegisterService();

		if(n>0) {
			ArrayList<MembersModal>members=new ArrayList<MembersModal>();
			String nname[]=request.getParameterValues("name1");
			String nrel[]=request.getParameterValues("rel1");
			String ngen[]=request.getParameterValues("gen1");
			for(int i=0;i<n;i++)
			{
				members.add(new MembersModal(uname,nname[i], nrel[i], ngen[i],n));
			}
			System.out.println(members);
			try {
				registerservice.putMembers(members);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		String test_hash = "$2a$06$.rCVZVOThsIa97pEDOxvGuRRgzG64bvtJ0938xuqzv18d3ZpQhstC";

		PasswordHash b = new PasswordHash();
		password=b.hashPassword(password);
		
		
		RegisterModel registermodel=new RegisterModel(uname, email, password, fullname, mobile, gender, floor, flat);
		
		registerservice.putData(registermodel);
		
		
//		PrintWriter out=response.getWriter();
//		out.println(uname +" "+email+" "+password);
		System.out.print("registered");
		response.sendRedirect("login.jsp");

	}

}
