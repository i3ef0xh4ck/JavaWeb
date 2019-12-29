package com.jason.entity;

public class User {
	
	private Integer id;
	private String username;
	private String nickname;
	private String password;
	private String email;
	private String other;
	
	public User(Integer id,String username,String nickname,String password,
				String email,String other) {
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
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}
	
}
