package com.sme.model;

import java.sql.Timestamp;
import java.util.List;

public class SmeService {
	
	private SmeDAO_interface dao; //有多型傳值安全，但為什麼一個介面對一個類別也需要?
	
	public SmeService() {
		dao = new SmeDAO();
	}
	
	public SmeVO addSme(String memno, String empno, String smecon, Integer smefrom) {
		SmeVO smeVO = new SmeVO();
		
		smeVO.setMemno(memno);
		smeVO.setEmpno(empno);
		smeVO.setSmecon(smecon);
		smeVO.setSmefrom(smefrom);

		dao.insert(smeVO);
		
		return smeVO;
	}
	

	public List<SmeVO> getAll() {
		return dao.getAll();
	}
	
	
	
}
