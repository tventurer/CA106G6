package com.por.model;
import java.sql.Timestamp;

public class PorVO implements java.io.Serializable{
	private String porid;
	private String purid;
	private String memno;
	private String pormemname;
	private Integer porprice;
	private Timestamp portime;
	private String poraddress;
	private String portel;
	private Integer porstatus;
	private Timestamp porstatustime;
	private Integer porbuyscore;
	private String porbuycontent;
	private Timestamp porbuytime;
	private Integer porsellscore;
	private String porsellcontent;
	private Timestamp porselltime;
	private Integer porsum;
	private Integer porlogistics;
	private Timestamp porlogtime;
	private byte[] porqr;
	public String getPorid() {
		return porid;
	}
	public void setPorid(String porid) {
		this.porid = porid;
	}
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
	public String getPormemname() {
		return pormemname;
	}
	public void setPormemname(String pormemname) {
		this.pormemname = pormemname;
	}
	public Integer getPorprice() {
		return porprice;
	}
	public void setPorprice(Integer porprice) {
		this.porprice = porprice;
	}
	public Timestamp getPortime() {
		return portime;
	}
	public void setPortime(Timestamp portime) {
		this.portime = portime;
	}
	public String getPoraddress() {
		return poraddress;
	}
	public void setPoraddress(String poraddress) {
		this.poraddress = poraddress;
	}
	public String getPortel() {
		return portel;
	}
	public void setPortel(String portel) {
		this.portel = portel;
	}
	public Integer getPorstatus() {
		return porstatus;
	}
	public void setPorstatus(Integer porstatus) {
		this.porstatus = porstatus;
	}
	public Timestamp getPorstatustime() {
		return porstatustime;
	}
	public void setPorstatustime(Timestamp porstatustime) {
		this.porstatustime = porstatustime;
	}
	public Integer getPorbuyscore() {
		return porbuyscore;
	}
	public void setPorbuyscore(Integer porbuyscore) {
		this.porbuyscore = porbuyscore;
	}
	public String getPorbuycontent() {
		return porbuycontent;
	}
	public void setPorbuycontent(String porbuycontent) {
		this.porbuycontent = porbuycontent;
	}
	public Timestamp getPorbuytime() {
		return porbuytime;
	}
	public void setPorbuytime(Timestamp porbuytime) {
		this.porbuytime = porbuytime;
	}
	public Integer getPorsellscore() {
		return porsellscore;
	}
	public void setPorsellscore(Integer porsellscore) {
		this.porsellscore = porsellscore;
	}
	public String getPorsellcontent() {
		return porsellcontent;
	}
	public void setPorsellcontent(String porsellcontent) {
		this.porsellcontent = porsellcontent;
	}
	public Timestamp getPorselltime() {
		return porselltime;
	}
	public void setPorselltime(Timestamp porselltime) {
		this.porselltime = porselltime;
	}
	public Integer getPorsum() {
		return porsum;
	}
	public void setPorsum(Integer porsum) {
		this.porsum = porsum;
	}
	public Integer getPorlogistics() {
		return porlogistics;
	}
	public void setPorlogistics(Integer porlogistics) {
		this.porlogistics = porlogistics;
	}
	public Timestamp getPorlogtime() {
		return porlogtime;
	}
	public void setPorlogtime(Timestamp porlogtime) {
		this.porlogtime = porlogtime;
	}
	public byte[] getPorqr() {
		return porqr;
	}
	public void setPorqr(byte[] porqr) {
		this.porqr = porqr;
	}
	
}
