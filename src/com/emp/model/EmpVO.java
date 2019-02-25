package com.emp.model;
import java.sql.Date;

public class EmpVO implements java.io.Serializable{
	private String empno;
	private String empname;
	private String emppwd;
	private Integer empgen;
	private String empphone;
	private String empcell;
	private String empmail;
	private String empdept;
	private String empposi;
	private Integer empsal;
	private Date empdoe;
	private byte[] emppic;
	
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
	}
	public String getEmpname() {
		return empname;
	}
	public void setEmpname(String empname) {
		this.empname = empname;
	}
	public String getEmppwd() {
		return emppwd;
	}
	public void setEmppwd(String emppwd) {
		this.emppwd = emppwd;
	}
	public Integer getEmpgen() {
		return empgen;
	}
	public void setEmpgen(Integer empgen) {
		this.empgen = empgen;
	}
	public String getEmpphone() {
		return empphone;
	}
	public void setEmpphone(String empphone) {
		this.empphone = empphone;
	}
	public String getEmpcell() {
		return empcell;
	}
	public void setEmpcell(String empcell) {
		this.empcell = empcell;
	}
	public String getEmpmail() {
		return empmail;
	}
	public void setEmpmail(String empmail) {
		this.empmail = empmail;
	}
	public String getEmpdept() {
		return empdept;
	}
	public void setEmpdept(String empdept) {
		this.empdept = empdept;
	}
	public String getEmpposi() {
		return empposi;
	}
	public void setEmpposi(String empposi) {
		this.empposi = empposi;
	}
	public Integer getEmpsal() {
		return empsal;
	}
	public void setEmpsal(Integer empsal) {
		this.empsal = empsal;
	}
	public Date getEmpdoe() {
		return empdoe;
	}
	public void setEmpdoe(Date empdoe) {
		this.empdoe = empdoe;
	}
	public byte[] getEmppic() {
		return emppic;
	}
	public void setEmppic(byte[] emppic) {
		this.emppic = emppic;
	}
	
}
