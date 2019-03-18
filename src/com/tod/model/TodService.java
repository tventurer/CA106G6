package com.tod.model;

import java.sql.Date;
import java.util.List;

public class TodService {
	
	private TodDAO_interface dao;
	
	public TodService() {
		dao = new TodDAO();
	}
	
	public TodVO addTod(String memno, String trino, String empno, Integer todquo, Date todddl, String todremark, Integer todstat) {
		
		TodVO tod = new TodVO();
		
		tod.setMemno(memno);
		tod.setTrino(trino);
		tod.setEmpno(empno);
		tod.setTodquo(todquo);
		tod.setTodddl(todddl);
		tod.setTodremark(todremark);
		tod.setTodstat(todstat);
		dao.add(tod);
		
		return tod;
	}
	
	public TodVO updateTod(String empno, Integer todquo, Date todddl,
			String todremark, Integer todstat, String todno) {
		
		TodVO tod = new TodVO();
		
		tod.setEmpno(empno);
		tod.setTodquo(todquo);
		tod.setTodddl(todddl);
		tod.setTodremark(todremark);
		tod.setTodstat(todstat);
		tod.setTodno(todno);
		dao.update(tod);
		
		return tod;
	}
	
	public void deleteTod(String todno) {
		dao.delete(todno);
	}
	
	public TodVO getOneTod(String todno) {
		return dao.findByPk(todno);
	}
	
	public List<TodVO> getAll() {
		return dao.getAll();
	}
}
