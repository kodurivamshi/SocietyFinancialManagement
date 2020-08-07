package com.app.models;

public class MembersModal {
	private String username;
	private String name;
	private String relation;
	private String gender;
	private int familycount;
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getRelation() {
		return relation;
	}
	public void setRelation(String relation) {
		this.relation = relation;
	}
	@Override
	public String toString() {
		return "MembersModal [username=" + username + ", name=" + name + ", relation=" + relation + ", gender=" + gender
				+ "]";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public MembersModal(String uname,String name, String rel, String gender,int familycount) {
		super();
		this.username=uname;
		this.name = name;
		this.relation = rel;
		this.gender = gender;
		this.familycount=familycount;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getFamilycount() {
		return familycount;
	}
	public void setFamilycount(int familycount) {
		this.familycount = familycount;
	}
	
}
