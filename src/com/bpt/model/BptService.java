package com.bpt.model;

import java.util.List;

public class BptService {
	private BptDAO_interface dao;
	
	public BptService() {
		dao = new BptDAO();
	}
	
	public BptVO getOneBpt(String tagno) {
		BptVO vo = dao.findByPrimaryKey(tagno);
		return vo;
	}
	
	public List<BptVO> getAll(){
		List<BptVO> list = dao.getAll();
		return list;
	}
}
