package com.pcd.model;

import java.sql.Date;
import java.sql.Timestamp;

public class PcdVO {
    private String pcdno;
	private String ptpno;
	private String memno ;
	private Integer pcdtripmen;
	private Date pcdordday;
	private Integer pcdmoney;
	private Integer pcdstatus;
	private String pcdsecphone;
	private String pcdfamdata;
	private String pcdmark;
	
	public String getPcdno() {
		return pcdno;
	}
	public void setPcdno(String pcdno) {
		this.pcdno = pcdno;
	}
	public String getPtpno() {
		return ptpno;
	}
	public void setPtpno(String ptpno) {
		this.ptpno = ptpno;
	}
	public String getMemno() {
		return memno;
	}
	public void setMemno(String memno) {
		this.memno = memno;
	}
	public Integer getPcdtripmen() {
		return pcdtripmen;
	}
	public void setPcdtripmen(Integer pcdtripmen) {
		this.pcdtripmen = pcdtripmen;
	}
	public Date getPcdordday() {
		return pcdordday;
	}
	public void setPcdordday(Date pcdordday) {
		this.pcdordday = pcdordday;
	}
	public Integer getPcdmoney() {
		return pcdmoney;
	}
	public void setPcdmoney(Integer pcdprice) {
		this.pcdmoney = pcdprice;
	}
	public Integer getPcdstatus() {
		return pcdstatus;
	}
	public void setPcdstatus(Integer pcdstatus) {
		this.pcdstatus = pcdstatus;
	}
	public String getPcdsecphone() {
		return pcdsecphone;
	}
	public void setPcdsecphone(String pcdsecphone) {
		this.pcdsecphone = pcdsecphone;
	}
	public String getPcdfamdata() {
		return pcdfamdata;
	}
	public void setPcdfamdata(String pcdfamdata) {
		this.pcdfamdata = pcdfamdata;
	}
	public String getPcdmark() {
		return pcdmark;
	}
	public void setPcdmark(String pcdmark) {
		this.pcdmark = pcdmark;
	}
	
    
    
}
