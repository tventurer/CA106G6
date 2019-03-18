package com.pho.model;

import java.sql.Timestamp;

import android.com.pah.model.PahAnVO;
//此類別用於新增商品，與PahAnVO相同，僅多一變數代表使用者選擇數量
public class PhoPahVO extends PahAnVO{
	
	private Integer phopahquan;
	
	public PhoPahVO(String pahno, String pahname, String pahintro, String pahcontent, Double pahprice,
					String pahcountry, Integer pahnum, java.sql.Date pahstdate, java.sql.Date pahenddate, Timestamp pahdown,
					Integer pahstatus, String empno, Integer phopahquan) {
		
		super(pahno, pahname, pahintro, pahcontent, pahprice,
			  pahcountry, pahnum, pahstdate, pahenddate, pahdown,
			  pahstatus, empno);
		this.phopahquan = phopahquan;
		
	};

	public PhoPahVO(PahAnVO pahAnVO, Integer phopahquan) {
		super(pahAnVO);
		this.phopahquan = phopahquan;
	}
	
	public Integer getPhopahquan() {
		return phopahquan;
	}

	public void setPhopahquan(Integer phopahquan) {
		this.phopahquan = phopahquan;
	}

}
