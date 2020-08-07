package com.app.controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.app.config.Mail;
import com.app.dao.RentsDao;
import com.app.dao.ReportDao;
import com.app.models.RegisterModel;
import com.app.services.RentsService;
import com.app.services.ReportService;

/**
 * Servlet implementation class RentsServlet
 */
public class RentsServlet extends HttpServlet implements Runnable {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RentsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] bills=request.getParameterValues("bill");
		HttpSession session=request.getSession();
		if(bills!=null) {
		for(String i:bills) {
			System.out.println(i);
		}
		String uname=request.getParameter("name");
		System.out.println(uname);
		RentsService rs=new RentsService();
		try {
			rs.updateRents(uname, bills);
			session.removeAttribute("rents");
			session.setAttribute("rents",rs.getUsers());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		
		request.getRequestDispatcher("rents.jsp").forward(request, response);
	}

	@Override
	public void run() {
		// TODO Auto-generated method stub
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		if(date.getDate()==1) {
			RentsService rs=new RentsService();
			try {
				rs.addRents();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		int d=date.getDate();
		if(d>=5 && d<=10) {
			ArrayList<String>a=new ArrayList<String>();
			ArrayList<RegisterModel>details=new ArrayList<RegisterModel>();
			RentsDao rd=new RentsDao();
			try {
				details=rd.getUnameFname();
				for(int i=0;i<details.size();i++) {
					a.add(details.get(i).getEmail());
					a.add("Remainder for Monthly Society rents Payment.");
					a.add("Hello "+details.get(i).getFullname()+",\n We are requesting you to kindly pay the society bills as soon as possible before 10th of this month. Otherwise you will be charged rupees 100 extra for delay payment.\n  Please, neglect this message if you are paid already.");
					Mail m=new Mail();
					try {
						m.sendMail(a);
					} catch (MessagingException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					a.clear();
				}
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(d==11) {
			RentsService rd=new RentsService();
			ReportService red=new ReportService();
			try {
				rd.addFine();
				red.putFee();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
