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
	
	public void update(NotVO notvo) {
		dao.update(notvo);
	}
	
	public NotVO getOneNot(String notno) {
		return dao.findByPrimaryKey(notno);
	}
	
	public List<NotVO> getByMemno(String memno) {
		return dao.findByMemno(memno);
	}
	
	public void allReaded(String memno) {
		List<NotVO> list = dao.findByMemno(memno);
		for (NotVO vo : list) {
			vo.setNotreaded(1);
			dao.update(vo);
		}
	}
}
