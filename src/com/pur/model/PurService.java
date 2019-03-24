package com.pur.model;

import java.sql.Timestamp;
import java.util.List;


public class PurService {
	
	private PurDAO_interface dao;
	
	public PurService() {
		dao = new PurDAO();
	}
	
	public PurVO addPur(String memno, String purname, String purcontent, Integer pursort, String pururl, String purcountry, String purdelivery, Integer purreprice, Integer purpricing, Timestamp purobtained, Integer purreceipt, Integer purstatus, byte[] purpic, Timestamp purextime, Integer purstock, Integer pursell, Integer purlimit) {
		PurVO purVO = new PurVO();
		
		purVO.setMemno(memno);
		purVO.setPurname(purname);
		purVO.setPurcontent(purcontent);
		purVO.setPursort(pursort);
		purVO.setPururl(pururl);
		purVO.setPurcountry(purcountry);
		purVO.setPurdelivery(purdelivery);
		purVO.setPurreprice(purreprice);
		purVO.setPurpricing(purpricing);
		purVO.setPurobtained(purobtained);
		purVO.setPurreceipt(purreceipt);
		purVO.setPurstatus(purstatus);
		purVO.setPurpic(purpic);
		purVO.setPurextime(purextime);
		purVO.setPurstock(purstock);
		purVO.setPursell(pursell);
		purVO.setPurlimit(purlimit);
		dao.insert(purVO);
		
		return purVO;
	}
	public PurVO updatePur(String memno, String purname, String purcontent, Integer pursort, String pururl, String purcountry, String purdelivery, Integer purreprice, Integer purpricing, Timestamp purobtained, Integer purreceipt, Integer purstatus, byte[] purpic, Timestamp purextime, Integer purstock, Integer pursell, Integer purlimit, String purid) {
		PurVO purVO = new PurVO();
		
		purVO.setMemno(memno);
		purVO.setPurname(purname);
		purVO.setPurcontent(purcontent);
		purVO.setPursort(pursort);
		purVO.setPururl(pururl);
		purVO.setPurcountry(purcountry);
		purVO.setPurdelivery(purdelivery);
		purVO.setPurreprice(purreprice);
		purVO.setPurpricing(purpricing);
		purVO.setPurobtained(purobtained);
		purVO.setPurreceipt(purreceipt);
		purVO.setPurstatus(purstatus);
		purVO.setPurpic(purpic);
		purVO.setPurextime(purextime);
		purVO.setPurstock(purstock);
		purVO.setPursell(pursell);
		purVO.setPurlimit(purlimit);
		purVO.setPurid(purid);
		dao.update(purVO);
		
		return purVO;
	}
	
	public void deletePur(String purid,Integer purstatus) {
		dao.delete(purid,purstatus);
	}

	public PurVO getOnePur(String purid) {
		return dao.findByPrimaryKey(purid);
	}

	public List<PurVO> getAll() {
		return dao.getAll();
	}
	
	public List<PurVO> getPurOneAll() {
		return dao.getPurOneAll();
	}
	public List<PurVO> getMemAll(String memno){
		return dao.getMemAll(memno);
	}

	public PurVO findByPrimaryKey(String purid) {
		// TODO Auto-generated method stub
		return dao.findByPrimaryKey(purid);
	}
	public List<PurVO> getSortAll(Integer pursort){
		return dao.getSortAll(pursort);
	}
	
	public PurVO updatePurSell(Integer pursell, String purid) {
		PurVO purVO = new PurVO();
		
		purVO.setPursell(pursell);
		purVO.setPurid(purid);
		dao.updatePurSell(purVO);
		
		return purVO;
	}
	public PurVO updatePurstatus(Integer Purstatus, String purid) {
		PurVO purVO = new PurVO();
		
		purVO.setPurstatus(Purstatus);
		purVO.setPurid(purid);
		dao.updatePurstatus(purVO);
		
		return purVO;
	}
	public List<String> getTimeAndDown(String starttime,String endtime){
		return dao.getTimeAndDown(starttime,endtime);
	}
}
