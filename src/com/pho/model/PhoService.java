package com.pho.model;

import java.sql.Date;
import java.util.List;

import com.phd.model.*;

public class PhoService {
	PhoDAO_interface dao = null;
	
	public PhoService(){
		dao = new PhoDAO();
	}
	
	public PhoVO addPho(String phoowner, String phophone, String phomail,
		String phovisa, Integer phototal, String memno, List<PhdVO> phdList) {
		
		PhoVO phovo = new PhoVO();
		phovo.setPhoowner(phoowner);
		phovo.setPhophone(phophone);
		phovo.setPhomail(phomail);
		phovo.setPhovisa(phovisa);
		phovo.setPhototal(phototal);
		phovo.setMemno(memno);
		
		
		dao.insertWithDetail(phovo, phdList);
		return phovo;
	}
	
	public PhoVO updatePho(String phoowner, String phophone, String phomail,
		Date phostdate, Integer phostatus, String phomark, String phovisa, Integer phototal, String memno, String phono) {
		PhoVO phovo = new PhoVO();
		
		phovo.setPhono(phono);
		phovo.setPhoowner(phoowner);
		phovo.setPhophone(phophone);
		phovo.setPhomail(phomail);
		phovo.setPhostdate(phostdate);
		phovo.setPhostatus(phostatus);
		phovo.setPhomark(phomark);
		phovo.setPhovisa(phovisa);
		phovo.setPhototal(phototal);
		phovo.setMemno(memno);
		dao.update(phovo);
		return phovo;
		
	}
	
	public void deletePho(String phono) {
		dao.delete(phono);
	}
	
	public PhoVO getOnePho(String phono) {
		return dao.findByPrimaryKey(phono);
	}

	public List<PhoVO> getall() {
		return dao.getall();
	}
	
	public List<PhoVO> getmeorder(String memno) {
		return dao.getmeorder(memno);
	}
	
	public void changeStatus(Integer phostatus, String phomark, String phono) {
		dao.changeStatus(phostatus, phomark, phono);
		return;
	}
	
	//**********android使用
	public String addOrder(PhoListVO phoListVO, List<PhdVO> phdVOList) {
		return dao.addWithPhoList(phoListVO, phdVOList);
	}
	//**********android使用
	public List<PhoListVO> getall(String memno, String start, String end){
		return dao.getall(memno, start, end);
	}
	
}
