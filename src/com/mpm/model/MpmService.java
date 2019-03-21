package com.mpm.model;

import java.util.List;

public class MpmService {
	private MpmDAO_interface dao;
	
	public MpmService() {
		dao = new MpmDAO();
	}
	
	public MpmVO addMpm(String memsender, String mpmreceiver, String mpmtitle, String mpmcontent) {
		MpmVO mpmVO = new MpmVO();
		mpmVO.setMpmsender(memsender);
		mpmVO.setMpmreceiver(mpmreceiver);
		mpmVO.setMpmtitle(mpmtitle);
		mpmVO.setMpmcontent(mpmcontent);
		dao.insert(mpmVO);
		
		return mpmVO;
	}
	
	public List<MpmVO> getAll() {
		return dao.getAll();
	}
}
