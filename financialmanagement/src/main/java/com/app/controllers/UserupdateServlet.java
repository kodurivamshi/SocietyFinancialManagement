package com.app.controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.models.RegisterModel;
import com.app.services.RegisterService;

/**
 * Servlet implementation class UserupdateServlet
 */
public class UserupdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserupdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname=request.getParameter("username");
		String fullname=request.getParameter("fullname");
		String email=request.getParameter("email");
		String gender=request.getParameter("gender");
		String mobile=request.getParameter("mobile");
		String floor=request.getParameter("floor");
		String flat=request.getParameter("flat");
		System.out.println("ss");
		RegisterModel rm=new RegisterModel(uname,fullname,email,mobile,gender,floor,flat);
		RegisterService rs=new RegisterService();
		
		HttpSession session=request.getSession();
		
		try {
			session.removeAttribute("tenants");
			session.setAttribute("tenants",rs.updateUser(rm));
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("tenants.jsp");
	}

}
