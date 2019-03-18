package com.pah.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;


public class PahService {
	PahDAO_interface dao = null;
	
	public PahService() {
		dao = new PahDAO();
	}
	
	public PahVO addPah(String pahname, String pahintro, String pahcontent,
		Integer pahprice, String pahcountry, Integer pahnum, Date pahstdate,
			Date pahenddate, Timestamp pahdown, Integer pahstatus, byte[] pahpc1,
			byte[] pahpc2, byte[] pahpc3, byte[] pahpc4, byte[] pahpc5, String empno) {
		PahVO pahvo = new PahVO();
		
		pahvo.setPahname(pahname);
		pahvo.setPahintro(pahintro);
		pahvo.setPahcontent(pahcontent);
		pahvo.setPahprice(pahprice);
		pahvo.setPahcountry(pahcountry);
		pahvo.setPahnum(pahnum);
		pahvo.setPahstdate(pahstdate);
		pahvo.setPahenddate(pahenddate);
		pahvo.setPahdown(pahdown);
		pahvo.setPahstatus(pahstatus);
		pahvo.setPahpc1(pahpc1);
		pahvo.setPahpc2(pahpc2);
		pahvo.setPahpc3(pahpc3);
		pahvo.setPahpc4(pahpc4);
		pahvo.setPahpc5(pahpc5);
		pahvo.setEmpno(empno);
		dao.insert(pahvo);
		return pahvo;
	}
	public PahVO updatePah(String pahname, String pahintro, String pahcontent,
	 Integer pahprice, String pahcountry, Integer pahnum,Date pahstdate,
			Date pahenddate, Timestamp pahdown, Integer pahstatus, byte[] pahpc1,
			byte[] pahpc2, byte[] pahpc3, byte[] pahpc4, byte[] pahpc5, String empno, String pahno) {
		PahVO pahvo = new PahVO();
		
		pahvo.setPahno(pahno);
		pahvo.setPahname(pahname);
		pahvo.setPahintro(pahintro);
		pahvo.setPahcontent(pahcontent);
		pahvo.setPahprice(pahprice);
		pahvo.setPahcountry(pahcountry);
		pahvo.setPahnum(pahnum);
		pahvo.setPahstdate(pahstdate);
		pahvo.setPahenddate(pahenddate);
		pahvo.setPahdown(pahdown);
		pahvo.setPahstatus(pahstatus);
		pahvo.setPahpc1(pahpc1);
		pahvo.setPahpc2(pahpc2);
		pahvo.setPahpc3(pahpc3);
		pahvo.setPahpc4(pahpc4);
		pahvo.setPahpc5(pahpc5);
		pahvo.setEmpno(empno);
		dao.update(pahvo);
		return pahvo;
	}
	public void delete(String pahno) {
		dao.delete(pahno);
	}
	public List<PahVO> getall(){
		return dao.getall();
	}
	public PahVO findByPk(String pahno) {
		return dao.findOneByPk(pahno);
	}
	public List<String> getCountry(){
		return dao.getCountry();
	}
	public List<PahVO> getSelectAll(Map<String, String[]> map) {
		return dao.getSelectAll(map);
	}
	public void sellPah(Integer sellNum, String pahno) {
		dao.sellPah(sellNum, pahno);
		return;
	}
	public void updateStatus(Integer status, String pahno) {
		dao.updateStatus(status, pahno);
		return;
	}
}
