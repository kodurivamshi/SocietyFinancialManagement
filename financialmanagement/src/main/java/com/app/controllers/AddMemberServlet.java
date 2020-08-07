package com.app.controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.models.MembersModal;
import com.app.services.RegisterService;
import com.app.services.TenantsService;

/**
 * Servlet implementation class AddMemberServlet
 */
public class AddMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname=request.getParameter("addusername");
		System.out.println(uname);
		int n=Integer.parseInt(request.getParameter("family"));
		TenantsService ts=new TenantsService();
		HttpSession session=request.getSession();
		
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
				ts.putMembers(members);
				session.removeAttribute("members");
				session.setAttribute("members", ts.getMembers());
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		
		
		
		response.sendRedirect("tenants.jsp");
	}

}
