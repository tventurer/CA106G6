package com.tri.model;

import java.io.Serializable;
import java.sql.Date;

public class TriVO implements Serializable{
	
	private static final long serialVersionUID = -7579933514034014472L;
	private String trino;
	private String memno;
	private String triname;
	private Date tribegdate;
	private Date trienddate;
	private Integer tripeonum;
	private Integer tristat;
	private String triremark;
	
	public TriVO() {
		
	}
	
	public String getTrino() {
		return trino;
	}
	
	public void setTrino(String trino) {
		this.trino = trino;
	}
	
	public String getMemno() {
		return memno;
	}
	
	public void setMemno(String memno) {
		this.memno = memno;
	}
	
	public String getTriname() {
		return triname;
	}
	
	public void setTriname(String triname) {
		this.triname = triname;
	}
	
	public Date getTribegdate() {
		return tribegdate;
	}
	
	public void setTribegdate(Date tribegdate) {
		this.tribegdate = tribegdate;
	}
	
	public Date getTrienddate() {
		return trienddate;
	}
	
	public void setTrienddate(Date trienddate) {
		this.trienddate = trienddate;
	}
	
	public Integer getTripeonum() {
		return tripeonum;
	}
	
	public void setTripeonum(Integer tripeonum) {
		this.tripeonum = tripeonum;
	}
	
	public Integer getTristat() {
		return tristat;
	}
	
	public void setTristat(Integer tristat) {
		this.tristat = tristat;
	}
	
	public String getTriremark() {
		return triremark;
	}
	
	public void setTriremark(String triremark) {
		this.triremark = triremark;
	}
	
}
