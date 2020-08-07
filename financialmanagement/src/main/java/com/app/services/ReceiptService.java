package com.app.services;

import java.sql.SQLException;
import java.util.ArrayList;

import com.app.dao.ReceiptDao;
import com.app.models.BillModel;

public class ReceiptService {
	public BillModel getReceipt(String uname,int month,int year) throws ClassNotFoundException, SQLException {
		 ReceiptDao rd=new ReceiptDao();
		return rd.getReceipt(uname, month, year);
	}
	public ArrayList<BillModel> getReceipts(String fname)throws ClassNotFoundException, SQLException {
		 ReceiptDao rd=new ReceiptDao();
		return rd.getReceipts(fname);
	}

}
