package com.app.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.app.config.PasswordHash;
import com.app.models.BillModel;
import com.app.models.LoginModel;

public class LoginDao {

	DBconnection db=new DBconnection();
	
	
	public boolean find(LoginModel lm) throws SQLException, ClassNotFoundException {
		PasswordHash ph=new PasswordHash();
		//String test_hash = "$2a$06$.rCVZVOThsIa97pEDOxvGuRRgzG64bvtJ0938xuqzv18d3ZpQhstC";

		
		System.out.println(lm.getUname()+" "+lm.getPassword());
		
		Connection con=db.connection();
		
		String query="select * from users where username=?";
		PreparedStatement st=con.prepareStatement(query);
		st.setString(1,lm.getUname());
		ResultSet rs=st.executeQuery();
		if(rs.next()) {
			System.out.println(rs.getString("password"));
			if(ph.checkPassword(lm.getPassword(), rs.getString("password"))) {
				return true;
			}
		}
		return false;
	}
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
	
	public BillModel getData(String uname) throws ClassNotFoundException, SQLException {
		Connection con=db.connection();
		String query="SELECT  * FROM  "+uname+" ORDER BY  id DESC LIMIT 1";
		PreparedStatement st=con.prepareStatement(query);
		ResultSet rs=st.executeQuery();
		BillModel bm=null;
		
		
		if(rs.next()) {
			System.out.println(rs.getString("roomrent"));
			 bm=new BillModel(this.getName(uname),rs.getInt("roomrent"),rs.getInt("electricitybill"),rs.getInt("waterbill"),rs.getInt("trashbill"),rs.getInt("sewerbill"),rs.getInt("maintancebill"),rs.getInt("fine"),rs.getInt("totalpending"),rs.getInt("totalpaid"),rs.getString("paid"),rs.getDate("date"));
		}
		return bm;
	}
	
	
}
