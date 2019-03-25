package android.com.pah.model;

import java.util.List;
import java.util.Map;
import java.sql.Connection;
import java.sql.Date;

public interface PahAnDAO_interface {
	//3種方法前台用不到
//	public void insert(PahAnVO ItemVO);
//	public void update(PahAnVO ItemVO);
//	public void delete(String pahno);
	
	public PahAnVO findOneByPk(String pahno);
	
	//取出pah表格國家列表
	public List<String> getCountry();
	
	//取文字資料
	public List<PahAnVO> findByCountry(String pahcountry);
	public List<PahAnVO> findByPrice(Integer higher,Integer lower);
	public List<PahAnVO> findByDate(Date firstDate,Date lateDate);
	public List<PahAnVO> getAll();
	public List<PahAnVO> getAllStatusOk();
	
	//取單一PK不同欄位圖片資料
	public byte[] findImage1ByPK(String pahno);
	public byte[] findImage2ByPK(String pahno);
	public byte[] findImage3ByPK(String pahno);
	public byte[] findImage4ByPK(String pahno);
	public byte[] findImage5ByPK(String pahno);
	
	//複合查詢
	public List<PahAnVO> getAll(Map<String, String[]> map);
	
	//新增訂單修改商品數量與狀態用
	public void updatePahNum(String pahno, Integer pahnum, Integer pahstatus, Connection con);
}
