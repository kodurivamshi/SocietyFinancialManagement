package com.app.services;

import java.sql.SQLException;
import java.util.ArrayList;

import com.app.dao.CommentDao;
import com.app.models.CommentModal;

public class CommentService {
	public void putComment(CommentModal cm) throws ClassNotFoundException, SQLException {
		CommentDao cd=new CommentDao();
		cd.putComment(cm);
	}
	public ArrayList<CommentModal> getComments() throws ClassNotFoundException, SQLException{
		CommentDao cd=new CommentDao();
		return cd.getComments();
	}
}
