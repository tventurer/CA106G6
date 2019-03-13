package com.mem.model;

public class MemVO {
    private String memno;
    private String memacc;
    private String mempwd;
    private String mememail;
    private Integer mememailvalid;
    private String memrealname;
    private String memengname;
    private String memphone;
    private java.sql.Date membirth;
    private String memaddr;
    private String memidno;
    private String membankacc;
    private byte[] memphoto;
    
	public String getMemno() {
		return memno;
	}
	public void setMemno(String memno) {
		this.memno = memno;
	}
	public String getMemacc() {
		return memacc;
	}
	public void setMemacc(String memAcc) {
		this.memacc = memAcc;
	}
	public String getMempwd() {
		return mempwd;
	}
	public void setMempwd(String memPwd) {
		this.mempwd = memPwd;
	}
	public String getMememail() {
		return mememail;
	}
	public void setMememail(String memEmail) {
		this.mememail = memEmail;
	}
	public Integer getMememailvalid() {
		return mememailvalid;
	}
	public void setMememailvalid(Integer memEmailValid) {
		this.mememailvalid = memEmailValid;
	}
	public String getMemrealname() {
		return memrealname;
	}
	public void setMemrealname(String memRealName) {
		this.memrealname = memRealName;
	}
	public String getMemengname() {
		return memengname;
	}
	public void setMemengname(String memEngName) {
		this.memengname = memEngName;
	}
	public String getMemphone() {
		return memphone;
	}
	public void setMemphone(String memPhone) {
		this.memphone = memPhone;
	}
	public java.sql.Date getMembirth() {
		return membirth;
	}
	public void setMembirth(java.sql.Date memBirth) {
		this.membirth = memBirth;
	}
	public String getMemaddr() {
		return memaddr;
	}
	public void setMemaddr(String memAddr) {
		this.memaddr = memAddr;
	}
	public String getMemidno() {
		return memidno;
	}
	public void setMemidno(String memIDNo) {
		this.memidno = memIDNo;
	}
	public String getMembankacc() {
		return membankacc;
	}
	public void setMembankacc(String memBankAcc) {
		this.membankacc = memBankAcc;
	}
	public byte[] getMemphoto() {
		return memphoto;
	}
	public void setMemphoto(byte[] memPhoto) {
		this.memphoto = memPhoto;
	} 
}
