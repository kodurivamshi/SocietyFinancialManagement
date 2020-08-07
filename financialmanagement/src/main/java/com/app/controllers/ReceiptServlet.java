package com.app.controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.app.models.BillModel;
import com.app.services.ReceiptService;


public class ReceiptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReceiptServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String uname=(String)session.getAttribute("uname");
		int month=Integer.parseInt(request.getParameter("month"));
		int year=Integer.parseInt(request.getParameter("year"));
		System.out.println(uname);
		ReceiptService rs=new ReceiptService();
		try {
			session.setAttribute("receipt", rs.getReceipt(uname, month, year));
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getRequestDispatcher("receipt.jsp").forward(request, response);
	}

}
