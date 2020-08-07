package com.app.models;
public class RegisterModel {

	private String uname;
	private String email;
	private String password;
	private String fullname;
	private String mobile;
	private String gender;
	private String floor;
	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getFloor() {
		return floor;
	}

	public void setFloor(String floor) {
		this.floor = floor;
	}

	public String getFlat() {
		return flat;
	}

	public void setFlat(String flat) {
		this.flat = flat;
	}

	private String flat;
	
	
	
	public RegisterModel(String uname, String email, String password, String fullname, String mobile, String gender,
			String floor, String flat) {
		super();
		this.uname = uname;
		this.email = email;
		this.password = password;
		this.fullname = fullname;
		this.mobile = mobile;
		this.gender = gender;
		this.floor = floor;
		this.flat = flat;
	}

	public RegisterModel(String uname2, String email2) {
		this.uname = uname2;
		this.email = email2;
	}
	public RegisterModel(String uname,String fname,String d) {
		this.uname=uname;
		this.fullname=fname;
		this.email=d;
	}
	

	public RegisterModel(String username, String fullname, String email,  String mobile,String gender, String floor,
			String flat) {
		this.fullname=fullname;
		this.uname=username;
		this.email=email;
		this.mobile=mobile;
		this.gender=gender;
		this.floor=floor;
		this.flat=flat;
	}

	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Override
	public String toString() {
		return "RegisterModel [uname=" + uname + ", email=" + email + ", password=" + password + "]";
	}

	
	
}
