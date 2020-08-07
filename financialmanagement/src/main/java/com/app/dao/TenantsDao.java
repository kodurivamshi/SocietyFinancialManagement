package com.app.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.app.models.MembersModal;
import com.app.models.RegisterModel;

public class TenantsDao {
	
	DBconnection db=new DBconnection();

	public ArrayList<RegisterModel> getTenants() throws ClassNotFoundException, SQLException {
		Connection con=db.connection();
		String query="select * from users";
		PreparedStatement st=con.prepareStatement(query);
		ResultSet rs=st.executeQuery();
		ArrayList<RegisterModel>a=new ArrayList<RegisterModel>();
		while(rs.next()) {
			//System.out.println(rs.getString("fullname"));
			a.add(new RegisterModel(rs.getString("username"), rs.getString("fullname"), rs.getNString("email"),rs.getString("mobile"), rs.getString("gender"),rs.getString("floor"),rs.getString("flat")));
		}
		System.out.println(a);
		return a;
	}

	public ArrayList<MembersModal> getMembers() throws ClassNotFoundException, SQLException {
		Connection con=db.connection();
		String query="select * from members";
		PreparedStatement st=con.prepareStatement(query);
		ResultSet rs=st.executeQuery();
		ArrayList<MembersModal>am=new ArrayList<MembersModal>();
		while(rs.next()) {
			am.add(new MembersModal(rs.getString("username"), rs.getString("name"), rs.getString("relation"), rs.getString("gender"),rs.getInt("familycount")));
		}
		return am;
	}

	public void putMembers(ArrayList<MembersModal> members) throws ClassNotFoundException, SQLException {
		Connection con=db.connection();
		
	String query="select familycount from members where username=? limit 1";
	PreparedStatement st=con.prepareStatement(query);
	st.setString(1, members.get(0).getUsername());
	ResultSet rs=st.executeQuery();
	int n=0;
	if(rs.next())
		n=rs.getInt("familycount");
	
	
		query="insert into members(username,name,relation,gender,familycount) values(?,?,?,?,?)";
		st=con.prepareStatement(query);
		for(int i=0;i<members.size();i++) {
			st.setString(1, members.get(i).getUsername());
			st.setString(2, members.get(i).getName());
			st.setString(3, members.get(i).getRelation());
			st.setString(4, members.get(i).getGender());
			st.setInt(5, members.get(i).getFamilycount()+n);
			st.executeUpdate();
		}
		
		query="update members set familycount=? where username=?";
		st=con.prepareStatement(query);
		st.setInt(1, n+members.get(0).getFamilycount());
		st.setString(2,members.get(0).getUsername());
		st.executeUpdate();
	}

}
