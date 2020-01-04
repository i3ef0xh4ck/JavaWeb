package com.jason.registration.entity;

public class Mes {
	private Integer mid;
	private String user1;
	private String user2;
	private String mes;
	
	public Mes() {
	}
	
	public Mes(Integer mid, String user1, String user2, String mes) {
		this.mid = mid;
		this.user1 = user1;
		this.user2 = user2;
		this.mes = mes;
	}
	
	public Mes(String user1, String user2, String mes) {
		this.user1 = user1;
		this.user2 = user2;
		this.mes = mes;
	}

	public Integer getMid() {
		return mid;
	}

	public void setMid(Integer mid) {
		this.mid = mid;
	}

	public String getUser1() {
		return user1;
	}

	public void setUser1(String user1) {
		this.user1 = user1;
	}

	public String getUser2() {
		return user2;
	}

	public void setUser2(String user2) {
		this.user2 = user2;
	}

	public String getMes() {
		return mes;
	}

	public void setMes(String mes) {
		this.mes = mes;
	}
	
}
