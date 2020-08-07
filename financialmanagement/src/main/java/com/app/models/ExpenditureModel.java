package com.app.models;

public class ExpenditureModel {
	private String  heading;
	private int amount;
	public String getHeading() {
		return heading;
	}
	public void setHeading(String heading) {
		this.heading = heading;
	}
	public int getAmount() {
		return amount;
	}
	public ExpenditureModel(String heading, int amount) {
		super();
		this.heading = heading;
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "ExpenditureModel [heading=" + heading + ", amount=" + amount + "]";
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
}
