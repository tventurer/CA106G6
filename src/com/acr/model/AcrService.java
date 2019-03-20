package com.acr.model;

import java.sql.Timestamp;
import java.util.List;

public class AcrService {
	
	private AcrDAO_interface dao;

	public AcrService() {
		dao = new AcrDAO();
	}
	
	public AcrVO addAcr(String memno, Integer acrprice, Integer acrsource, String acrend, Integer acrtotal) {
		AcrVO acrVO = new AcrVO();
		acrVO.setMemno(memno);
		acrVO.setAcrprice(acrprice);
		acrVO.setAcrsource(acrsource);
		acrVO.setAcrend(acrend);
		acrVO.setAcrtotal(acrtotal);
		dao.insert(acrVO);
		
		return acrVO;
	}
	
	public AcrVO updateAcr(String memno, Integer acrprice, Integer acrsource, String acrend, Integer acrtotal, String acrid) {
		AcrVO acrVO = new AcrVO();
		acrVO.setMemno(memno);
		acrVO.setAcrprice(acrprice);
		acrVO.setAcrsource(acrsource);
		acrVO.setAcrend(acrend);
		acrVO.setAcrtotal(acrtotal);
		acrVO.setAcrid(acrid);
		dao.update(acrVO);
		
		return acrVO;
	}
	
	public void deleteAcr(String acrid) {
		dao.delete(acrid);
	}
	
	public AcrVO getOneAcr(String acrid) {
		return dao.findByPrimaryKey(acrid);
	}
	
	public List<AcrVO> getAll(){
		return dao.getAll();
	}
	public List<AcrVO> getMemAll(String memno){
		return dao.getMemAll(memno);
	}
	public Integer getMemacrtotal(String memno) {
		return dao.getMemacrtotal(memno);
	}
	public AcrVO findByPrimaryKey(String acrid) {
		return dao.findByPrimaryKey(acrid);
	}
	public List<AcrVO> getMemTimeBetween(String memno, Timestamp atime, Timestamp btime){
		return dao. getMemTimeBetween(memno, atime, btime);
	}

}
