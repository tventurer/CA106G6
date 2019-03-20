package com.ptp.model;

import java.sql.Date;

import java.sql.Timestamp;

public class PtpVO implements java.io.Serializable{
	private String ptpno;
	private String pacno;
	private Timestamp ptpstart ;
	private Date ptpend;
	private Date ptpsigndle;
	private String ptpnotice;
	private Integer ptpvacancy;
	private Integer ptpminmen;
	private Integer ptpmaxmen;
	private Integer ptpstatus;
	private Timestamp ptptimelog;
	
	public String getPtpno() {
		return ptpno;
	}
	public void setPtpno(String ptpno) {
		this.ptpno = ptpno;
	}
	public String getPacno() {
		return pacno;
	}
	public void setPacno(String pacno) {
		this.pacno = pacno;
	}
	public Timestamp getPtpstart() {
		return ptpstart;
	}
	public void setPtpstart(Timestamp ptpstart) {
		this.ptpstart = ptpstart;
	}
	public Date getPtpend() {
		return ptpend;
	}
	public void setPtpend(Date ptpend) {
		this.ptpend = ptpend;
	}
	public Date getPtpsigndle() {
		return ptpsigndle;
	}
	public void setPtpsigndle(Date ptpsigndle) {
		this.ptpsigndle = ptpsigndle;
	}
	public String getPtpnotice() {
		return ptpnotice;
	}
	public void setPtpnotice(String ptpnotice) {
		this.ptpnotice = ptpnotice;
	}
	public Integer getPtpvacancy() {
		return ptpvacancy;
	}
	public void setPtpvacancy(Integer ptpvacancy) {
		this.ptpvacancy = ptpvacancy;
	}
	public Integer getPtpminmen() {
		return ptpminmen;
	}
	public void setPtpminmen(Integer ptpminmen) {
		this.ptpminmen = ptpminmen;
	}
	public Integer getPtpmaxmen() {
		return ptpmaxmen;
	}
	public void setPtpmaxmen(Integer ptpmaxmen) {
		this.ptpmaxmen = ptpmaxmen;
	}
	public Integer getPtpstatus() {
		return ptpstatus;
	}
	public void setPtpstatus(Integer ptpstatus) {
		this.ptpstatus = ptpstatus;
	}
	public Timestamp getPtptimelog() {
		return ptptimelog;
	}
	public void setPtptimelog(Timestamp ptptimelog) {
		this.ptptimelog = ptptimelog;
	}
	
	
}
