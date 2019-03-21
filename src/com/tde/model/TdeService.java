package com.tde.model;

import java.sql.Timestamp;
import java.util.List;

public class TdeService {
	
private TdeDAO_interface dao;
	
	public TdeService() {
		dao = new TdeDAO();
	}
	
	public TdeVO addTde(String trino, String spono, Timestamp tdestart, Timestamp tdefinish, 
			String tdedate, Integer tdeseq, String tderemark) {
		
		TdeVO tde = new TdeVO();
		
		tde.setTrino(trino);
		tde.setSpono(spono);
		tde.setTdestart(tdestart);
		tde.setTdefinish(tdefinish);
		tde.setTdedate(tdedate);
		tde.setTdeseq(tdeseq);
		tde.setTderemark(tderemark);
		dao.add(tde);
		
		return tde;
	}
	
	public TdeVO updateTde(String spono, Timestamp tdestart, Timestamp tdefinish, 
			String tdedate, Integer tdeseq, String tderemark, String tdeno) {
		
		TdeVO tde = new TdeVO();
		
		tde.setSpono(spono);
		tde.setTdestart(tdestart);
		tde.setTdefinish(tdefinish);
		tde.setTdedate(tdedate);
		tde.setTdeseq(tdeseq);
		tde.setTderemark(tderemark);
		tde.setTdeno(tdeno);
		dao.update(tde);
		
		return tde;
	}
	
	public void deleteTde(String tdeno) {
		dao.delete(tdeno);
	}
	
	public TdeVO getOneTde(String tdeno) {
		return dao.findByPk(tdeno);
	}
	
	public List<TdeVO> getAllByTri(String trino) {
		return dao.findByTri(trino);
	}
	
	public List<TdeVO> getAll() {
		return dao.getAll();
	}
	
	
	
	//**********android專用
	public List<String> getDays(String trino){
		return dao.getDays(trino);
	}
	
	//**********android專用
	public List<String> getSpos(String trino, String tdedate){
		return dao.getSpos(trino, tdedate);
	};
	
}
