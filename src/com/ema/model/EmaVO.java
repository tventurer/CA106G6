package com.ema.model;

public class EmaVO implements java.io.Serializable{
	private String empno;
	private String emrno;
	private Integer emastate;
	
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
	}
	public String getEmrno() {
		return emrno;
	}
	public void setEmrno(String emrno) {
		this.emrno = emrno;
	}
	public Integer getEmastate() {
		return emastate;
	}
	public void setEmastate(Integer emastate) {
		this.emastate = emastate;
	}
}
