package com.phd.model;

import java.util.List;


public class PhdService {
	private PhdDAO_interface dao;
	
	public PhdService() {
		dao = new PhdDAO();
	}
		
	public void deletePhd(String pahno, String phono) {
		PhdVO phdvo = new PhdVO();
		
		phdvo.setPahno(pahno);
		phdvo.setPhono(phono);
		dao.delete(phdvo);
	}
	
	public List<PhdVO> getbypahno(String pahno){
		return dao.findByPAHNO(pahno);
	}
	
	public List<PhdVO> getbyphono(String phono){
		return dao.findByPHONO(phono);
	}
	
	public List<PhdVO> getall(){
		return dao.getall();
	}
}
