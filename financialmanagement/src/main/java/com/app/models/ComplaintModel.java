package com.app.models;

import java.util.Date;

public class ComplaintModel {
	private String name;
	private String flat;
	private String complaint;
	private String seen;
	private int amount;
	private Date date;
	public ComplaintModel(String name, String flat, String complaint,String seen,int amount,Date date) {
		super();
		this.name = name;
		this.flat = flat;
		this.complaint = complaint;
		this.seen=seen;
		this.amount=amount;
		this.date=date;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFlat() {
		return flat;
	}
	public void setFlat(String flat) {
		this.flat = flat;
	}
	public String getComplaint() {
		return complaint;
	}
	public void setComplaint(String complaint) {
		this.complaint = complaint;
	}
	public String getSeen() {
		return seen;
	}
	public void setSeen(String seen) {
		this.seen = seen;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "ComplaintModel [name=" + name + ", flat=" + flat + ", complaint=" + complaint + ", seen=" + seen
				+ ", amount=" + amount + ", date=" + date + "]";
	}
	
	
}
