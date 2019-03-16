package com.pos.model;

import java.io.Serializable;

public class PosVO implements Serializable {
	private static final long serialVersionUID = 1L;
	private String posno;
	private String memno;
	private String tagno;
	private String postitle;
	private String poscontent;
	private java.sql.Date postime;
	
	public PosVO() {}
	public String getPosno() {
		return posno;
	}
	public void setPosno(String posno) {
		this.posno = posno;
	}
	public String getMemno() {
		return memno;
	}
	public void setMemno(String memno) {
		this.memno = memno;
	}
	public String getTagno() {
		return tagno;
	}
	public void setTagno(String tagno) {
		this.tagno = tagno;
	}
	public String getPostitle() {
		return postitle;
	}
	public void setPostitle(String postitle) {
		this.postitle = postitle;
	}
	public String getPoscontent() {
		return poscontent;
	}
	public void setPoscontent(String poscontent) {
		this.poscontent = poscontent;
	}
	public java.sql.Date getPostime() {
		return postime;
	}
	public void setPostime(java.sql.Date postime) {
		this.postime = postime;
	}
	@Override
	public String toString() {
		return "BlogPostVO [posno=" + posno + ", memno=" + memno + ", tagno=" + tagno + ", posTitle=" + postitle
				+ ", posContent=" + poscontent + ", posTime=" + postime + "]";
	}
}
