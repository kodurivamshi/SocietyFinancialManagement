package com.app.models;

public class LikeModal {
	private int id;
	private String agree;
	public String getAgree() {
		return agree;
	}
	public void setAgree(String agree) {
		this.agree = agree;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "LikeModal [id=" + id + ", agree=" + agree + "]";
	}
	public LikeModal(int id, String agree) {
		super();
		this.id = id;
		this.agree = agree;
	}
	
}
