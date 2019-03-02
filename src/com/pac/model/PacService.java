package com.pac.model;
import java.util.List;

public class PacService {

	private PacDAO_interface dao;

	public PacService() {
		dao = new PacDAOimpl();
	}

	public PacVO addPac(String empno, String pacname,String paccountry,
			String paccity,Integer pactotalday,Integer pacprice,Integer pacdeposit, 
			String pacdiv,String paccontent,byte[] pactchar1,byte[] pactchar2,String pacremark,Integer pacstatus) {
//
		PacVO pacVO = new PacVO();
		
		pacVO.setEmpno(empno);
		pacVO.setPacname(pacname);
		pacVO.setPaccountry(paccountry);
		pacVO.setPaccity(paccity);
		pacVO.setPactotalday(pactotalday);
		pacVO.setPacprice(pacprice);
		pacVO.setPacdeposit(pacdeposit);
		pacVO.setPacdiv(pacdiv);
		pacVO.setPaccontent(paccontent);
		pacVO.setPactchar1(pactchar1);
		pacVO.setPactchar2(pactchar2);
		pacVO.setPacremark(pacremark);
		pacVO.setPacstatus(pacstatus);
		dao.insert(pacVO);
		return pacVO;
	}

	//預留給 Struts 2 用的
	public void addPac(PacVO pacVO) {
		dao.insert(pacVO);
	}
	
	public PacVO updatePac(String pacno, String empno, String pacname,String paccountry,
			String paccity,Integer pactotalday,Integer pacprice,Integer pacdeposit, 
			String pacdiv,String paccontent,byte[] pactchar1,byte[] pactchar2,String pacremark,Integer pacstatus) {

		PacVO pacVO = new PacVO();

		pacVO.setPacno(pacno);
		pacVO.setEmpno(empno);
		pacVO.setPacname(pacname);
		pacVO.setPaccountry(paccountry);
		pacVO.setPaccity(paccity);
		pacVO.setPactotalday(pactotalday);
		pacVO.setPacprice(pacprice);
		pacVO.setPacdeposit(pacdeposit);
		pacVO.setPacdiv(pacdiv);
		pacVO.setPaccontent(paccontent);
		pacVO.setPactchar1(pactchar1);
		pacVO.setPactchar2(pactchar2);
		pacVO.setPacremark(pacremark);
		pacVO.setPacstatus(pacstatus);
		dao.update(pacVO);

		return dao.findByPrimaryKey(pacno);
	}
	
	//預留給 Struts 2 用的
	public void updatePac(PacVO pacVO) {
		dao.update(pacVO);
	}

	public void deletePac(String pacno) {
		dao.delete(pacno);
	}

	public PacVO getOnePac(String pacno) {
		return dao.findByPrimaryKey(pacno);
	}

	public List<PacVO> getAll() {
		return dao.getAll();
	}
}
