package com.app.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.app.models.ComplaintModel;

public class ComplaintDao {
	DBconnection db=new DBconnection();
	
	public void putComplaint(ComplaintModel cm) throws ClassNotFoundException, SQLException {
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		
		
		Connection con=db.connection();
		String query="insert into complaints(name,flat,complaint,seen,amount,date) values(?,?,?,?,?,?)";
		PreparedStatement st=con.prepareStatement(query);
		//st.setInt(1,1);
		st.setString(1,cm.getName());
		st.setString(2,cm.getFlat());
		st.setString(3,cm.getComplaint());
		st.setString(4, "no");
		st.setInt(5,0);
		st.setTimestamp(6, date);
		st.executeUpdate();
		System.out.print("Complaint posted");
	}
	
	public ArrayList<ComplaintModel> getComplaint() throws ClassNotFoundException, SQLException {
		ArrayList<ComplaintModel>cm=new ArrayList<ComplaintModel>();
		
		Connection con=db.connection();
		String query="select * from complaints where seen=? order by id desc";
		PreparedStatement st=con.prepareStatement(query);
		st.setString(1,"no");
		ResultSet rs=st.executeQuery();
		while(rs.next()) {
			cm.add(new ComplaintModel(rs.getString("name"),rs.getString("flat"), rs.getString("complaint"),rs.getString("seen"),rs.getInt("amount"),rs.getDate("date")));
		}
		System.out.println(cm);
	return cm;
	}
	
	public void updateComplaint(ComplaintModel cm) throws ClassNotFoundException, SQLException {
java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		
		
		Connection con=db.connection();
		String query="update complaints set seen=?,amount=?,date=? where name=?";
		PreparedStatement st=con.prepareStatement(query);
		st.setString(1, cm.getSeen());
		st.setInt(2, cm.getAmount());
		st.setTimestamp(3, date);
		st.setString(4, cm.getName());
		st.executeUpdate();
	}
	
}
