package com.pah.model;

import java.sql.Clob;
import java.sql.Date;
import java.sql.Timestamp;
import java.sql.Blob;

public class PahVO implements java.io.Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private String pahno;
    private String pahname;
    private String pahintro;
    private String pahcontent;
    private Integer pahprice;
    private String pahcountry;
    private Integer pahnum;
    private Date pahstdate;
    private Date pahenddate;
    private Timestamp pahdown;
    private Integer pahstatus;
    private byte[] pahpc1;
    private byte[] pahpc2;
    private byte[] pahpc3;
    private byte[] pahpc4;
    private byte[] pahpc5;
    private String empno;
    
	public String getPahno() {
		return pahno;
	}


	public void setPahno(String pahno) {
		this.pahno = pahno;
	}


	public String getPahname() {
		return pahname;
	}


	public void setPahname(String pahname) {
		this.pahname = pahname;
	}


	public String getPahintro() {
		return pahintro;
	}


	public void setPahintro(String pahintro) {
		this.pahintro = pahintro;
	}


	public String getPahcontent() {
		return pahcontent;
	}


	public void setPahcontent(String pahcontent) {
		this.pahcontent = pahcontent;
	}


	public Integer getPahprice() {
		return pahprice;
	}


	public void setPahprice(Integer pahprice) {
		this.pahprice = pahprice;
	}


	public String getPahcountry() {
		return pahcountry;
	}


	public void setPahcountry(String pahcountry) {
		this.pahcountry = pahcountry;
	}


	public Integer getPahnum() {
		return pahnum;
	}


	public void setPahnum(Integer pahnum) {
		this.pahnum = pahnum;
	}


	public Date getPahstdate() {
		return pahstdate;
	}


	public void setPahstdate(Date pahstdate) {
		this.pahstdate = pahstdate;
	}


	public Date getPahenddate() {
		return pahenddate;
	}


	public void setPahenddate(Date pahenddate) {
		this.pahenddate = pahenddate;
	}


	public Timestamp getPahdown() {
		return pahdown;
	}


	public void setPahdown(Timestamp pahdown) {
		this.pahdown = pahdown;
	}


	public Integer getPahstatus() {
		return pahstatus;
	}


	public void setPahstatus(Integer pahstatus) {
		this.pahstatus = pahstatus;
	}


	public byte[] getPahpc1() {
		return pahpc1;
	}


	public void setPahpc1(byte[] pahpc1) {
		this.pahpc1 = pahpc1;
	}


	public byte[] getPahpc2() {
		return pahpc2;
	}


	public void setPahpc2(byte[] pahpc2) {
		this.pahpc2 = pahpc2;
	}


	public byte[] getPahpc3() {
		return pahpc3;
	}


	public void setPahpc3(byte[] pahpc3) {
		this.pahpc3 = pahpc3;
	}


	public byte[] getPahpc4() {
		return pahpc4;
	}


	public void setPahpc4(byte[] pahpc4) {
		this.pahpc4 = pahpc4;
	}


	public byte[] getPahpc5() {
		return pahpc5;
	}


	public void setPahpc5(byte[] pahpc5) {
		this.pahpc5 = pahpc5;
	}


	public String getEmpno() {
		return empno;
	}


	public void setEmpno(String empno) {
		this.empno = empno;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((pahno == null) ? 0 : pahno.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PahVO other = (PahVO) obj;
		if (pahno == null) {
			if (other.pahno != null)
				return false;
		} else if (!pahno.equals(other.pahno))
			return false;
		return true;
	}
         
	
	
}
