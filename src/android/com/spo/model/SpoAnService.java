package android.com.spo.model;

import java.util.List;

public class SpoAnService {
	
private SpoAnDAO_interface dao;
	
	public SpoAnService() {
		dao = new SpoAnDAO();
	}
	
//	public SpoAnVO addSpo(String sponame, String spoclass, String spocon, String spocity,
//			Double spolat, Double spolong, String spoaddr, String spocontent, byte[] spopic, Integer spoattribute) {
//		
//		SpoAnVO spo = new SpoAnVO();
//		
//		spo.setSponame(sponame);
//		spo.setSpoclass(spoclass);
//		spo.setSpocon(spocon);
//		spo.setSpocity(spocity);
//		spo.setSpolat(spolat);
//		spo.setSpolong(spolong);
//		spo.setSpoaddr(spoaddr);
//		spo.setSpocontent(spocontent);
//		spo.setSpopic(spopic);
//		spo.setSpoattribute(spoattribute);
//		dao.add(spo);
//		
//		return spo;
//	}
//	
//	public SpoAnVO updateSpo(String sponame, String spoclass, String spocon, String spocity,
//			Double spolat, Double spolong, String spoaddr, String spocontent, byte[] spopic, Integer spoattribute, String spono) {
//		
//		SpoAnVO spo = new SpoAnVO();
//		
//		spo.setSponame(sponame);
//		spo.setSpoclass(spoclass);
//		spo.setSpocon(spocon);
//		spo.setSpocity(spocity);
//		spo.setSpolat(spolat);
//		spo.setSpolong(spolong);
//		spo.setSpoaddr(spoaddr);
//		spo.setSpocontent(spocontent);
//		spo.setSpopic(spopic);
//		spo.setSpoattribute(spoattribute);
//		spo.setSpono(spono);
//		dao.update(spo);
//		
//		return spo;
//	}
	
//	public void deleteSpo(String spono) {
//		dao.delete(spono);
//	}
	
//	public List<SpoAnVO> getAllByCity(String spocity) {
//		return dao.findByCity(spocity);
//	}
//	
//	public List<SpoAnVO> getAllByClass(String spoclass) {
//		return dao.findByClass(spoclass);
//	}
	
	public SpoAnVO getOneSpo(String spono) {
		return dao.findByPk(spono);
	}
	
	public List<SpoAnVO> getAll() {
		return dao.getAll();
	}
	
	public byte[] getImg(String spono) {
		return dao.getImg(spono);
	}
}
