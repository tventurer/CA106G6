package com.sme.model;

import java.sql.Timestamp;

public class SmeVO implements java.io.Serializable{
	private String smeno;
	private String memno;
	private String empno;
	private String smecon;
	private Timestamp smetime;
	private Integer smefrom;
	
	public String getSmeno() {
		return smeno;
	}
	public Integer getSmefrom() {
		return smefrom;
	}
	public void setSmefrom(Integer smefrom) {
		this.smefrom = smefrom;
	}
	public void setSmeno(String smeno) {
		this.smeno = smeno;
	}
	public String getMemno() {
		return memno;
	}
	public void setMemno(String memno) {
		this.memno = memno;
	}
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
	}
	public String getSmecon() {
		return smecon;
	}
	public void setSmecon(String smecon) {
		this.smecon = smecon;
	}
	public Timestamp getSmetime() {
		return smetime;
	}
	public void setSmetime(Timestamp smetime) {
		this.smetime = smetime;
	}
	
}
