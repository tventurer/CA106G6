package com.pos.model;

import java.util.List;

public class PosService {
	private PosDAO_interface dao;
	
	public PosService() {
		dao = new PosDAO();
	}
	
	public PosVO addPos(String memno, String tagno, String postitle, 
			String poscontent) {
		PosVO vo = new PosVO();
		
		vo.setMemno(memno);
		vo.setTagno(tagno);
		vo.setPostitle(postitle);
		vo.setPoscontent(poscontent);
		String key = dao.insert(vo);
		vo.setPosno(key);
		
		return vo;
	}
	
	public void deletePos(String posno) {
		dao.delete(posno);
	}
	
	public PosVO updatePos(String posno, String memno, String tagno, String postitle, String poscontent, String postime) {
		PosVO vo = new PosVO();
		vo.setPosno(posno);
		vo.setMemno(memno);
		vo.setTagno(tagno);
		vo.setPostitle(postitle);
		vo.setPoscontent(poscontent);
		vo.setPostime(java.sql.Timestamp.valueOf(postime));
		dao.update(vo);
		
		return vo;
	}
	
	public PosVO getOnePos(String posno) {
		return dao.findByPrimaryKey(posno);
	}
	
	public List<PosVO> getAll() {
		return dao.getAll();
	}
}
