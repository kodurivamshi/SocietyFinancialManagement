package com.app.services;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;

import com.app.dao.RegisterDao;
import com.app.models.AdressModal;
import com.app.models.MembersModal;
import com.app.models.RegisterModel;

public class RegisterService {

	public void putData(RegisterModel registermodel) {
		// TODO Auto-generated method stub
		RegisterDao registerdao=new RegisterDao();
		try {
			registerdao.putData(registermodel);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public boolean checkUser(RegisterModel rm) {
		// TODO Auto-generated method stub
		RegisterDao register=new RegisterDao();
		try {
			if(register.find(rm)) {
				return true;
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		return false;

	}

	public void putMembers(ArrayList<MembersModal> members) throws ClassNotFoundException, SQLException {
		RegisterDao rd=new RegisterDao();
		rd.putMembers(members);
		
	}

	public ArrayList<RegisterModel> updateUser(RegisterModel rm) throws ClassNotFoundException, SQLException {
		RegisterDao rd=new RegisterDao();
		return rd.updateUser(rm);
		
	}

	public ArrayList<RegisterModel> deleteUser(String uname) throws ClassNotFoundException, SQLException {
		RegisterDao rd=new RegisterDao();
		return rd.deleteUser(uname);
	}

	public void deleteMember(String uname) throws ClassNotFoundException, SQLException {
		RegisterDao rd=new RegisterDao();
		rd.deleteMember(uname);
	}

	public void  putDeletedUsers(AdressModal am) throws ClassNotFoundException, SQLException{
		// TODO Auto-generated method stub
		RegisterDao rd=new RegisterDao();
		rd.putDeletedUsers(am);
	}

	public ArrayList<AdressModal> getDeletedUsers() throws ClassNotFoundException, SQLException{
		RegisterDao rd=new RegisterDao();
		return rd.getDeletedUsers();

	}

	
}
