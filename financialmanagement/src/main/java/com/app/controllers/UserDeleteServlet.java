package com.app.controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.models.AdressModal;
import com.app.models.RegisterModel;
import com.app.services.RegisterService;
import com.app.services.RentsService;

/**
 * Servlet implementation class UserDeleteServlet
 */
public class UserDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDeleteServlet() {
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
		String uname=request.getParameter("deleteusername");
		String flat=request.getParameter("flat");
		String apartment=request.getParameter("apartment");
		String street=request.getParameter("street");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		System.out.println(uname);
		RegisterService rs=new RegisterService();
		RentsService rent=new RentsService();
		HttpSession session=request.getSession();
		AdressModal am=new AdressModal(uname, null, null, flat, apartment, street, city, state);
		try {
			rs.putDeletedUsers(am);
			session.removeAttribute("oldusers");
			session.setAttribute("oldusers",rs.getDeletedUsers());
			//System.out.println(session.getAttribute("olderusers"));
			session.removeAttribute("tenants");
			session.setAttribute("tenants",rs.deleteUser(uname));
			session.removeAttribute("rents");
			session.setAttribute("rents", rent.getUsers());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//request.getRequestDispatcher("tenants.jsp").forward(request, response);
		response.sendRedirect("tenants.jsp");
	}

}
