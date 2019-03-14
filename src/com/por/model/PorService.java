package com.por.model;

import java.util.List;

public class PorService {
	
	private PorDAO_interface dao;
	
	public PorService() {
		dao = new PorDAO();
	}
	
	public PorVO addPor(String purid, String memno, String pormemname, Integer porprice, String poraddress, String portel, Integer porstatus, Integer porbuyscore, String porbuycontent, Integer porsellscore, String porsellcontent, Integer porsum, Integer porlogistics, byte[] porqr) {
		PorVO porVO = new PorVO();
		
		porVO.setPurid(purid);
		porVO.setMemno(memno);
		porVO.setPormemname(pormemname);
		porVO.setPorprice(porprice);
		porVO.setPoraddress(poraddress);
		porVO.setPortel(portel);
		porVO.setPorstatus(porstatus);
		porVO.setPorbuyscore(porbuyscore);
		porVO.setPorbuycontent(porbuycontent);
		porVO.setPorsellscore(porsellscore);
		porVO.setPorsellcontent(porsellcontent);
		porVO.setPorsum(porsum);
		porVO.setPorlogistics(porlogistics);
		porVO.setPorqr(porqr);
		dao.insert(porVO);
		
		return porVO;
	}
	public PorVO updatePor(String purid, String memno, String pormemname,Integer porprice, String poraddress, String portel, Integer porstatus, Integer porbuyscore, String porbuycontent, Integer porsellscore, String porsellcontent, Integer porsum, Integer porlogistics, byte[] porqr, String porid) {
PorVO porVO = new PorVO();
		
		porVO.setPurid(purid);
		porVO.setMemno(memno);
		porVO.setPormemname(pormemname);
		porVO.setPorprice(porprice);
		porVO.setPoraddress(poraddress);
		porVO.setPortel(portel);
		porVO.setPorstatus(porstatus);
		porVO.setPorbuyscore(porbuyscore);
		porVO.setPorbuycontent(porbuycontent);
		porVO.setPorsellscore(porsellscore);
		porVO.setPorsellcontent(porsellcontent);
		porVO.setPorsum(porsum);
		porVO.setPorlogistics(porlogistics);
		porVO.setPorqr(porqr);
		porVO.setPorid(porid);
		dao.update(porVO);
		
		return porVO;
	}
	
	public void deletePor(String porid) {
		dao.delete(porid);
	}
	
	public PorVO getOnePor(String porid) {
		return dao.findByPrimaryKey(porid);
	}
	
	public List<PorVO> getAll(){
		return dao.getAll();
	}
	
	public Integer getPurporsum(String purid) {
		return dao.getPurporsum(purid);
	}
	public PorVO updatePorStatus(Integer porstatus, String porid) {
		PorVO porVO = new PorVO();
				
				porVO.setPorstatus(porstatus);
				porVO.setPorid(porid);
				dao.update(porVO);
				
				return porVO;
			}
	public PorVO updatePorBuyTime(Integer porbuyscore, String porbuycontent, String porid) {
		PorVO porVO = new PorVO();
				
				porVO.setPorbuyscore(porbuyscore);
				porVO.setPorbuycontent(porbuycontent);
				porVO.setPorid(porid);
				dao.update(porVO);
				
				return porVO;
			}
	public PorVO updatePorSellTime(Integer porsellscore, String porsellcontent, String porid) {
		PorVO porVO = new PorVO();
				
				porVO.setPorsellscore(porsellscore);
				porVO.setPorsellcontent(porsellcontent);
				porVO.setPorid(porid);
				dao.update(porVO);
				
				return porVO;
			}
}
