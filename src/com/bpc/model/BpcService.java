package com.bpc.model;

import java.util.List;

public class BpcService {
	private BpcDAO_interface dao;
	
	public BpcService() {
		dao = new BpcDAO();
	}
	
	public BpcVO addBpc(String memno, String posno, String bpccontent) {
		BpcVO vo = new BpcVO();
		vo.setMemno(memno);
		vo.setPosno(posno);
		vo.setBpccontent(bpccontent);
		dao.insert(vo);
		
		return vo;
	}
	
	public void deleteBpc(String bpcno) {
		dao.delete(bpcno);
	}
	
	public List<BpcVO> getListByPosno(String posno) {
		return dao.findByPosno(posno);
	}
}
