package com.mpm.model;

import java.util.List;

public class MpmService {
	private MpmDAO_interface dao;
	
	public MpmService() {
		dao = new MpmDAO();
	}
	
	public List<MpmVO> getAll() {
		return dao.getAll();
	}
}
