package com.app.dao;

import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.app.models.ExpenditureModel;
import com.app.models.MaintenanceModel;
import com.app.models.YearMaintenanceModel;

public class ReportDao {
	DBconnection db=new DBconnection();
	ArrayList<String>s=new ArrayList<String>();
	ArrayList<String>s1=new ArrayList<String>();
	public ResultSet getnames() throws ClassNotFoundException, SQLException {
		Connection con=db.connection();
		String query="select fullname,username from users";
		PreparedStatement st=con.prepareStatement(query);
		ResultSet rs=st.executeQuery();
		return rs;
	}
	public ArrayList<String> getInnames() throws ClassNotFoundException, SQLException {
		Connection con=db.connection();
		ResultSet rs=this.getnames();
		s.clear();
		while(rs.next()) {
			String a=rs.getString("username");
			String b=rs.getString("fullname");
			if(!b.equals("administrator")) {
			String query="select * from "+a+" order by id desc limit 1";
			PreparedStatement st=con.prepareStatement(query);
			ResultSet rs1=st.executeQuery();
			if(rs1.next()) {
				if(rs1.getString("paid").equals("yes")) {
				String c=(rs1.getDate("date")).toString();
				String d=c.substring(8,10);
				System.out.println(d);
				if(d.compareTo("10")<=0) {
					s.add(b);
				}
				}
			}
			}
		}
		System.out.println(s);
		return s;
	}
	public ArrayList<String> getOutnames() throws ClassNotFoundException, SQLException {
		Connection con=db.connection();
		ResultSet rs=this.getnames();
		
		s1.clear();
		while(rs.next()) {
			String a=rs.getString("username");
			String b=rs.getString("fullname");
			if(!b.equals("administrator")) {
			String query="select * from "+a+" order by id desc limit 1";
			PreparedStatement st=con.prepareStatement(query);
			ResultSet rs1=st.executeQuery();
			if(rs1.next()) {
				
				String c=(rs1.getDate("date")).toString();
				String d=c.substring(8,10);
				System.out.println(d.compareTo("10"));
				if(d.compareTo("10")>=1) {
					s1.add(b);
				}
			
			}
			}
		}
		System.out.println(s1);
		return s1;
	}
	
	public ArrayList<String> getUserNamesformail() throws ClassNotFoundException, SQLException {
		Connection con=db.connection();
		ResultSet rs=this.getnames();
		s.clear();
		while(rs.next()) {
			String a=rs.getString("username");
			String b=rs.getString("fullname");
			if(!b.equals("administrator")) {
			String query="select * from "+a+" order by id desc limit 1";
			PreparedStatement st=con.prepareStatement(query);
			ResultSet rs1=st.executeQuery();
			if(rs1.next()) {
				if(rs1.getString("paid").equals("yes")) {
				String c=(rs1.getDate("date")).toString();
				String d=c.substring(8,10);
				System.out.println(d);
				if(d.compareTo("10")<=0) {
					s.add(b);
				}
				}
			}
			}
		}
		System.out.println(s);
		return s;
	}
	
	public void UpdateLiftBill(int bill) throws ClassNotFoundException, SQLException {
		Connection con=db.connection();
		String query="update maintenance set lift_bill=? order by id desc limit 1";
		PreparedStatement st=con.prepareStatement(query);
		st.setInt(1, bill);
		st.executeUpdate();
	}
	public void UpdateSecurity(int bill) throws ClassNotFoundException, SQLException {
		Connection con=db.connection();
		String query="update maintenance set security_fee=? order by id desc limit 1";
		PreparedStatement st=con.prepareStatement(query);
		st.setInt(1, bill);
		st.executeUpdate();
	}
	public void UpdateCleaner(int bill) throws ClassNotFoundException, SQLException {
		Connection con=db.connection();
		String query="update maintenance set cleaner_fee=? order by id desc limit 1";
		PreparedStatement st=con.prepareStatement(query);
		st.setInt(1, bill);
		st.executeUpdate();
	}
	
