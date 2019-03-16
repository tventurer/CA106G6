package com.not.model;

public class NotVO {
	private String notno;
	private String memno;
	private String notcontent;
	private Integer notreaded;
	private java.sql.Date nottime;
	
	public String getNotno() {
		return notno;
	}
	public void setNotno(String notno) {
		this.notno = notno;
	}
	public String getMemno() {
		return memno;
	}
	public void setMemno(String memno) {
		this.memno = memno;
	}
	public String getNotcontent() {
		return notcontent;
	}
	public void setNotcontent(String notContent) {
		this.notcontent = notContent;
	}
	public Integer getNotreaded() {
		return notreaded;
	}
	public void setNotreaded(Integer notReaded) {
		this.notreaded = notReaded;
	}
	public java.sql.Date getNottime() {
		return nottime;
	}
	public void setNottime(java.sql.Date notTime) {
		this.nottime = notTime;
	}
}
