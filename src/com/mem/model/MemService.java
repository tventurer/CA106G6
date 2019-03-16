package com.mem.model;

import java.util.List;

public class MemService {
	private MemDAO_interface dao;
	
	public MemService() {
		dao = new MemDAO();
	}
	
	public MemVO addMem(String memacc, String mempwd, String mememail, 
			Integer mememailvalid, String memrealname, String memengname, 
			String memphone, java.sql.Date membirth, String memaddr, 
			String memidno, String membankacc) {
		
		MemVO vo = new MemVO();
		vo.setMemacc(memacc);
		vo.setMempwd(mempwd);
		vo.setMememail(mememail);
		vo.setMememailvalid(mememailvalid);
		vo.setMemrealname(memrealname);
		vo.setMemengname(memengname);
		vo.setMemphone(memphone);
		vo.setMembirth(membirth);
		vo.setMemaddr(memaddr);
		vo.setMemidno(memidno);
		vo.setMembankacc(membankacc);
		dao.insert(vo);
		
		return vo;
	}
	
	public MemVO updateMem(String memno, String memacc, String mempwd, String mememail, 
			Integer mememailvalid, String memrealname, String memengname, 
			String memphone, java.sql.Date membirth, String memaddr, 
			String memidno, String membankacc) {
		
		MemVO vo = new MemVO();
		vo.setMemno(memno);
		vo.setMemacc(memacc);
		vo.setMempwd(mempwd);
		vo.setMememail(mememail);
		vo.setMememailvalid(mememailvalid);
		vo.setMemrealname(memrealname);
		vo.setMemengname(memengname);
		vo.setMemphone(memphone);
		vo.setMembirth(membirth);
		vo.setMemaddr(memaddr);
		vo.setMemidno(memidno);
		vo.setMembankacc(membankacc);
		dao.update(vo);
		
		return vo;
	}
	
	public void updateMem(MemVO vo) {
		dao.update(vo);
	}
	
	public MemVO getOneMem(String memno) {
		return dao.findByPrimaryKey(memno);
	}
	
	public List<MemVO> getAll(){
		return dao.getAll();
	}
	
	public MemVO getEmailForLogin(String mememail) {
		return dao.findByEmail(mememail);
	}
	
	public MemVO getMemaccForLogin(String memacc) {
		return dao.findByMemacc(memacc);
	}
}
