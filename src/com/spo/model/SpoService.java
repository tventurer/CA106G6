package com.spo.model;

import java.util.List;

public class SpoService {
	
private SpoDAO_interface dao;
	
	public SpoService() {
		dao = new SpoDAO();
	}
	
	public SpoVO addSpo(String sponame, String spoclass, String spocon, String spocity,
			Double spolat, Double spolong, String spoaddr, String spocontent, byte[] spopic, Integer spoattribute) {
		
		SpoVO spo = new SpoVO();
		
		spo.setSponame(sponame);
		spo.setSpoclass(spoclass);
		spo.setSpocon(spocon);
		spo.setSpocity(spocity);
		spo.setSpolat(spolat);
		spo.setSpolong(spolong);
		spo.setSpoaddr(spoaddr);
		spo.setSpocontent(spocontent);
		spo.setSpopic(spopic);
		spo.setSpoattribute(spoattribute);
		dao.add(spo);
		
		return spo;
	}
	
	public SpoVO updateSpo(String sponame, String spoclass, String spocon, String spocity,
			Double spolat, Double spolong, String spoaddr, String spocontent, byte[] spopic, Integer spoattribute, String spono) {
		
		SpoVO spo = new SpoVO();
		
		spo.setSponame(sponame);
		spo.setSpoclass(spoclass);
		spo.setSpocon(spocon);
		spo.setSpocity(spocity);
		spo.setSpolat(spolat);
		spo.setSpolong(spolong);
		spo.setSpoaddr(spoaddr);
		spo.setSpocontent(spocontent);
		spo.setSpopic(spopic);
		spo.setSpoattribute(spoattribute);
		spo.setSpono(spono);
		dao.update(spo);
		
		return spo;
	}
	
	public void deleteSpo(String spono) {
		dao.delete(spono);
	}
	
	public SpoVO getOneSpo(String spono) {
		return dao.findByPk(spono);
	}
	
	public List<SpoVO> getAllByCity(String spocity) {
		return dao.findByCity(spocity);
	}
	
	public List<SpoVO> getAllByClass(String spoclass) {
		return dao.findByClass(spoclass);
	}
	
	public List<SpoVO> getAll() {
		return dao.getAll();
	}
}
