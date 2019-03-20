package android.com.pah.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class PahCountry {
	
	public PahCountry() {
		super();
	}
	
	public List<PahCountryVO> getAll(){
		List<PahCountryVO> list = new ArrayList<PahCountryVO>();
		PahCountryVO pahCountryVO1 = new PahCountryVO();
		PahCountryVO pahCountryVO2 = new PahCountryVO();
		PahCountryVO pahCountryVO3 = new PahCountryVO();
		PahCountryVO pahCountryVO4 = new PahCountryVO();
		PahCountryVO pahCountryVO5 = new PahCountryVO();
		PahCountryVO pahCountryVO6 = new PahCountryVO();
		
		pahCountryVO1.setPahCountry("請選擇");
		pahCountryVO2.setPahCountry("法國");
		pahCountryVO3.setPahCountry("日本");
		pahCountryVO4.setPahCountry("俄羅斯");
		pahCountryVO5.setPahCountry("英國");
		pahCountryVO6.setPahCountry("埃及");
		
		list.add(pahCountryVO1);
		list.add(pahCountryVO2);
		list.add(pahCountryVO3);
		list.add(pahCountryVO4);
		list.add(pahCountryVO5);
		list.add(pahCountryVO6);
		return list;
	}
	
	public class PahCountryVO implements Serializable{
		private String pahCountry;
		
		public PahCountryVO() {
			
		}
		
		public String getPahCountry() {
			return pahCountry;
		}

		public void setPahCountry(String pahCountry) {
			this.pahCountry = pahCountry;
		}
	
	}
	
}
