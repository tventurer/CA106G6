package com.acr.model;
import java.sql.Timestamp;

public class AcrVO implements java.io.Serializable{
	private String acrid;
	private String memno;
	private Timestamp acrtime;
	private Integer acrprice;
	private Integer acrsource;
	private String acrend;
	private Integer acrtotal;
	public String getAcrid() {
		return acrid;
	}
	public void setAcrid(String acrid) {
		this.acrid = acrid;
	}
	public String getMemno() {
		return memno;
	}
	public void setMemno(String memno) {
		this.memno = memno;
	}
	public Timestamp getAcrtime() {
		return acrtime;
	}
	public void setAcrtime(Timestamp acrtime) {
		this.acrtime = acrtime;
	}
	public Integer getAcrprice() {
		return acrprice;
	}
	public void setAcrprice(Integer acrprice) {
		this.acrprice = acrprice;
	}
	public Integer getAcrsource() {
		return acrsource;
	}
	public void setAcrsource(Integer acrsource) {
		this.acrsource = acrsource;
	}
	public String getAcrend() {
		return acrend;
	}
	public void setAcrend(String acrend) {
		this.acrend = acrend;
	}
	public Integer getAcrtotal() {
		return acrtotal;
	}
	public void setAcrtotal(Integer acrtotal) {
		this.acrtotal = acrtotal;
	}
	
	
}
