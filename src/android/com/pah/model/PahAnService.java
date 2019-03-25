package android.com.pah.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

public class PahAnService {
	PahAnDAO_interface dao = null;
	
	public PahAnService() {
		dao = new PahAnDAO();
	}
	
	//3個方法前台用不到
//	public PahVO addPah(String pahname, String pahintro, String pahcontent,
//		Integer pahpeople, Double pahprice, String pahcountry, Integer pahnum,
//			Date pahstdate, Timestamp pahdown, Integer pahstatus, byte[] pahpc1,
//			byte[] pahpc2, byte[] pahpc3, byte[] pahpc4, byte[] pahpc5, String empno) {
//		PahVO pahvo = new PahVO();
//		
//		pahvo.setPahname(pahname);
//		pahvo.setPahintro(pahintro);
//		pahvo.setPahcontent(pahcontent);
//		pahvo.setPahpeople(pahpeople);
//		pahvo.setPahprice(pahprice);
//		pahvo.setPahcountry(pahcountry);
//		pahvo.setPahnum(pahnum);
//		pahvo.setPahstdate(pahstdate);
//		pahvo.setPahdown(pahdown);
//		pahvo.setPahstatus(pahstatus);
//		pahvo.setPahpc1(pahpc1);
//		pahvo.setPahpc2(pahpc2);
//		pahvo.setPahpc3(pahpc3);
//		pahvo.setPahpc4(pahpc4);
//		pahvo.setPahpc5(pahpc5);
//		pahvo.setEmpno(empno);
//		dao.insert(pahvo);
//		return pahvo;
//	}
//	public PahVO updatePah(String pahname, String pahintro, String pahcontent,
//		Integer pahpeople, Double pahprice, String pahcountry, Integer pahnum,
//			Date pahstdate, Timestamp pahdown, Integer pahstatus, byte[] pahpc1,
//			byte[] pahpc2, byte[] pahpc3, byte[] pahpc4, byte[] pahpc5, String empno, String pahno) {
//		PahVO pahvo = new PahVO();
//		
//		pahvo.setPahno(pahno);
//		pahvo.setPahname(pahname);
//		pahvo.setPahintro(pahintro);
//		pahvo.setPahcontent(pahcontent);
//		pahvo.setPahpeople(pahpeople);
//		pahvo.setPahprice(pahprice);
//		pahvo.setPahcountry(pahcountry);
//		pahvo.setPahnum(pahnum);
//		pahvo.setPahstdate(pahstdate);
//		pahvo.setPahdown(pahdown);
//		pahvo.setPahstatus(pahstatus);
//		pahvo.setPahpc1(pahpc1);
//		pahvo.setPahpc2(pahpc2);
//		pahvo.setPahpc3(pahpc3);
//		pahvo.setPahpc4(pahpc4);
//		pahvo.setPahpc5(pahpc5);
//		pahvo.setEmpno(empno);
//		dao.update(pahvo);
//		return pahvo;
//	}
//	public void delete(String pahno) {
//		dao.delete(pahno);
//	}
	public PahAnVO findByPk(String pahno) {
		return dao.findOneByPk(pahno);
	}
	
	//取出pah表格國家列表
	public List<String> getCountry(){
		return dao.getCountry();
	}
	//取文字資料
	public List<PahAnVO> getAll(){
		return dao.getAll();
	}
	public List<PahAnVO> getAllStatusOk(){
		return dao.getAllStatusOk();
	}
	public List<PahAnVO> findByCountry(String pahcountry){
		return dao.findByCountry(pahcountry);
	}
	public List<PahAnVO> findByPrice(Integer higher,Integer lower){
		return dao.findByPrice(higher, lower);
	}
	public List<PahAnVO> findByDate(Date firstDate,Date lateDate){
		return dao.findByDate(firstDate, lateDate);
	}
	//取單一PK不同欄位圖片資料
	public byte[] getImage1ByPK(String pahno) {
		return dao.findImage1ByPK(pahno);
	}
	public byte[] getImage2ByPK(String pahno) {
		return dao.findImage2ByPK(pahno);
	}
	public byte[] getImage3ByPK(String pahno) {
		return dao.findImage3ByPK(pahno);
	}
	public byte[] getImage4ByPK(String pahno) {
		return dao.findImage4ByPK(pahno);
	}
	public byte[] getImage5ByPK(String pahno) {
		return dao.findImage5ByPK(pahno);
	}
	
	public List<PahAnVO> getAll(Map<String, String[]> map){
		return dao.getAll(map);
	}
	
}
