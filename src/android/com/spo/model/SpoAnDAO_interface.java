package android.com.spo.model;

import java.util.List;

public interface SpoAnDAO_interface {
	//5種方法前台不使用
//	void add(SpoAnVO spot);
//	void update(SpoAnVO spot);
//	void delete(String spono);
//	List<SpoAnVO> findByCity(String spocity);
//	List<SpoAnVO> findByClass(String spoclass);
	
	//
	SpoAnVO findByPk(String spono);
	List<SpoAnVO> getAll();
	byte[] getImg(String spono);
}
