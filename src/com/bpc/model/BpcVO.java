package com.bpc.model;

public class BpcVO {
	private String bpcno;
	private String memno;
	private String posno;
	private String bpccontent;
	private java.sql.Timestamp bpctime;
	
	public String getBpcno() {
		return bpcno;
	}
	public void setBpcno(String bpcno) {
		this.bpcno = bpcno;
	}
	public String getMemno() {
		return memno;
	}
	public void setMemno(String memno) {
		this.memno = memno;
	}
	public String getPosno() {
		return posno;
	}
	public void setPosno(String posno) {
		this.posno = posno;
	}
	public String getBpccontent() {
		return bpccontent;
	}
	public void setBpccontent(String bpccontent) {
		this.bpccontent = bpccontent;
	}
	public java.sql.Timestamp getBpctime() {
		return bpctime;
	}
	public void setBpctime(java.sql.Timestamp bpctime) {
		this.bpctime = bpctime;
	}
}
