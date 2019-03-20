package com.pcd.model;
import java.sql.Date;
import java.util.List;
public class PcdService {
	private PcdDAO_interface dao;

	public PcdService() {
		dao = new PcdDAOimpl();
	}

	public PcdVO addPcd(String ptpno ,String memno ,Integer pcdtripmen ,
	Date pcdordday ,Integer pcdmoney ,Integer pcdstatus ,String pcdsecphone ,
	String pcdfamdata ,String pcdmark){
		PcdVO pcdVO = new PcdVO();
		pcdVO.setPtpno(ptpno);
		pcdVO.setMemno(memno);
		pcdVO.setPcdtripmen(pcdtripmen);
		pcdVO.setPcdordday(pcdordday);
		pcdVO.setPcdmoney(pcdmoney);
		pcdVO.setPcdstatus(pcdstatus);
		pcdVO.setPcdsecphone(pcdsecphone);
		pcdVO.setPcdfamdata(pcdfamdata);
		pcdVO.setPcdmark(pcdmark);
		
		dao.insert(pcdVO);
		return pcdVO;
	}

	//預留給 Struts 2 用的
	public void addPac(PcdVO pcdVO) {
		dao.insert(pcdVO);
	}
	
	public PcdVO updatePcd(String pcdno ,String ptpno ,String memno ,Integer pcdtripmen ,
			Date pcdordday ,Integer pcdmoney ,Integer pcdstatus ,String pcdsecphone ,
	String pcdfamdata ,String pcdmark){
		PcdVO pcdVO = new PcdVO();
		
		pcdVO.setPcdno(pcdno);
		pcdVO.setPtpno(ptpno);
		pcdVO.setMemno(memno);
		pcdVO.setPcdtripmen(pcdtripmen);
		pcdVO.setPcdordday(pcdordday);
		pcdVO.setPcdmoney(pcdmoney);
		pcdVO.setPcdstatus(pcdstatus);
		pcdVO.setPcdsecphone(pcdsecphone);
		pcdVO.setPcdfamdata(pcdfamdata);
		pcdVO.setPcdmark(pcdmark);
		dao.update(pcdVO);

		return dao.findByPrimaryKey(pcdno);
	}
	
	//預留給 Struts 2 用的
	public void updatePcd(PcdVO pcdVO) {
		dao.update(pcdVO);
	}

	public void deletePcd(String pcdno) {
		dao.delete(pcdno);
	}

	public PcdVO getOnePcd(String pcdno) {
		return dao.findByPrimaryKey(pcdno);
	}

	public List<PcdVO> getAll() {
		return dao.getAll();
	}

}




	