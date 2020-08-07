package com.app.models;

import java.util.Date;

public class NoticeModel {
	private int id;
	private String head;
	private String body;
	private int amount;
	private Date date;
	public String getHead() {
		return head;
	}
	public void setHead(String head) {
		this.head = head;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public Date getDate() {
		return date;
	}
	public NoticeModel(int id,String head, String body, int amount,Date date) {
		super();
		this.id=id;
		this.head = head;
		this.body = body;
		this.amount=amount;
		this.date = date;
	}
	@Override
	public String toString() {
		return "NoticeModel [head=" + head + ", body=" + body + ", date=" + date + "]";
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
}
