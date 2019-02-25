package com.ema.model;

import java.util.List;

public class EmaService {
	
	private EmaDAO_interface dao; //有多型傳值安全，但為什麼一個介面對一個類別也需要?
	
	public EmaService() {
		dao = new EmaDAO();
	}
	
	public EmaVO addEma(String empno, String emrno, Integer emastate) {
		EmaVO emaVO = new EmaVO();
		
		emaVO.setEmpno(empno);
		emaVO.setEmrno(emrno);
		emaVO.setEmastate(emastate);

		dao.insert(emaVO);
		
		return emaVO;
	}
	
	public EmaVO updateEma(String empno, String emrno, Integer emastate) {
		EmaVO emaVO = new EmaVO();
		
		emaVO.setEmpno(empno);
		emaVO.setEmrno(emrno);
		emaVO.setEmastate(emastate);

		dao.update(emaVO);

		return emaVO;
	}
	
	public void deleteEma(String empno, String emrno) {
		dao.delete(empno, emrno);
	}
	
	public EmaVO getOneEma(String empno, String emrno) {
		return dao.findByPrimaryKey(empno, emrno);
	}

	public List<EmaVO> getAll() {
		return dao.getAll();
	}
	
	
	
}
