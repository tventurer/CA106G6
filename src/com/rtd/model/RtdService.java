package com.rtd.model;

import java.sql.Timestamp;
import java.util.List;

public class RtdService {
	
	private RtdDAO_interface dao;
	
	public RtdService() {
		dao = new RtdDAO();
	}
	
	public RtdVO addRtd(String rtrno, String spono, Timestamp rtdstart, Timestamp rtdfinish, String rtddays, Integer rtdseq) {
		
		RtdVO rtd = new RtdVO();
		
		rtd.setRtrno(rtrno);
		rtd.setSpono(spono);
		rtd.setRtdstart(rtdstart);
		rtd.setRtdfinish(rtdfinish);
		rtd.setRtddays(rtddays);
		rtd.setRtdseq(rtdseq);
		dao.add(rtd);
		
		return rtd;
	}
	
	public RtdVO updateRtd(String spono, Timestamp rtdstart, Timestamp rtdfinish, String rtddays, Integer rtdseq, String rtdno) {
		
		RtdVO rtd = new RtdVO();
		
		rtd.setSpono(spono);
		rtd.setRtdstart(rtdstart);
		rtd.setRtdfinish(rtdfinish);
		rtd.setRtddays(rtddays);
		rtd.setRtdseq(rtdseq);
		rtd.setRtdno(rtdno);
		dao.update(rtd);
		
		return rtd;
	}
	
	public void deleteRtd(String rtdno) {
		dao.delete(rtdno);
	}
	
	public RtdVO getOneRtd(String rtdno) {
		return dao.findByPk(rtdno);
	}
	
	public List<RtdVO> getAllByRtr(String rtrno) {
		return dao.findByRtr(rtrno);
	}
	
	public List<RtdVO> getAll() {
		return dao.getAll();
	}
}
