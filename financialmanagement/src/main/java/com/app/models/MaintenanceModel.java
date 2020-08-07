package com.app.models;

public class MaintenanceModel {
	private int id;
	private int maintenanceFee;
	private int securityFee;
	private int cleanerFee;
	private int goodsFee;
	private int savings;
	private int workersfee;
	private  int liftBill;
	
	public MaintenanceModel() {
		
	}
	
	public int getMaintenanceFee() {
		return maintenanceFee;
	}
	public void setMaintenanceFee(int maintenanceFee) {
		this.maintenanceFee = maintenanceFee;
	}
	public int getSecurityFee() {
		return securityFee;
	}
	public void setSecurityFee(int securityFee) {
		this.securityFee = securityFee;
	}
	public int getCleanerFee() {
		return cleanerFee;
	}
	public void setCleanerFee(int cleanerFee) {
		this.cleanerFee = cleanerFee;
	}
	@Override
	public String toString() {
		return "MaintenanceModel [id=" + id + ", maintenanceFee=" + maintenanceFee + "goodsFee=" + goodsFee + ", savings=" + savings + ", workersfee="
				+ workersfee + "]";
	}
	public int getGoodsFee() {
		return goodsFee;
	}
	public MaintenanceModel(int id,int maintenanceFee, int workersfee, int security,int cleaner,int goodsFee, int liftBill,int savings) {
		super();
		this.liftBill=liftBill;
		this.id=id;
		this.maintenanceFee = maintenanceFee;
		this.workersfee=workersfee;
		this.securityFee=security;
		this.cleanerFee=cleaner;
		this.goodsFee = goodsFee;
		this.savings = savings;
	}
	public void setGoodsFee(int goodsFee) {
		this.goodsFee = goodsFee;
	}
	public int getSavings() {
		return savings;
	}
	public void setSavings(int savings) {
		this.savings = savings;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getWorkersfee() {
		return workersfee;
	}
	public void setWorkersfee(int workersfee) {
		this.workersfee = workersfee;
	}
	public int getLiftBill() {
		return liftBill;
	}
	public void setLiftBill(int liftBill) {
		this.liftBill = liftBill;
	}
	
}
