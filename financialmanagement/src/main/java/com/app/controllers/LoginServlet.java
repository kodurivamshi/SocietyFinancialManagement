package com.app.controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.config.Mail;
import com.app.services.ComplaintService;
import com.app.services.LoginService;
import com.app.services.RegisterService;
import com.app.services.RentsService;
import com.app.services.TenantsService;

public class LoginServlet extends HttpServlet implements Runnable {
	private static final long serialVersionUID = 1L;
   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoginService ls=new LoginService();
		HttpSession session=request.getSession();
		String name=request.getParameter("username");
		
		if(name.equals("admin")) {
			RegisterService rs1=new RegisterService();
			RentsService rs=new RentsService();
			TenantsService ts=new TenantsService();
			ComplaintService cs=new ComplaintService();
			session.setAttribute("admin", name);
			try {
				session.setAttribute("complaints", cs.getComplaints());
				session.setAttribute("tenants", ts.getTenants());
				session.setAttribute("rents", rs.getUsers());
				session.setAttribute("members", ts.getMembers());
				session.setAttribute("oldusers",rs1.getDeletedUsers());
				System.out.println(session.getAttribute("complaints"));
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		request.getRequestDispatcher("rents.jsp").forward(request, response);
		//response.sendRedirect("rents.jsp");
		}
		else {
		//request.setAttribute("uname",name);
		try {
			session.setAttribute("uname", ls.getName(name));
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		session.removeAttribute("invalid");
		try {
			session.setAttribute("bill",ls.getData(name));
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//response.sendRedirect("home.jsp");
		request.getRequestDispatcher("home.jsp").forward(request, response);
		}
	}
	@Override
	public void run() {
		// TODO Auto-generated method stub
		System.out.println("after 1 minute...");
	}
}
