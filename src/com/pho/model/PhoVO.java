package com.pho.model;

import java.sql.Date;
import java.sql.Clob;

public class PhoVO implements java.io.Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private String phono;
    private String phoowner;
    private String phophone;
    private String phomail;
    private Date phostdate;
    private Integer phostatus;
    private String phomark;
    private String phovisa;
    private Integer phototal;
    private String memno;
    
	public String getPhono() {
		return phono;
	}
	public void setPhono(String phono) {
		this.phono = phono;
	}
	public String getPhoowner() {
		return phoowner;
	}
	public void setPhoowner(String phoowner) {
		this.phoowner = phoowner;
	}
	public String getPhophone() {
		return phophone;
	}
	public void setPhophone(String phophone) {
		this.phophone = phophone;
	}
	public String getPhomail() {
		return phomail;
	}
	public void setPhomail(String phomail) {
		this.phomail = phomail;
	}
	public Date getPhostdate() {
		return phostdate;
	}
	public void setPhostdate(Date phostdate) {
		this.phostdate = phostdate;
	}
	public Integer getPhostatus() {
		return phostatus;
	}
	public void setPhostatus(Integer phostatus) {
		this.phostatus = phostatus;
	}
	public String getPhomark() {
		return phomark;
	}
	public void setPhomark(String phomark) {
		this.phomark = phomark;
	}
	public String getPhovisa() {
		return phovisa;
	}
	public void setPhovisa(String phovisa) {
		this.phovisa = phovisa;
	}
	public Integer getPhototal() {
		return phototal;
	}
	public void setPhototal(Integer phototal) {
		this.phototal = phototal;
	}
	public String getMemno() {
		return memno;
	}
	public void setMemno(String memno) {
		this.memno = memno;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((phono == null) ? 0 : phono.hashCode());
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
		PhoVO other = (PhoVO) obj;
		if (phono == null) {
			if (other.phono != null)
				return false;
		} else if (!phono.equals(other.phono))
			return false;
		return true;
	}

	        
}
