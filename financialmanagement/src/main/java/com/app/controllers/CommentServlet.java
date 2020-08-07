package com.app.controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.dao.ReportDao;
import com.app.models.CommentModal;
import com.app.services.CommentService;
import com.app.services.NoticeService;
import com.sun.tools.javac.parser.Tokens.Comment;

/**
 * Servlet implementation class CommentServlet
 */
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id2"));
		int amount=Integer.parseInt(request.getParameter("amount"));
		NoticeService ns=new NoticeService();
		
		try {
			ns.updateAmount(id, amount);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("notice.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));
		System.out.println(id);
		HttpSession session=request.getSession();
		String uname=(String) session.getAttribute("uname");
		String comment=request.getParameter("comment");
		CommentService cs=new CommentService();
		CommentModal cm=new CommentModal(id, uname, comment);
		
		try {
			cs.putComment(cm);
			System.out.println("comment inserted..");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("usernotice.jsp");
	}

}
