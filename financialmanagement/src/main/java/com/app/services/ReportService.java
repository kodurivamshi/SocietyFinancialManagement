package com.app.services;

import java.sql.SQLException;
import java.util.ArrayList;

import com.app.dao.ReportDao;
import com.app.models.ExpenditureModel;
import com.app.models.MaintenanceModel;
import com.app.models.YearMaintenanceModel;

public class ReportService {

	public ArrayList<String> getInnames() throws ClassNotFoundException, SQLException{
		ReportDao rd=new ReportDao();
		return rd.getInnames();
	}
	public ArrayList<String> getOutnames() throws ClassNotFoundException, SQLException{
		ReportDao rd=new ReportDao();
		return rd.getOutnames();
	}
	public MaintenanceModel getFee() throws ClassNotFoundException, SQLException{
		ReportDao rd=new ReportDao();
		return rd.getMaintenanceFee();
	}
	public ArrayList<MaintenanceModel> getAllMaintenancefee() throws ClassNotFoundException, SQLException{
		ReportDao rd=new ReportDao();
		return rd.getAllMaintenanceFee();
	}
	public ArrayList<YearMaintenanceModel> getAllYearMaintenancefee() throws ClassNotFoundException, SQLException{
		ReportDao rd=new ReportDao();
		return rd.getAllYearMaintenanceFee();
	}
	public void putFee() throws ClassNotFoundException, SQLException{
		ReportDao rd=new ReportDao();
		rd.putMaintenanceFee();
	}
	public void putAllYearMaintenance() throws ClassNotFoundException, SQLException{
		ReportDao rd=new ReportDao();
		rd.putAllYearMaintenanceFee();
	}
	public void updateLiftBill(int bill) throws ClassNotFoundException, SQLException {
		ReportDao rd=new ReportDao();
		rd.UpdateLiftBill(bill);
	}
	public void updateSecurity(int bill) throws ClassNotFoundException, SQLException {
		ReportDao rd=new ReportDao();
		rd.UpdateSecurity(bill);;
	}
	public void updateCleaner(int bill) throws ClassNotFoundException, SQLException {
		ReportDao rd=new ReportDao();
		rd.UpdateCleaner(bill);
	}
	public ArrayList<Integer> getMonthlyExpenditure() throws ClassNotFoundException, SQLException{
		ReportDao rd=new ReportDao();
		return rd.getMonthlyExpenditure();
	}
	public ArrayList<ExpenditureModel> getDetailedMonthlyExpenditure() throws ClassNotFoundException, SQLException{
		ReportDao rd=new ReportDao();
		return rd.getDetailedMonthlyExpenditure();
	}
}
