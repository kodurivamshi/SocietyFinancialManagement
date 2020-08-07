package com.app.models;

public class CommentModal {
	private int id;
	private String username;
	private String comment;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public CommentModal(int id, String username, String comment) {
		super();
		this.id = id;
		this.username = username;
		this.comment = comment;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	@Override
	public String toString() {
		return "CommentModal [id=" + id + ", username=" + username + ", comment=" + comment + "]";
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
}
