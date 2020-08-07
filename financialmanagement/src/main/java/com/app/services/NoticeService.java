package com.app.services;

import java.sql.SQLException;
import java.util.ArrayList;

import com.app.dao.NoticeDao;
import com.app.models.LikeModal;
import com.app.models.NoticeModel;

public class NoticeService {
	public void putNotice(NoticeModel nm) throws ClassNotFoundException, SQLException {
		NoticeDao nd=new NoticeDao();
		nd.putNotice(nm);
	}
	public ArrayList<NoticeModel> getNotice() throws ClassNotFoundException, SQLException{
		NoticeDao nd=new NoticeDao();
		return nd.getNotice();
	}
	public ArrayList<Integer> putLike(ArrayList<String> s) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		NoticeDao nd=new NoticeDao();
		return nd.putLike(s);
		
	}
	public ArrayList<Integer> getLikes() throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		NoticeDao nd=new NoticeDao();
		return nd.getLikes();
		
	}
	public ArrayList<LikeModal> getLikes(String uname) throws ClassNotFoundException, SQLException{
		NoticeDao nd=new NoticeDao();
		return nd.getLike(uname);
	}
	public void deleteNotice(int id) throws ClassNotFoundException, SQLException {
		NoticeDao nd=new NoticeDao();
		nd.deleteNotice(id);
		
	}
	public void updateAmount(int id,int amount) throws ClassNotFoundException, SQLException {
		NoticeDao nd=new NoticeDao();
		nd.updateAmount(id, amount);
	}
}
