package com.app.controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.models.ComplaintModel;
import com.app.services.ComplaintService;

/**
 * Servlet implementation class ComplaintServlet
 */
public class ComplaintServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComplaintServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String name=request.getParameter("name");
    	String seen=request.getParameter("seen");
    	int amount=Integer.parseInt(request.getParameter("amount"));
    	System.out.println(name+" "+seen+" "+amount);
    	
    	ComplaintModel cm=new ComplaintModel(name, null, null, seen, amount, null);
    	ComplaintService cs=new ComplaintService();
    	
    	try {
			cs.updateComplaint(cm);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	response.sendRedirect("complaints.jsp");	
    	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=(String)request.getParameter("name");
		String flat=(String)request.getParameter("flat");
		String complaint=(String)request.getParameter("complaint");
		ComplaintModel cm=new ComplaintModel(name, flat, complaint,null,0,null);
		ComplaintService cs=new ComplaintService();
		try {
			cs.putComplaint(cm);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("contact.jsp");
	}

}
