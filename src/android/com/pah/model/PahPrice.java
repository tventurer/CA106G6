package android.com.pah.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class PahPrice {
	
	public PahPrice() {
		super();
	}
	
	public List<PahPriceVO> getAll(){
		List<PahPriceVO> list = new ArrayList<PahPriceVO>();
		list.add(new PahPriceVO(0));
		list.add(new PahPriceVO(1000));
		list.add(new PahPriceVO(20000));
		list.add(new PahPriceVO(30000));
		list.add(new PahPriceVO(40000));
		list.add(new PahPriceVO(50000));
		list.add(new PahPriceVO(60000));
		list.add(new PahPriceVO(70000));
		list.add(new PahPriceVO(80000));
		list.add(new PahPriceVO(90000));
		list.add(new PahPriceVO(100000));
		return list;
	}
	
	public class PahPriceVO implements Serializable{
		private Integer pahPrice;
		
		public PahPriceVO(Integer pahPrice) {
			this.pahPrice = pahPrice;
		}
		
		public Integer getPahPrice() {
			return pahPrice;
		}

		public void setPahCountry(Integer pahPrice) {
			this.pahPrice = pahPrice;
		}
	
	}
	
}