	public void putMaintenanceFee() throws ClassNotFoundException, SQLException {
		Connection con=db.connection();
		String query="select * from maintenance order by id desc limit 1";
		PreparedStatement st=con.prepareStatement(query);
		ResultSet rs=st.executeQuery();
		if(rs.next()) {
			if(rs.getInt("id")==12) {
				this.putAllYearMaintenanceFee();
				st=con.prepareStatement("truncate table maintenance");
				st.executeUpdate();
				
				st=con.prepareStatement("insert into maintenance values(?,?,?,?,?,?,?)");
				st.setInt(1, 1);
				st.setInt(2, rs.getInt("total_maintenance"));
				st.setInt(3, rs.getInt("security_fee"));
				st.setInt(4, rs.getInt("cleaner_fee"));
				st.setInt(5, rs.getInt("goods_fee"));
				st.setInt(6, rs.getInt("lift_bill"));
				st.setInt(7, rs.getInt("savings"));
				st.executeUpdate();
			}
			else {
				st=con.prepareStatement("insert into maintenance values(?,?,?,?,?,?,?)");
				st.setInt(1, rs.getInt("id")+1);
				st.setInt(2, rs.getInt("total_maintenance"));
				st.setInt(3, rs.getInt("security_fee"));
				st.setInt(4, rs.getInt("cleaner_fee"));
				st.setInt(5, rs.getInt("goods_fee"));
				st.setInt(6, rs.getInt("lift_bill"));
				st.setInt(7, rs.getInt("savings"));
				st.executeUpdate();
		}
		}
	}
	public MaintenanceModel getMaintenanceFee() throws ClassNotFoundException, SQLException {
		Connection con=db.connection();
		String query="select * from maintenance order by id desc limit 1";
		PreparedStatement st=con.prepareStatement(query);
		ResultSet rs=st.executeQuery();
		MaintenanceModel m=null;
		if(rs.next()) {
			m=new MaintenanceModel(rs.getInt("id"), rs.getInt("total_maintenance"),rs.getInt("security_fee")+rs.getInt("cleaner_fee"), rs.getInt("security_fee"), rs.getInt("cleaner_fee"), rs.getInt("goods_fee"), rs.getInt("lift_bill"), rs.getInt("savings"));	
		}
		System.out.println(m);
		return m;
	}
	public ArrayList<MaintenanceModel> getAllMaintenanceFee() throws ClassNotFoundException, SQLException {
		Connection con=db.connection();
		String query="select * from maintenance";
		PreparedStatement st=con.prepareStatement(query);
		ResultSet rs=st.executeQuery();
		MaintenanceModel m=null;
		ArrayList<MaintenanceModel>mm=new ArrayList<MaintenanceModel>();
		while(rs.next()) {
			mm.add(new MaintenanceModel(rs.getInt("id"), rs.getInt("total_maintenance"),rs.getInt("security_fee")+rs.getInt("cleaner_fee"), rs.getInt("security_fee"), rs.getInt("cleaner_fee"), rs.getInt("goods_fee"), rs.getInt("lift_bill"), rs.getInt("savings")));			
		}
		System.out.println(mm);
		return mm;
	}
	public ArrayList<Integer> getMonthlyExpenditure() throws ClassNotFoundException, SQLException{
		Connection con=db.connection();
		String query="select sum(amount) as a from complaints where MONTH(date)=?";
		PreparedStatement st=con.prepareStatement(query);
		Date d=new Date();
		int m=d.getMonth()+1;
		st.setInt(1, m);
		ResultSet rs=st.executeQuery();
		ArrayList<Integer>a=new ArrayList<Integer>();
		if(rs.next()) {
			a.add(rs.getInt("a"));
		}
		query="select sum(amount) as a from notice where MONTH(date)=?";
		st=con.prepareStatement(query);
		st.setInt(1, m);
	 rs=st.executeQuery();
		if(rs.next()) {
			a.add(rs.getInt("a"));
		}
		return a;
	}
	public ArrayList<ExpenditureModel> getDetailedMonthlyExpenditure() throws ClassNotFoundException, SQLException{
		Connection con=db.connection();
		String query="select amount,complaint from complaints where MONTH(date)=?";
		PreparedStatement st=con.prepareStatement(query);
		Date d=new Date();
		int m=d.getMonth()+1;
		st.setInt(1, m);
		ResultSet rs=st.executeQuery();
		ArrayList<ExpenditureModel>a=new ArrayList<ExpenditureModel>();
		while(rs.next()) {
			a.add(new ExpenditureModel(rs.getString("complaint"),rs.getInt("amount")));
		}
		
		query="select heading,amount from notice where MONTH(date)=?";
		st=con.prepareStatement(query);
		st.setInt(1, m);
	 rs=st.executeQuery();
		if(rs.next()) {
			a.add(new ExpenditureModel(rs.getString("heading"),rs.getInt("amount")));
		}
		return a;
	}
	public ArrayList<YearMaintenanceModel> getAllYearMaintenanceFee() throws ClassNotFoundException, SQLException {
		Connection con=db.connection();
		String query="select * from yearmaintenance";
		PreparedStatement st=con.prepareStatement(query);
		ResultSet rs=st.executeQuery();
		ArrayList<YearMaintenanceModel>mm=new ArrayList<YearMaintenanceModel>();
		while(rs.next()) {
			mm.add(new YearMaintenanceModel(rs.getInt("year"),rs.getInt("expenditure")));			
		}
		System.out.println(mm);
		return mm;
	}
	@SuppressWarnings("deprecation")
	public void putAllYearMaintenanceFee() throws ClassNotFoundException, SQLException {
		Connection con=db.connection();
		String query="select sum(security_fee) as sf, sum(cleaner_fee) as cf,sum(goods_fee) as gf,sum(lift_bill) as lb from maintenance";
		PreparedStatement st=con.prepareStatement(query);
		ResultSet rs=st.executeQuery();
		int expen=0;
		if(rs.next()) {
			expen+=rs.getInt("sf")+rs.getInt("cf")+rs.getInt("gf")+rs.getInt("lb");
		}
		//java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		Date d=new Date();
		int y=d.getYear()+1900-1;
		
		
		query="select sum(amount) as a from complaints where YEAR(date)=?";
		st=con.prepareStatement(query);
		st.setInt(1,y);
		rs=st.executeQuery();
		if(rs.next())
			expen+=rs.getInt("a");
		System.out.println(expen+" "+y);
		query="insert into yearmaintenance values(?,?)";
		st=con.prepareStatement(query);
		st.setInt(1, y);
		st.setInt(2, expen);
		st.executeUpdate();
		
	}
}
