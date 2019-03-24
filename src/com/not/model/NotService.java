package com.not.model;

import java.util.List;

public class NotService {
	private NotDAO_interface dao;
	
	public NotService() {
		dao = new NotDAO();
	}
	
	public NotVO addNot(String memno, String notcontent) {
		NotVO notVO = new NotVO();
		notVO.setMemno(memno);
		notVO.setNotcontent(notcontent);
		dao.insert(notVO);
		return notVO;
	}
	
	public List<NotVO> getByMemno(String memno) {
		return dao.findByMemno(memno);
	}
}
