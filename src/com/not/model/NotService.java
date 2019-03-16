package com.not.model;

import java.util.List;

public class NotService {
	private NotDAO_interface dao;
	
	public NotService() {
		dao = new NotDAO();
	}
	
	public List<NotVO> getByMemno(String memno) {
		return dao.findByMemno(memno);
	}
}
