package com.pre.model;
import java.sql.Timestamp;

public class PreVO implements java.io.Serializable{
	private String preid;
	private String memno;
	private String purid;
	private String empno;
	private String precause;
	private Timestamp pretime;
	private Integer prestatus;
	private Integer prelabel;
	private Integer preresult;
	public String getPreid() {
		return preid;
	}
	public void setPreid(String preid) {
		this.preid = preid;
	}
	public String getMemno() {
		return memno;
	}
	public void setMemno(String memno) {
		this.memno = memno;
	}
	public String getPurid() {
		return purid;
	}
	public void setPurid(String purid) {
		this.purid = purid;
	}
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
	}
	public String getPrecause() {
		return precause;
	}
	public void setPrecause(String precause) {
		this.precause = precause;
	}
	public Timestamp getPretime() {
		return pretime;
	}
	public void setPretime(Timestamp pretime) {
		this.pretime = pretime;
	}
	public Integer getPrestatus() {
		return prestatus;
	}
	public void setPrestatus(Integer prestatus) {
		this.prestatus = prestatus;
	}
	public Integer getPrelabel() {
		return prelabel;
	}
	public void setPrelabel(Integer prelabel) {
		this.prelabel = prelabel;
	}
	public Integer getPreresult() {
		return preresult;
	}
	public void setPreresult(Integer preresult) {
		this.preresult = preresult;
	}
}
