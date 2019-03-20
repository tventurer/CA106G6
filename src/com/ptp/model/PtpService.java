package com.ptp.model;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
public class PtpService {
	private PtpDAO_interface dao;

	public PtpService() {
		dao = new PtpDAOimpl();
	}

	public PtpVO addPtp(String pacno ,Timestamp ptpstart ,Date ptpend ,Date ptpsigndle ,String ptpnotice ,Integer ptpvacancy ,Integer ptpminmen ,Integer ptpmaxmen,Integer ptpstatus,Timestamp ptptimelog) {
//ptpno, pacno, ptpstart, ptpend, ptpsigndle, ptpnotice, ptpvacancy, ptpminmen, ptpmaxmen, ptpstatus, ptptimelog
		PtpVO ptpVO = new PtpVO();
		ptpVO.setPacno(pacno);
		ptpVO.setPtpstart(ptpstart);
		ptpVO.setPtpend(ptpend);
		ptpVO.setPtpsigndle(ptpsigndle);
		ptpVO.setPtpnotice(ptpnotice);
		ptpVO.setPtpvacancy(ptpvacancy);
		ptpVO.setPtpminmen(ptpminmen);
		ptpVO.setPtpmaxmen(ptpmaxmen);
		ptpVO.setPtpstatus(ptpstatus);
		ptpVO.setPtptimelog(ptptimelog);
		
		dao.insert(ptpVO);
		return ptpVO;
	}

	//預留給 Struts 2 用的
	public void addPac(PtpVO ptpVO) {
		dao.insert(ptpVO);
	}
	
	public PtpVO updatePtp(String ptpno ,String pacno ,Timestamp ptpstart ,Date ptpend ,Date ptpsigndle ,String ptpnotice ,Integer ptpvacancy ,
			Integer ptpminmen ,Integer ptpmaxmen,Integer ptpstatus,Timestamp ptptimelog) {
 
		PtpVO ptpVO = new PtpVO();
		
		ptpVO.setPtpno(ptpno);
		ptpVO.setPacno(pacno);
		ptpVO.setPtpstart(ptpstart);
		ptpVO.setPtpend(ptpend);
		ptpVO.setPtpsigndle(ptpsigndle);
		ptpVO.setPtpnotice(ptpnotice);
		ptpVO.setPtpvacancy(ptpvacancy);
		ptpVO.setPtpminmen(ptpminmen);
		ptpVO.setPtpmaxmen(ptpmaxmen);
		ptpVO.setPtpstatus(ptpstatus);
		ptpVO.setPtptimelog(ptptimelog);
		dao.update(ptpVO);

		return dao.findByPrimaryKey(ptpno);
	}
	
	//預留給 Struts 2 用的
	public void updatePtp(PtpVO ptpVO) {
		dao.update(ptpVO);
	}

	public void deletePtp(String ptpno) {
		dao.delete(ptpno);
	}

	public PtpVO getOnePtp(String ptpno) {
		return dao.findByPrimaryKey(ptpno);
	}

	public List<PtpVO> getAll() {
		return dao.getAll();
	}

}




	