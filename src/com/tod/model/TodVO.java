package com.tod.model;

import java.io.Serializable;
import java.sql.Date;

public class TodVO implements Serializable{
	
	private static final long serialVersionUID = -1969186978226285693L;
	private String todno;
	private String memno;
	private String trino;
	private String empno;
	private Integer todquo;
	private Date todddl;
	private Date toddate;
	private String todremark;
	private Integer todstat;
	
	public TodVO() {

	}

	public String getTodno() {
		return todno;
	}

	public void setTodno(String todno) {
		this.todno = todno;
	}

	public String getMemno() {
		return memno;
	}

	public void setMemno(String memno) {
		this.memno = memno;
	}

	public String getTrino() {
		return trino;
	}

	public void setTrino(String trino) {
		this.trino = trino;
	}

	public String getEmpno() {
		return empno;
	}

	public void setEmpno(String empno) {
		this.empno = empno;
	}

	public Integer getTodquo() {
		return todquo;
	}

	public void setTodquo(Integer todquo) {
		this.todquo = todquo;
	}

	public Date getTodddl() {
		return todddl;
	}

	public void setTodddl(Date todddl) {
		this.todddl = todddl;
	}

	public Date getToddate() {
		return toddate;
	}

	public void setToddate(Date toddate) {
		this.toddate = toddate;
	}

	public String getTodremark() {
		return todremark;
	}

	public void setTodremark(String todremark) {
		this.todremark = todremark;
	}

	public Integer getTodstat() {
		return todstat;
	}

	public void setTodstat(Integer todstat) {
		this.todstat = todstat;
	}
	
}
