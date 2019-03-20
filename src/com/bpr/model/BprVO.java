package com.bpr.model;

public class BprVO {
	private String bprno;
	private String posno;
	private String bpcno;
	private String memno;
	private String empno;
	private String bprtag;
	private String bprcontent;
	private java.sql.Timestamp bprtime;
	private Integer bprstatus;
	private Integer bprresult;
	
	public String getBprno() {
		return bprno;
	}
	public void setBprno(String bprno) {
		this.bprno = bprno;
	}
	public String getPosno() {
		return posno;
	}
	public void setPosno(String posno) {
		this.posno = posno;
	}
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
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
	}
	public String getBprtag() {
		return bprtag;
	}
	public void setBprtag(String bprtag) {
		this.bprtag = bprtag;
	}
	public String getBprcontent() {
		return bprcontent;
	}
	public void setBprcontent(String bprcontent) {
		this.bprcontent = bprcontent;
	}
	public java.sql.Timestamp getBprtime() {
		return bprtime;
	}
	public void setBprtime(java.sql.Timestamp bprtime) {
		this.bprtime = bprtime;
	}
	public Integer getBprstatus() {
		return bprstatus;
	}
	public void setBprstatus(Integer bprstatus) {
		this.bprstatus = bprstatus;
	}
	public Integer getBprresult() {
		return bprresult;
	}
	public void setBprresult(Integer bprresult) {
		this.bprresult = bprresult;
	}
}
