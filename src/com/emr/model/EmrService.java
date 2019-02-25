package com.emr.model;

import java.util.List;

public class EmrService {
	
	private EmrDAO_interface dao;
	
	public EmrService() {
		dao = new EmrDAO();
	}
	
	public EmrVO addEmr(String emrname) {
		EmrVO emrVO = new EmrVO();
		
		emrVO.setEmrname(emrname);

		dao.insert(emrVO);
		
		return emrVO;
	}
	
	public EmrVO updateEmr(String emrno, String emrname) {
		EmrVO emrVO = new EmrVO();
		
		emrVO.setEmrno(emrno);
		emrVO.setEmrname(emrname);

		dao.update(emrVO);

		return emrVO;
	}
	
	public void deleteEmr(String emrno) {
		dao.delete(emrno);
	}
	
	public EmrVO getOneEmr(String emrno) {
		return dao.findByPrimaryKey(emrno);
	}

	public List<EmrVO> getAll() {
		return dao.getAll();
	}
	
	
}
