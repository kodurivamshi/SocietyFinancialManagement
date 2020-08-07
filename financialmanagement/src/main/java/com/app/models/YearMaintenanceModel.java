package com.app.models;

public class YearMaintenanceModel {
	private int year;
	private int expenditure;
	public int getExpenditure() {
		return expenditure;
	}
	public void setExpenditure(int expenditure) {
		this.expenditure = expenditure;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public YearMaintenanceModel(int year, int expenditure) {
		super();
		this.year = year;
		this.expenditure = expenditure;
	}
	@Override
	public String toString() {
		return "YearMaintenanceModel [year=" + year + ", expenditure=" + expenditure + "]";
	}
	
}
