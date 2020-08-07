package com.app.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.app.models.CommentModal;

public class CommentDao {
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
	public void putComment(CommentModal cm) throws ClassNotFoundException, SQLException {
		Connection con=db.connection();
		String query="insert into comments values(?,?,?)";
		PreparedStatement st=con.prepareStatement(query);
		st.setInt(1, cm.getId());
		st.setString(2, this.getuName(cm.getUsername()));
		st.setString(3, cm.getComment());
		st.executeUpdate();
	}
	public ArrayList<CommentModal> getComments() throws ClassNotFoundException, SQLException{
		Connection con=db.connection();
		String query="select * from comments";
		PreparedStatement st=con.prepareStatement(query);
		ResultSet rs=st.executeQuery();
		ArrayList<CommentModal>cm=new ArrayList<CommentModal>();
		while(rs.next()) {
			cm.add(new CommentModal(rs.getInt("id"),rs.getString("username"),rs.getString("comment")));
		}
		System.out.println(cm);
		return cm;
	}
}
