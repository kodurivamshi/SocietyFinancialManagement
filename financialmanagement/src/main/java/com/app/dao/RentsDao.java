package com.app.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.app.models.BillModel;
import com.app.models.RegisterModel;
import com.sun.net.httpserver.Authenticator.Result;

public class RentsDao {
	DBconnection db=new DBconnection();
	public String getName(String uname) throws SQLException, ClassNotFoundException {
		Connection con=db.connection();
		String query="select fullname from users where username=?";
		PreparedStatement st=con.prepareStatement(query);
		st.setString(1,uname);
		ResultSet rs1=st.executeQuery();
		String fullname=null;
		if(rs1.next())
			fullname=rs1.getString("fullname");
		return fullname;
	
	}
	
	public ArrayList<RegisterModel> getUnameFname() throws ClassNotFoundException, SQLException{
		Connection con=db.connection();
		String query="select username,fullname,email from users";
		PreparedStatement st=con.prepareStatement(query);
		ResultSet rs=st.executeQuery();
		ArrayList<RegisterModel>rm=new ArrayList<RegisterModel>();
		while(rs.next()) {
			rm.add(new RegisterModel(rs.getString("username"), rs.getString("fullname"), rs.getString("email")));
		}
		return rm;
	}
	
	public void setElectricityBill(String uname,int bill) throws SQLException, ClassNotFoundException {
		Connection con=db.connection();
		String query="update "+this.getuName(uname)+" set electricitybill=? order by id desc limit 1";
		PreparedStatement st=con.prepareStatement(query);
		st.setInt(1, bill);
		st.executeUpdate();
		
		query="select totalpending from "+this.getuName(uname)+" order by id desc limit 1";
		st=con.prepareStatement(query);
		ResultSet rs=st.executeQuery();
		if(rs.next()) {
			bill+=rs.getInt("totalpending");
			query="update "+this.getuName(uname)+" set totalpending=? order by id desc limit 1";
			st=con.prepareStatement(query);
			st.setInt(1, bill);
			st.executeUpdate();
			
		}
		
	}
	
	public ArrayList<BillModel> getUsers() throws ClassNotFoundException, SQLException {
		Connection con=db.connection();
		String query="select username from users";
		PreparedStatement st=con.prepareStatement(query);
		ResultSet rs1=st.executeQuery();
		//BillModel bm[]=new BillModel[size];
		ArrayList<BillModel>bm=new ArrayList<BillModel>();
		int i=0;
		while(rs1.next()) {
			if(!rs1.getString(1).equals("admin")) {
			System.out.println(rs1.getString(1));
			query="SELECT  * FROM  "+rs1.getString(1)+" ORDER BY  id DESC LIMIT 1";
			st=con.prepareStatement(query);
			ResultSet rs=st.executeQuery();
			if(rs.next())
				bm.add(new BillModel(this.getName(rs1.getString(1)),rs.getInt("roomrent"),rs.getInt("electricitybill"),rs.getInt("waterbill"),rs.getInt("trashbill"),rs.getInt("sewerbill"),rs.getInt("maintancebill"),rs.getInt("fine"),rs.getInt("totalpending"),rs.getInt("totalpaid"),rs.getString("paid"),rs.getDate("date")));
				//bm[i++]=new BillModel(rs.getInt("roomrent"),rs.getInt("electricitybill"),rs.getInt("waterbill"),rs.getInt("trashbill"),rs.getInt("sewerbill"),rs.getInt("maintancebill"),rs.getInt("fine"),rs.getInt("totalpending"),rs.getInt("totalpaid"),rs.getString("paid"),rs.getDate("date"));
				//System.out.println(rs.getString("roomrent"));
				
		}
		}
		//System.out.println(bm);
		return bm;
	}
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
	public void updateRents(String fname, String[] bills) throws ClassNotFoundException, SQLException {
		Connection con=db.connection();
		String uname=this.getuName(fname);
		String query="SELECT  * FROM  "+uname+" ORDER BY  id DESC LIMIT 1";
		PreparedStatement st=con.prepareStatement(query);
		ResultSet rs=st.executeQuery();
		int t=0;
		if(rs.next()) {
			for(String i:bills) {
				if(!i.equals("partial")&& !i.equals("yes")&& !i.equals("no")) {
			t+=rs.getInt(i);
			query="update "+ uname +" set "+ i +" = "+ 0 +" order by id desc limit 1";
			st=con.prepareStatement(query);
			int rs1=st.executeUpdate();
				}else {
					query="update "+ uname +" set paid =?  order by id desc limit 1";
					st=con.prepareStatement(query);
					st.setString(1, i);
					int r=st.executeUpdate();				
				}
			}
		}
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		
		query="update "+ uname +" set date =?, totalpending = "+ (rs.getInt("totalpending")-t) +",totalpaid ="+ (rs.getInt("totalpaid")+t) +" order by id desc limit 1";
		st=con.prepareStatement(query);
		st.setTimestamp(1, date);
		int rs1=st.executeUpdate();
	System.out.println(t);
	}
	
	public void addRents() throws ClassNotFoundException, SQLException {
		Connection con=db.connection();
		String query="select username from users";
		PreparedStatement st=con.prepareStatement(query);
		ResultSet rs=st.executeQuery();
		
		while(rs.next()) {
			if(!rs.getString("username").equals("admin")) {
				java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
				
				query="insert into "+rs.getString("username")+"(roomrent,electricitybill,waterbill,trashbill,sewerbill,maintancebill,fine,totalpending,totalpaid,paid,date) values(?,?,?,?,?,?,?,?,?,?,?)";
				st=con.prepareStatement(query);
				st.setInt(1,8000);
				st.setInt(2,0);
				st.setInt(3,500);
				st.setInt(4,100);
				st.setInt(5,200);
				st.setInt(6,1000);
				st.setInt(7,0);
				st.setInt(8,9800);
				st.setInt(9,0);
				st.setString(10,"no");
				st.setTimestamp(11, date);
				st.executeUpdate();
				System.out.println("BILLS posted");
				
			}
		}
	}
	public void addFine() throws ClassNotFoundException, SQLException {
		Connection con=db.connection();
		String query="select username from users";
		PreparedStatement st=con.prepareStatement(query);
		ResultSet rs=st.executeQuery();
		while(rs.next()) {
			query="select paid from "+rs.getString("username")+" order by id desc limit 1";
			st=con.prepareStatement(query);
			ResultSet rs1=st.executeQuery();
			if(rs.next()) {
				if(!rs.getString("paid").equals("yes")) {
					query="update "+rs.getString("username")+" set fine=? order by id desc limit 1";
					st=con.prepareStatement(query);
					st.setInt(1, 100);
					st.executeUpdate();
				}
			}
		}
	}
}
