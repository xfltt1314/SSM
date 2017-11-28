package com.entity;

public class User {
	public int intId;
	public String userName;
	public String passWord;
	public String scoreFrom;
	public User(String userName, String passWord) {
		this.userName = userName;
		this.passWord = passWord;
	}
	
	public User() {
	}
	public String getScoreFrom() {
		return scoreFrom;
	}
	public void setScoreFrom(String scoreFrom) {
		this.scoreFrom = scoreFrom;
	}
	public Integer getFromDetail() {
		return fromDetail;
	}
	public void setFromDetail(Integer fromDetail) {
		this.fromDetail = fromDetail;
	}
	public Integer fromDetail;
	public int getIntId() {
		return intId;
	}
	public void setIntId(int intId) {
		this.intId = intId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
}