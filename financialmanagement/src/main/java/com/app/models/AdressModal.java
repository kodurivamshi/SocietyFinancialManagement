package com.app.models;

public class AdressModal {
	private String Username;
	private String mobile;
	private String stayedFlat;
	private String flat;
	private String apartment;
	private String street;
	private String city;
	private String state;
	@Override
	public String toString() {
		return "AdressModal [Username=" + Username + ", mobile=" + mobile + ", stayedFlat=" + stayedFlat + ", flat="
				+ flat + ", apartment=" + apartment + ", street=" + street + ", city=" + city + ", state=" + state
				+ "]";
	}
	public String getUsername() {
		return Username;
	}
	public void setUsername(String username) {
		Username = username;
	}
	public AdressModal(String username, String mobile, String stayedFlat, String flat, String apartment, String street,
			String city, String state) {
		super();
		Username = username;
		this.mobile = mobile;
		this.stayedFlat = stayedFlat;
		this.flat = flat;
		this.apartment = apartment;
		this.street = street;
		this.city = city;
		this.state = state;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getStayedFlat() {
		return stayedFlat;
	}
	public void setStayedFlat(String stayedFlat) {
		this.stayedFlat = stayedFlat;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getFlat() {
		return flat;
	}
	public void setFlat(String flat) {
		this.flat = flat;
	}
	public String getApartment() {
		return apartment;
	}
	public void setApartment(String apartment) {
		this.apartment = apartment;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}

}
