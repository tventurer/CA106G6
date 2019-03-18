package com.phd.model;

public class PhdVO implements java.io.Serializable{

	private static final long serialVersionUID = 1L;

	private String pahno;
	private String phono;
	private Integer phdnum;
	
	public String getPahno() {
		return pahno;
	}
	public void setPahno(String pahno) {
		this.pahno = pahno;
	}
	public String getPhono() {
		return phono;
	}
	public void setPhono(String phono) {
		this.phono = phono;
	}
	public Integer getPhdnum() {
		return phdnum;
	}
	public void setPhdnum(Integer phdnum) {
		this.phdnum = phdnum;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
		
}

