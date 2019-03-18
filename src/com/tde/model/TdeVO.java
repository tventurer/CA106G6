package com.tde.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class TdeVO implements Serializable{
	
	private static final long serialVersionUID = 7799250807932971192L;
	private String tdeno;
	private String trino;
	private String spono;
	private Timestamp tdestart;
	private Timestamp tdefinish;
	private String tdedate;
	private Integer tdeseq;
	private String tderemark;
	
	public TdeVO() {
		
	}
	
	public String getTdeno() {
		return tdeno;
	}
	
	public void setTdeno(String tdeno) {
		this.tdeno = tdeno;
	}
	
	public String getTrino() {
		return trino;
	}
	
	public void setTrino(String trino) {
		this.trino = trino;
	}
	
	public String getSpono() {
		return spono;
	}
	
	public void setSpono(String spono) {
		this.spono = spono;
	}
	
	public Timestamp getTdestart() {
		return tdestart;
	}
	
	public void setTdestart(Timestamp tdestart) {
		this.tdestart = tdestart;
	}
	
	public Timestamp getTdefinish() {
		return tdefinish;
	}
	
	public void setTdefinish(Timestamp tdefinish) {
		this.tdefinish = tdefinish;
	}
	
	public String getTdedate() {
		return tdedate;
	}
	
	public void setTdedate(String tdedate) {
		this.tdedate = tdedate;
	}
	
	public Integer getTdeseq() {
		return tdeseq;
	}
	
	public void setTdeseq(Integer tdeseq) {
		this.tdeseq = tdeseq;
	}
	
	public String getTderemark() {
		return tderemark;
	}
	
	public void setTderemark(String tderemark) {
		this.tderemark = tderemark;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((spono == null) ? 0 : spono.hashCode());
		result = prime * result + ((tdedate == null) ? 0 : tdedate.hashCode());
		result = prime * result + ((trino == null) ? 0 : trino.hashCode());
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
		TdeVO other = (TdeVO) obj;
		if (spono == null) {
			if (other.spono != null)
				return false;
		} else if (!spono.equals(other.spono))
			return false;
		if (tdedate == null) {
			if (other.tdedate != null)
				return false;
		} else if (!tdedate.equals(other.tdedate))
			return false;
		if (trino == null) {
			if (other.trino != null)
				return false;
		} else if (!trino.equals(other.trino))
			return false;
		return true;
	}
	
	
}
