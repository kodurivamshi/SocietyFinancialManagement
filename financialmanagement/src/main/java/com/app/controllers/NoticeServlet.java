package com.app.controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.models.NoticeModel;
import com.app.services.NoticeService;

/**
 * Servlet implementation class NoticeServlet
 */
public class NoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeService ns=new NoticeService();
		HttpSession session=request.getSession();
		ArrayList<String>s=new ArrayList<String>();
		if(request.getParameter("agree")!=null) {
			System.out.println(request.getParameter("id1")+"yes");
			s.add(request.getParameter("id1"));
			s.add((String)session.getAttribute("uname"));
			s.add("yes");
		}
		if(request.getParameter("disagree")!=null) {
			System.out.println(request.getParameter("id2")+"no");
			s.add(request.getParameter("id2"));
			s.add((String)session.getAttribute("uname"));
			s.add("no");
		}
		try {
			session.setAttribute("count", ns.putLike(s));
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("usernotice.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String head=request.getParameter("heading");
		String body=request.getParameter("subject");
		
		NoticeModel nm=new NoticeModel(0,head, body,0, null);
		NoticeService ns=new NoticeService();
		
		try {
			ns.putNotice(nm);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("action.jsp");
	}

}
