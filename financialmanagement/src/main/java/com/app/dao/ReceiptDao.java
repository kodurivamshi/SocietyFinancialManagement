package com.app.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.websocket.Session;

import com.app.models.BillModel;

public class ReceiptDao {
	DBconnection db=new DBconnection();
	
	
	public String getuName(String fname) throws SQLException, ClassNotFoundException {
		Connection con=db.connection();
		String query="select username from users where fullname=?";
		PreparedStatement st=con.prepareStatement(query);
		st.setString(1,fname);
		ResultSet rs1=st.executeQuery();
		String uname=null;
		if(rs1.next())
			uname=rs1.getString("username");
		return uname;
	
	}
	
	
	public BillModel getReceipt(String fname,int month,int year) throws ClassNotFoundException, SQLException {
		Connection con=db.connection();
	String uname=this.getuName(fname);
	System.out.println(uname);
	
		String query="SELECT  * FROM  "+uname+" WHERE YEAR(Date) =? AND MONTH(Date) = ?";
		PreparedStatement st=con.prepareStatement(query);
		st.setInt(1, year);
		st.setInt(2, month);
		ResultSet rs=st.executeQuery();
		BillModel bm=null;
		if(rs.next()) {
			System.out.println("dd"+rs.getString("roomrent"));
			 bm=new BillModel(fname,rs.getInt("roomrent"),rs.getInt("electricitybill"),rs.getInt("waterbill"),rs.getInt("trashbill"),rs.getInt("sewerbill"),rs.getInt("maintancebill"),rs.getInt("fine"),rs.getInt("totalpending"),rs.getInt("totalpaid"),rs.getString("paid"),rs.getDate("date"));
		}
		System.out.println(bm);
		return bm;
	}
	public ArrayList<BillModel> getReceipts(String fname) throws ClassNotFoundException, SQLException {
		Connection con=db.connection();
	String uname=this.getuName(fname);
	System.out.println(uname);
	
		String query="SELECT  * FROM  "+uname;
		PreparedStatement st=con.prepareStatement(query);
		ResultSet rs=st.executeQuery();
		ArrayList<BillModel>bm=new ArrayList<BillModel>();
		while(rs.next()) {
			System.out.println("dd"+rs.getString("roomrent"));
			 bm.add(new BillModel(fname,rs.getInt("roomrent"),rs.getInt("electricitybill"),rs.getInt("waterbill"),rs.getInt("trashbill"),rs.getInt("sewerbill"),rs.getInt("maintancebill"),rs.getInt("fine"),rs.getInt("totalpending"),rs.getInt("totalpaid"),rs.getString("paid"),rs.getDate("date")));
		}
		System.out.println(bm);
		return bm;
	}

}
