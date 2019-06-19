package com.godrej.model;

public class User {
	int userId;
	String uName;
	String uPass;
	Address address;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getuPass() {
		return uPass;
	}
	public void setuPass(String uPass) {
		this.uPass = uPass;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
}
