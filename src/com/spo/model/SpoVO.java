package com.spo.model;

import java.io.Serializable;

public class SpoVO implements Serializable{

	private static final long serialVersionUID = 8320299842477944258L;
	private String spono;
	private String sponame;
	private String spoclass;
	private String spocon;
	private String spocity;
	private Double spolat;
	private Double spolong;
	private String spoaddr;
	private String spocontent;
	private byte[] spopic;
	private Integer spoattribute;
	
	public SpoVO() {

	}

	public String getSpono() {
		return spono;
	}

	public void setSpono(String spono) {
		this.spono = spono;
	}

	public String getSponame() {
		return sponame;
	}

	public void setSponame(String sponame) {
		this.sponame = sponame;
	}

	public String getSpoclass() {
		return spoclass;
	}

	public void setSpoclass(String spoclass) {
		this.spoclass = spoclass;
	}

	public String getSpocon() {
		return spocon;
	}

	public void setSpocon(String spocon) {
		this.spocon = spocon;
	}

	public String getSpocity() {
		return spocity;
	}

	public void setSpocity(String spocity) {
		this.spocity = spocity;
	}

	public Double getSpolat() {
		return spolat;
	}

	public void setSpolat(Double spolat) {
		this.spolat = spolat;
	}

	public Double getSpolong() {
		return spolong;
	}

	public void setSpolong(Double spolong) {
		this.spolong = spolong;
	}

	public String getSpoaddr() {
		return spoaddr;
	}

	public void setSpoaddr(String spoaddr) {
		this.spoaddr = spoaddr;
	}

	public String getSpocontent() {
		return spocontent;
	}

	public void setSpocontent(String spocontent) {
		this.spocontent = spocontent;
	}

	public byte[] getSpopic() {
		return spopic;
	}

	public void setSpopic(byte[] spopic) {
		this.spopic = spopic;
	}

	public Integer getSpoattribute() {
		return spoattribute;
	}

	public void setSpoattribute(Integer spoattribute) {
		this.spoattribute = spoattribute;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((sponame == null) ? 0 : sponame.hashCode());
		result = prime * result + ((spono == null) ? 0 : spono.hashCode());
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
		SpoVO other = (SpoVO) obj;
		if (sponame == null) {
			if (other.sponame != null)
				return false;
		} else if (!sponame.equals(other.sponame))
			return false;
		if (spono == null) {
			if (other.spono != null)
				return false;
		} else if (!spono.equals(other.spono))
			return false;
		return true;
	}
}
