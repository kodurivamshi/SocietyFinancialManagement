package com.app.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.app.models.LikeModal;
import com.app.models.NoticeModel;
import com.sun.net.httpserver.Authenticator.Result;

public class NoticeDao {
	DBconnection db=new DBconnection();
	
	public void putNotice(NoticeModel nm) throws ClassNotFoundException, SQLException {
		Connection con=db.connection();
		
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		
		
		String query="insert into notice(heading,body,amount,date) values(?,?,?,?)";
		PreparedStatement st=con.prepareStatement(query);
		st.setString(1, nm.getHead());
		st.setString(2, nm.getBody());
		st.setInt(3, 0);
		st.setTimestamp(4, date);
		st.executeUpdate();
		
		query="select id from notice order by id desc limit 1";
		st=con.prepareStatement(query);
		ResultSet rs=st.executeQuery();
		int id=0;
		if(rs.next())
			id=rs.getInt("id");
		
		query="select username from users";
		st=con.prepareStatement(query);
		rs=st.executeQuery();
		while(rs.next()) {
			query="insert into likes values(?,?,?)";
			st=con.prepareStatement(query);
			st.setInt(1, id);
			st.setString(2, rs.getString("username"));
			st.setString(3, "yes");
			st.executeUpdate();
		}

		
	}
	public void updateAmount(int id,int amount) throws ClassNotFoundException, SQLException {
		Connection con=db.connection();
		String query="update notice set amount=? where id=?";
		PreparedStatement st=con.prepareStatement(query);
		st.setInt(1, amount);
		st.setInt(2, id);
		st.executeUpdate();
		this.deleteCommentsLikes(id);
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
	public ArrayList<Integer> putLike(ArrayList<String> s) throws ClassNotFoundException, SQLException {
		Connection con=db.connection();
		String query="update likes set agree=? where id=? and username=?";
		PreparedStatement st=con.prepareStatement(query);
		st.setString(1, s.get(2));
		st.setInt(2, Integer.parseInt(s.get(0)));
		st.setString(3, this.getuName(s.get(1)));
		st.executeUpdate();
		
		
		return null;
	}
	public ArrayList<Integer> getLikes() throws ClassNotFoundException, SQLException{
		Connection con=db.connection();
		String query="select id from notice";
		PreparedStatement st=con.prepareStatement(query);
		ResultSet rs=st.executeQuery();
		ArrayList<Integer>a=new ArrayList<Integer>();
		while(rs.next()) {
			query="select agree from likes where id=?";
			st=con.prepareStatement(query);
			st.setInt(1,rs.getInt("id"));
			ResultSet rs1=st.executeQuery();
			int y=0,n=0;
			while(rs1.next()) {
				if(rs1.getString("agree").compareTo("yes")==0) {
					y++;
				}
				else
					n++;
			}
			a.add(rs.getInt("id"));
			a.add(y);
			a.add(n);
		}
		System.out.println(a);
		return a;
	}
	public ArrayList<LikeModal> getLike(String uname) throws ClassNotFoundException, SQLException{
		Connection con=db.connection();
		String query="select id,agree from likes where username=?";
		PreparedStatement st=con.prepareStatement(query);
		st.setString(1, this.getuName(uname));
		ResultSet rs=st.executeQuery();
		ArrayList<LikeModal>s=new ArrayList<LikeModal>();
		while(rs.next()) {
			s.add(new LikeModal(rs.getInt("id"), rs.getString("agree")));
		}
		System.out.println(s);
		return s;
	}
	
	public ArrayList<NoticeModel> getNotice() throws ClassNotFoundException, SQLException {
		Connection con=db.connection();
		String query="select * from notice";
		PreparedStatement st=con.prepareStatement(query);
		ResultSet rs=st.executeQuery();
		ArrayList<NoticeModel>nm=new ArrayList<NoticeModel>();
		while(rs.next()) {
			nm.add(new NoticeModel(rs.getInt("id"),rs.getString("heading"),rs.getString("body"),rs.getInt("amount"),rs.getDate("date")));
		}
		System.out.println(nm);
		return nm;
	}
	public void deleteNotice(int id) throws ClassNotFoundException, SQLException {
		Connection con=db.connection();
		String query="delete from notice where id=?";
		PreparedStatement st=con.prepareStatement(query);
		st.setInt(1, id);
		st.executeUpdate();
		
		query="delete from likes where id=?";
		 st=con.prepareStatement(query);
			st.setInt(1, id);
			st.executeUpdate();
		
		query="delete from comments where id=?";	
		 st=con.prepareStatement(query);
			st.setInt(1, id);
			st.executeUpdate();
	}
	public void deleteCommentsLikes(int id) throws ClassNotFoundException, SQLException {
		Connection con=db.connection();
		
		
		String query="delete from likes where id=?";
		 PreparedStatement st=con.prepareStatement(query);
			st.setInt(1, id);
			st.executeUpdate();
		
		query="delete from comments where id=?";	
		 st=con.prepareStatement(query);
			st.setInt(1, id);
			st.executeUpdate();
	}
	
}
