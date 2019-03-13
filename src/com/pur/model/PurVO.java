package com.pur.model;
import java.sql.Timestamp;
import java.sql.Date;

public class PurVO implements java.io.Serializable{
	private String purid;
	private String memno;
	private String purname;
	private String purcontent;
	private Integer pursort;
	private String pururl;
	private String purcountry;
	private String purdelivery;
	private Integer purreprice;
	private Integer purpricing;
	private Timestamp purobtained;
	private Timestamp purtime;
	private Integer purreceipt;
	private Integer purstatus;
	private byte[] purpic;
	private Timestamp purextime;
	private Integer purstock;
	private Integer pursell;
	private Integer purlimit;
	private Timestamp pursavetime;
	public String getPurid() {
		return purid;
	}
	public void setPurid(String purid) {
		this.purid = purid;
	}
	public String getMemno() {
		return memno;
	}
	public void setMemno(String memno) {
		this.memno = memno;
	}
	public String getPurname() {
		return purname;
	}
	public void setPurname(String purname) {
		this.purname = purname;
	}
	public String getPurcontent() {
		return purcontent;
	}
	public void setPurcontent(String purcontent) {
		this.purcontent = purcontent;
	}
	public Integer getPursort() {
		return pursort;
	}
	public void setPursort(Integer pursort) {
		this.pursort = pursort;
	}
	public String getPururl() {
		return pururl;
	}
	public void setPururl(String pururl) {
		this.pururl = pururl;
	}
	public String getPurcountry() {
		return purcountry;
	}
	public void setPurcountry(String purcountry) {
		this.purcountry = purcountry;
	}
	public String getPurdelivery() {
		return purdelivery;
	}
	public void setPurdelivery(String purdelivery) {
		this.purdelivery = purdelivery;
	}
	public Integer getPurreprice() {
		return purreprice;
	}
	public void setPurreprice(Integer purreprice) {
		this.purreprice = purreprice;
	}
	public Integer getPurpricing() {
		return purpricing;
	}
	public void setPurpricing(Integer purpricing) {
		this.purpricing = purpricing;
	}
	public Timestamp getPurobtained() {
		return purobtained;
	}
	public void setPurobtained(Timestamp purobtained) {
		this.purobtained = purobtained;
	}
	public Timestamp getPurtime() {
		return purtime;
	}
	public void setPurtime(Timestamp purtime) {
		this.purtime = purtime;
	}
	public Integer getPurreceipt() {
		return purreceipt;
	}
	public void setPurreceipt(Integer purreceipt) {
		this.purreceipt = purreceipt;
	}
	public Integer getPurstatus() {
		return purstatus;
	}
	public void setPurstatus(Integer purstatus) {
		this.purstatus = purstatus;
	}
	public byte[] getPurpic() {
		return purpic;
	}
	public void setPurpic(byte[] purpic) {
		this.purpic = purpic;
	}
	public Timestamp getPurextime() {
		return purextime;
	}
	public void setPurextime(Timestamp purextime) {
		this.purextime = purextime;
	}
	public Integer getPurstock() {
		return purstock;
	}
	public void setPurstock(Integer purstock) {
		this.purstock = purstock;
	}
	public Integer getPursell() {
		return pursell;
	}
	public void setPursell(Integer pursell) {
		this.pursell = pursell;
	}
	public Integer getPurlimit() {
		return purlimit;
	}
	public void setPurlimit(Integer purlimit) {
		this.purlimit = purlimit;
	}
	public Timestamp getPursavetime() {
		return pursavetime;
	}
	public void setPursavetime(Timestamp pursavetime) {
		this.pursavetime = pursavetime;
	}
}
