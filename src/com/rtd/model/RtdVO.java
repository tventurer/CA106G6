package com.rtd.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class RtdVO implements Serializable{
	
	private static final long serialVersionUID = 1501096466499622066L;
	private String rtdno;
	private String rtrno;
	private String spono;
	private Timestamp rtdstart;
	private Timestamp rtdfinish;
	private String rtddays;
	private Integer rtdseq;
	
	public RtdVO() {

	}

	public String getRtdno() {
		return rtdno;
	}

	public void setRtdno(String rtdno) {
		this.rtdno = rtdno;
	}

	public String getRtrno() {
		return rtrno;
	}

	public void setRtrno(String rtrno) {
		this.rtrno = rtrno;
	}

	public String getSpono() {
		return spono;
	}

	public void setSpono(String spono) {
		this.spono = spono;
	}

	public Timestamp getRtdstart() {
		return rtdstart;
	}

	public void setRtdstart(Timestamp rtdstart) {
		this.rtdstart = rtdstart;
	}

	public Timestamp getRtdfinish() {
		return rtdfinish;
	}

	public void setRtdfinish(Timestamp rtdfinish) {
		this.rtdfinish = rtdfinish;
	}

	public String getRtddays() {
		return rtddays;
	}

	public void setRtddays(String rtddays) {
		this.rtddays = rtddays;
	}

	public Integer getRtdseq() {
		return rtdseq;
	}

	public void setRtdseq(Integer rtdseq) {
		this.rtdseq = rtdseq;
	}
	
}
