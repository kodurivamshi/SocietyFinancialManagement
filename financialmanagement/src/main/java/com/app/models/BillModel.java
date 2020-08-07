package com.app.models;

import java.util.Date;

public class BillModel {
	private String name;
	private int roomrent;
	private int electricitybill;
	private int waterbill;
	private int trashbill;
	private int sewerbill;
	private int maintancebill;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	private int fine;
	private int totalpending;
	private int totalpaid;
	private String paid;
	private Date date;
	public String s;
	
	public BillModel(String s) {
		this.s=s;
	}
	public int getRoomrent() {
		return roomrent;
	}
	public void setRoomrent(int roomrent) {
		this.roomrent = roomrent;
	}
	public int getElectricitybill() {
		return electricitybill;
	}
	public void setElectricitybill(int electricitybill) {
		this.electricitybill = electricitybill;
	}
	public int getWaterbill() {
		return waterbill;
	}
	public void setWaterbill(int waterbill) {
		this.waterbill = waterbill;
	}
	public int getTrashbill() {
		return trashbill;
	}
	public void setTrashbill(int trashbill) {
		this.trashbill = trashbill;
	}
	public int getSewerbill() {
		return sewerbill;
	}
	public void setSewerbill(int sewerbill) {
		this.sewerbill = sewerbill;
	}
	public int getMaintancebill() {
		return maintancebill;
	}
	public void setMaintancebill(int maintancebill) {
		this.maintancebill = maintancebill;
	}
	public int getFine() {
		return fine;
	}
	public void setFine(int fine) {
		this.fine = fine;
	}
	public int getTotalpending() {
		return totalpending;
	}
	public void setTotalpending(int totalpending) {
		this.totalpending = totalpending;
	}
	public BillModel(String name,int roomrent, int electricitybill, int waterbill, int trashbill, int sewerbill, int maintancebill,
			int fine, int totalpending, int totalpaid, String paid, Date date) {
		super();
		this.name=name;
		this.roomrent = roomrent;
		this.electricitybill = electricitybill;
		this.waterbill = waterbill;
		this.trashbill = trashbill;
		this.sewerbill = sewerbill;
		this.maintancebill = maintancebill;
		this.fine = fine;
		this.totalpending = totalpending;
		this.totalpaid = totalpaid;
		this.paid = paid;
		this.date = date;
	}
	@Override
	public String toString() {
		return "BillModel [name="+name+",roomrent=" + roomrent + ", electricitybill=" + electricitybill + ", waterbill=" + waterbill
				+ ", trashbill=" + trashbill + ", sewerbill=" + sewerbill + ", maintancebill=" + maintancebill
				+ ", fine=" + fine + ", totalpending=" + totalpending + ", totalpaid=" + totalpaid + ", paid=" + paid
				+ ", date=" + date + "]";
	}
	public int getTotalpaid() {
		return totalpaid;
	}
	public void setTotalpaid(int totalpaid) {
		this.totalpaid = totalpaid;
	}
	public String getPaid() {
		return paid;
	}
	public void setPaid(String paid) {
		this.paid = paid;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
}
