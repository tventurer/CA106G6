package com.por.model;
import java.sql.Timestamp;

public class PorVO implements java.io.Serializable{
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
	public byte[] getPorqr() {
		return porqr;
	}
	public void setPorqr(byte[] porqr) {
		this.porqr = porqr;
	}
	private String porid;
	private String purid;
	private String memno;
	private String pormemname;
	private Integer porprice;
	private Timestamp portime;
	private String poraddress;
	private String portel;
	private Integer porstatus;
	private Integer porbuyscore;
	private String porbuycontent;
	private Integer porsellscore;
	private String porsellcontent;
	private Integer porsum;
	private Integer porlogistics;
	private byte[] porqr;
}
