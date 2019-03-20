package com.tri.model;

import java.sql.Date;
import java.util.List;

public class TriService {
	private TriDAO_interface dao;
	
	public TriService() {
		dao = new TriDAO();
	}
	
	public TriVO addTri(String memno, String triname, Date tribegdate, Date trienddate, 
			Integer tripeonum, Integer tristat, String triremark) {
		
		TriVO tri = new TriVO();
		
		tri.setMemno(memno);
		tri.setTriname(triname);
		tri.setTribegdate(tribegdate);
		tri.setTrienddate(trienddate);
		tri.setTripeonum(tripeonum);
		tri.setTristat(tristat);
		tri.setTriremark(triremark);
		dao.add(tri);
		
		return tri;
	}
	
	public TriVO updateTri(String triname, Date tribegdate, Date trienddate, Integer tripeonum, 
			Integer tristat, String triremark, String trino) {
		
		TriVO tri = new TriVO();
		
		tri.setTriname(triname);
		tri.setTribegdate(tribegdate);
		tri.setTrienddate(trienddate);
		tri.setTripeonum(tripeonum);
		tri.setTristat(tristat);
		tri.setTriremark(triremark);
		tri.setTrino(trino);
		dao.update(tri);
		
		return tri;
	}
	
	public void deleteTri(String trino) {
		dao.delete(trino);
	}
	
	public TriVO getOneTri(String trino) {
		return dao.findByPk(trino);
	}
	
	public TriVO getTriByTriname(String triname) {
		return dao.findByTriname(triname);
	}
	
	public List<TriVO> getAllByMemno(String memno) {
		return dao.findByMemno(memno);
	}
	
	public List<TriVO> getAllByTristat(int tristat) {
		return dao.findByTristat(tristat);
	}
	
	public List<TriVO> getAll() {
		return dao.getAll();
	}
}
