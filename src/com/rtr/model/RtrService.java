package com.rtr.model;

import java.util.List;

public class RtrService {

	private RtrDAO_interface dao;
	
	public RtrService() {
		dao = new RtrDAO();
	}
	
	public RtrVO addRtr(String empno, String rtrcon, String rtrcity, Integer rtrdays, Integer rtrpeonum, Integer rtrpref) {
		
		RtrVO rtr = new RtrVO();
		
		rtr.setEmpno(empno);
		rtr.setRtrcon(rtrcon);
		rtr.setRtrcity(rtrcity);
		rtr.setRtrdays(rtrdays);
		rtr.setRtrpeonum(rtrpeonum);
		rtr.setRtrpref(rtrpref);
		dao.add(rtr);
		
		return rtr;
	}
	
	public RtrVO updateRtr(String rtrcon, String rtrcity, Integer rtrdays, Integer rtrpeonum, Integer rtrpref, String rtrno) {
		
		RtrVO rtr = new RtrVO();
		
		rtr.setRtrcon(rtrcon);
		rtr.setRtrcity(rtrcity);
		rtr.setRtrdays(rtrdays);
		rtr.setRtrpeonum(rtrpeonum);
		rtr.setRtrpref(rtrpref);
		rtr.setRtrno(rtrno);
		dao.update(rtr);
		
		return rtr;
	}
	
	public void deleteRtr(String rtrno) {
		dao.delete(rtrno);
	}
	
	public RtrVO getOneRtr(String rtrno) {
		return dao.findByPk(rtrno);
	}
	
	public List<RtrVO> getAllByCdt(String rtrcon, String rtrcity, Integer rtrdays, Integer rtrpref) {
		return dao.findByCdt(rtrcon, rtrcity, rtrdays, rtrpref);
	}
	
	public List<RtrVO> getAll() {
		return dao.getAll();
	}
}
