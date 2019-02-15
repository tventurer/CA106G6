package com.rtr.model;

import java.io.Serializable;

public class RtrVO implements Serializable{
	
	private static final long serialVersionUID = 5339463220414059274L;
	private String rtrno;
	private String empno;
	private String rtrcon;
	private String rtrcity;
	private Integer rtrdays;
	private Integer rtrpeonum;
	private Integer rtrpref;
	
	public RtrVO() {

	}

	public String getRtrno() {
		return rtrno;
	}

	public void setRtrno(String rtrno) {
		this.rtrno = rtrno;
	}

	public String getEmpno() {
		return empno;
	}

	public void setEmpno(String empno) {
		this.empno = empno;
	}

	public String getRtrcon() {
		return rtrcon;
	}

	public void setRtrcon(String rtrcon) {
		this.rtrcon = rtrcon;
	}

	public String getRtrcity() {
		return rtrcity;
	}

	public void setRtrcity(String rtrcity) {
		this.rtrcity = rtrcity;
	}

	public Integer getRtrdays() {
		return rtrdays;
	}

	public void setRtrdays(Integer rtrdays) {
		this.rtrdays = rtrdays;
	}

	public Integer getRtrpeonum() {
		return rtrpeonum;
	}

	public void setRtrpeonum(Integer rtrpeonum) {
		this.rtrpeonum = rtrpeonum;
	}

	public Integer getRtrpref() {
		return rtrpref;
	}

	public void setRtrpref(Integer rtrpref) {
		this.rtrpref = rtrpref;
	}
	
}
