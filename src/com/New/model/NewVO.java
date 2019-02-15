package com.New.model;

import java.sql.Date;

public class NewVO {
	private String newno;
	private String newcontent;
	private Date newstdate;
	private Date newenddate;
	private Byte newpc1;
	private Byte newpc2;
	private String empno;
	
	public String getNewno() {
		return newno;
	}
	public void setNewno(String newno) {
		this.newno = newno;
	}
	public String getNewcontent() {
		return newcontent;
	}
	public void setNewcontent(String newcontent) {
		this.newcontent = newcontent;
	}
	public Date getNewstdate() {
		return newstdate;
	}
	public void setNewstdate(Date newstdate) {
		this.newstdate = newstdate;
	}
	public Date getNewenddate() {
		return newenddate;
	}
	public void setNewenddate(Date newenddate) {
		this.newenddate = newenddate;
	}
	public Byte getNewpc1() {
		return newpc1;
	}
	public void setNewpc1(Byte newpc1) {
		this.newpc1 = newpc1;
	}
	public Byte getNewpc2() {
		return newpc2;
	}
	public void setNewpc2(Byte newpc2) {
		this.newpc2 = newpc2;
	}
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
	}
	
}
