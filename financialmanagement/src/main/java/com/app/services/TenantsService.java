package com.app.services;

import java.sql.SQLException;
import java.util.ArrayList;

import com.app.dao.TenantsDao;
import com.app.models.MembersModal;
import com.app.models.RegisterModel;

public class TenantsService {

	public ArrayList<RegisterModel> getTenants() throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		TenantsDao td=new TenantsDao();
		return td.getTenants();
	}

	public ArrayList<MembersModal> getMembers() throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		TenantsDao td=new TenantsDao();
		return td.getMembers();
	}

	public void putMembers(ArrayList<MembersModal> members) throws ClassNotFoundException, SQLException {
		TenantsDao td=new TenantsDao();
		td.putMembers(members);
	}
	

}
