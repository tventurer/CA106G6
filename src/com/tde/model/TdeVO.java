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
	
}
