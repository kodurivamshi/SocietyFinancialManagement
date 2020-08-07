package com.app.services;

import java.sql.SQLException;
import java.util.ArrayList;

import com.app.dao.ComplaintDao;
import com.app.models.ComplaintModel;

public class ComplaintService {
	public void putComplaint(ComplaintModel cm) throws ClassNotFoundException, SQLException {
		ComplaintDao cd=new  ComplaintDao();
		cd.putComplaint(cm);
	}

	public ArrayList<ComplaintModel> getComplaints() throws ClassNotFoundException, SQLException {
		ComplaintDao cd=new ComplaintDao();
		return cd.getComplaint();
	}
	
	public void updateComplaint(ComplaintModel cm) throws ClassNotFoundException, SQLException {
		ComplaintDao cd=new  ComplaintDao();
		cd.updateComplaint(cm);
	}

	
}
