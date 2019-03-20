package com.mpm.model;

public class MpmVO {
	private String mpmno;
	private String mpmsender;
	private String mpmreceiver;
	private String mpmtitle;
	private String mpmcontent;
	private java.sql.Timestamp mpmtime;
	private Integer mpmreaded;
	
	public String getMpmno() {
		return mpmno;
	}
	public void setMpmno(String mpmno) {
		this.mpmno = mpmno;
	}
	public String getMpmsender() {
		return mpmsender;
	}
	public void setMpmsender(String mpmsender) {
		this.mpmsender = mpmsender;
	}
	public String getMpmreceiver() {
		return mpmreceiver;
	}
	public void setMpmreceiver(String mpmreciver) {
		this.mpmreceiver = mpmreciver;
	}
	public String getMpmtitle() {
		return mpmtitle;
	}
	public void setMpmtitle(String mpmtitle) {
		this.mpmtitle = mpmtitle;
	}
	public String getMpmcontent() {
		return mpmcontent;
	}
	public void setMpmcontent(String mpmcontent) {
		this.mpmcontent = mpmcontent;
	}
	public java.sql.Timestamp getMpmtime() {
		return mpmtime;
	}
	public void setMpmtime(java.sql.Timestamp mpmtime) {
		this.mpmtime = mpmtime;
	}
	public Integer getMpmreaded() {
		return mpmreaded;
	}
	public void setMpmreaded(Integer mpmreaded) {
		this.mpmreaded = mpmreaded;
	}
}
