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
		
		pahCountryVO1.setPahCountry("請選擇");
		pahCountryVO2.setPahCountry("French");
		pahCountryVO3.setPahCountry("Japan");
		pahCountryVO4.setPahCountry("London");
		
		list.add(pahCountryVO1);
		list.add(pahCountryVO2);
		list.add(pahCountryVO3);
		list.add(pahCountryVO4);
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
