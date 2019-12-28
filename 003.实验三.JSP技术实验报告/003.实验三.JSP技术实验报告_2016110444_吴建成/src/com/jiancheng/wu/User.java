package com.jiancheng.wu;

public class User {
	private String username;
	private String nickname;
	private String password;
	private String email;
	private StringBuffer other = new StringBuffer();
	
	public User(String username,String nickname,String password,
				String email,StringBuffer other) {
		this.username = username;
		this.nickname = nickname;
		this.password = password;
		this.email = email;
		this.other = other;
	}
	
	public User(String username) {
		this.username = username;
		this.nickname = "";
		this.password = "";
		this.email = "";
		this.other = null;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public StringBuffer getOther() {
		return other;
	}

	public void setOther(StringBuffer other) {
		this.other = other;
	}
	
}
