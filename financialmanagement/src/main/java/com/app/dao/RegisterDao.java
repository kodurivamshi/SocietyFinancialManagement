package com.app.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.app.models.AdressModal;
import com.app.models.MembersModal;
import com.app.models.RegisterModel;



public class RegisterDao {
	DBconnection db=new DBconnection();

	public void putData(RegisterModel rm) throws ClassNotFoundException, SQLException {
		Connection con=db.connection();
		String query="insert into users(username,fullname,email,password,mobile,gender,floor,flat) values(?,?,?,?,?,?,?,?)";
		PreparedStatement st=con.prepareStatement(query);
		//st.setInt(1,1);
		st.setString(1,rm.getUname());
		st.setString(3,rm.getEmail());
		st.setString(4,rm.getPassword());
		st.setString(2,rm.getFullname());
		st.setString(5,rm.getMobile());
		st.setString(6,rm.getGender());
		st.setString(7,rm.getFloor());
		st.setString(8,rm.getFlat());
		st.executeUpdate();
		System.out.print("posted");
		
		if(!rm.getUname().equals("admin")) {
		query="create table "+rm.getUname()+"(id int auto_increment primary key not null,roomrent int(20),electricitybill int(20),waterbill int(20),trashbill int(20),sewerbill int(20),maintancebill int(20),fine int(20),totalpending int(20),totalpaid int(20),paid varchar(10),date Date)";
		Statement state=con.createStatement();
		state.execute(query);
		System.out.print("created");
		
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		
		query="insert into "+rm.getUname()+"(roomrent,electricitybill,waterbill,trashbill,sewerbill,maintancebill,fine,totalpending,totalpaid,paid,date) values(?,?,?,?,?,?,?,?,?,?,?)";
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
		
		query="select id from notice";
		st=con.prepareStatement(query);
		ResultSet rs=st.executeQuery();
		int id=0;
		while(rs.next()) {
			id=rs.getInt("id");
		
			query="insert into likes values(?,?,?)";
			st=con.prepareStatement(query);
			st.setInt(1, id);
			st.setString(2, rm.getUname());
			st.setString(3, "yes");
			st.executeUpdate();
		}

		}
		
	}

	public boolean find(RegisterModel rm) throws ClassNotFoundException, SQLException {
		Connection con=db.connection();
		String query="select * from users where username=? or email=?";
		PreparedStatement st=con.prepareStatement(query);
		st.setString(1,rm.getUname());
		st.setString(2,rm.getEmail());
		ResultSet rs=st.executeQuery();
		
		if(rs.next()) {
			return true;
		}
		return false;	
	}

	public void putMembers(ArrayList<MembersModal> members) throws ClassNotFoundException, SQLException {
		Connection con=db.connection();
		String query="insert into members(username,name,relation,gender,familycount) values(?,?,?,?,?)";
		PreparedStatement st=con.prepareStatement(query);
		for(int i=0;i<members.size();i++) {
			st.setString(1, members.get(i).getUsername());
			st.setString(2, members.get(i).getName());
			st.setString(3, members.get(i).getRelation());
			st.setString(4, members.get(i).getGender());
			st.setInt(5, members.get(i).getFamilycount());
			st.executeUpdate();
		}
		
	}
	
	public RegisterModel getUser(String uname) throws ClassNotFoundException, SQLException {
		Connection con=db.connection();
		String query="select username,fullname,email,gender,mobile,floor,flat from users where uname=?";
		PreparedStatement st=con.prepareStatement(query);
		st.setString(1, uname);
		ResultSet rs=st.executeQuery();
		RegisterModel rm=null;
		if(rs.next()) {
			rm=new RegisterModel(rs.getString("username"),rs.getString("fullname"),rs.getString("email"),rs.getString("mobile"),rs.getString("gender"),rs.getString("floor"),rs.getString("flat"));
		}
		return rm;
	}
	public ArrayList<RegisterModel> getTenants() throws ClassNotFoundException, SQLException {
		Connection con=db.connection();
		String query="select username,fullname,email,gender,mobile,floor,flat from users";
		
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

	public ArrayList<RegisterModel> updateUser(RegisterModel rm) throws ClassNotFoundException, SQLException {
		Connection con=db.connection();
		String query="update users  set fullname=?,email=?,mobile=?,gender=?,floor=?,flat=? where username=?";
		PreparedStatement st=con.prepareStatement(query);
		st.setString(1, rm.getFullname());
		st.setString(2, rm.getEmail());
		st.setString(4, rm.getGender());
		st.setString(3, rm.getMobile());
		st.setString(5, rm.getFloor());
		st.setString(6, rm.getFlat());
		st.setNString(7, rm.getUname());
		int rs1=st.executeUpdate();
		return this.getTenants();
	}

	public ArrayList<RegisterModel> deleteUser(String uname) throws ClassNotFoundException, SQLException {
		Connection con=db.connection();
		System.out.println(uname);
		String query="delete from users where username=?";
		PreparedStatement st=con.prepareStatement(query);
		st.setString(1,uname);
		st.executeUpdate();
		
		query="delete from members where username=?";
		st=con.prepareStatement(query);
		st.setString(1,uname);
		st.executeUpdate();
		
		query="drop table "+uname;
		st=con.prepareStatement(query);
		st.executeUpdate();
		
		return this.getTenants();
	}

	public void deleteMember(String uname) throws ClassNotFoundException, SQLException {
		Connection con=db.connection();
		System.out.println(uname);
		String query="select username,familycount from members where name=?";
		PreparedStatement st=con.prepareStatement(query);
		st.setString(1, uname);
		ResultSet rs=st.executeQuery();
		String name=null;
		int c=0;
		if(rs.next()) {
			name=rs.getString("username");
			c=rs.getInt("familycount");
		}
		query="delete from members where name=?";
		st=con.prepareStatement(query);
		st.setString(1,uname);
		st.executeUpdate();	
		
		query="update members set familycount="+(c-1)+" where username=?";
		st=con.prepareStatement(query);
		st.setString(1, name);
		st.executeUpdate();
	}

	public void putDeletedUsers(AdressModal am) throws ClassNotFoundException, SQLException {
		Connection con=db.connection();
		String query="select mobile,flat from users where username=?";
		PreparedStatement st=con.prepareStatement(query);
		st.setString(1, am.getUsername());
		ResultSet rs=st.executeQuery();
		String mob=null;
		String flat=null;
		if(rs.next()) {
			mob=rs.getString("mobile");
			flat=rs.getString("flat");
		}
		
		query="insert into olderusers(username,mobile,stayedflat,flat,apartment,street,city,state) values(?,?,?,?,?,?,?,?)";
		st=con.prepareStatement(query);
		st.setString(1, am.getUsername());
		st.setString(2, mob);
		st.setString(3,flat);
		st.setString(4, am.getFlat());
		st.setString(5,am.getApartment());
		st.setString(6, am.getStreet());
		st.setString(7, am.getCity());
		st.setString(8, am.getState());
		st.executeUpdate();
		
			}

	public ArrayList<AdressModal> getDeletedUsers() throws SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub
		Connection con=db.connection();
		String query="select * from olderusers";
		PreparedStatement st=con.prepareStatement(query);
		ResultSet rs=st.executeQuery();
		ArrayList<AdressModal>a=new ArrayList<AdressModal>();
		while(rs.next()) {
			a.add(new AdressModal(rs.getString("username"), rs.getString("mobile"), rs.getString("stayedFlat"),rs.getString("flat"),rs.getString("apartment"),rs.getString("street"),rs.getString("city"),rs.getString("state")));
		}
		System.out.println(a);
		return a;

	}
	

}

