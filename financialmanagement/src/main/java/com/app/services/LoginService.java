package com.app.services;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;

import com.app.dao.LoginDao;
import com.app.models.BillModel;
import com.app.models.LoginModel;

public class LoginService {

	public boolean checkData(LoginModel lm) {
		// TODO Auto-generated method stub
		LoginDao ld=new LoginDao();
		
		try {
			if(ld.find(lm)) {
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
	public BillModel getData(String uname) throws ClassNotFoundException, SQLException {
		LoginDao ld=new LoginDao();
		return ld.getData(uname);
	}
	public String getName(String name) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		LoginDao ld=new LoginDao();
		return ld.getName(name);
	}

}
