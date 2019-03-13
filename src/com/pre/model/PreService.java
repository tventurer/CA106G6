package com.pre.model;

import java.util.List;


public class PreService {
	
	private PreDAO_interface dao;
	
	public PreService() {
		dao = new PreDAO();
	}
	
	public PreVO addPre(String memno, String purid, String empno, String precause, Integer prestatus, Integer prelabel, Integer preresult) {
		PreVO preVO = new PreVO();
		
		preVO.setMemno(memno);
		preVO.setPurid(purid);
		preVO.setEmpno(empno);
		preVO.setPrecause(precause);
		preVO.setPrestatus(prestatus);
		preVO.setPrelabel(prelabel);
		preVO.setPreresult(preresult);
		dao.insert(preVO);
		
		return preVO;
	}
	
	public PreVO updatePre(String memno, String purid, String empno, String precause, Integer prestatus, Integer prelabel, Integer preresult, String preid) {
		PreVO preVO = new PreVO();
		
		preVO.setMemno(memno);
		preVO.setPurid(purid);
		preVO.setEmpno(empno);
		preVO.setPrecause(precause);
		preVO.setPrestatus(prestatus);
		preVO.setPrelabel(prelabel);
		preVO.setPreresult(preresult);
		preVO.setPreid(preid);
		dao.update(preVO);
		
		return preVO;
	}
	
	public void deletePre(String preid) {
		dao.delete(preid);
	}

	public PreVO getOnePre(String preid) {
		return dao.findByPrimaryKey(preid);
	}

	public List<PreVO> getAll() {
		return dao.getAll();
	}
}
