package com.app.services;

import java.sql.SQLException;
import java.util.ArrayList;

import com.app.dao.RegisterDao;
import com.app.dao.RentsDao;
import com.app.models.BillModel;
import com.app.models.RegisterModel;

public class RentsService {
	public ArrayList<BillModel> getUsers() throws ClassNotFoundException, SQLException{
		RentsDao rd=new RentsDao();
		return rd.getUsers();
	}
	public void updateRents(String uname,String[] bills) throws ClassNotFoundException, SQLException {
		RentsDao rd=new RentsDao();
		rd.updateRents(uname,bills);
		
	}
	public void setElecBill(String uname,int bill) throws ClassNotFoundException, SQLException {
		RentsDao rd=new RentsDao();
		rd.setElectricityBill(uname,bill);
		
	}
	public void addRents() throws ClassNotFoundException, SQLException {
		RentsDao rd=new RentsDao();
		rd.addRents();
	}
	public ArrayList<RegisterModel> getUnameFname() throws ClassNotFoundException, SQLException{
		RentsDao rd=new RentsDao();
		return rd.getUnameFname();
	}
	public void addFine() throws ClassNotFoundException, SQLException {
		RentsDao rd=new RentsDao();
		rd.addFine();
	}
}
