package com.acr.model;

import java.util.List;

public class TestAcrDAO {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//測試AcrJDBCDAO
		AcrJDBCDAO dao = new AcrJDBCDAO();
		
		//測試AcrJNDIDAO(去網頁跑)
	   // AcrJNDIDAO dao = new AcrJNDIDAO();
		
		//新增
//		AcrVO acrVO1 = new AcrVO();
//		acrVO1.setMemno("MEM000001");
//		acrVO1.setAcrprice(6000);
//		acrVO1.setAcrsource(1);
//		acrVO1.setAcrend("儲值");
//		acrVO1.setAcrtotal(6000);
//		dao.insert(acrVO1);
		
		//修改
//		AcrVO acrVO2 = new AcrVO();
//		acrVO2.setMemno("MEM000001");
//		acrVO2.setAcrprice(601515);
//		acrVO2.setAcrsource(0);
//		acrVO2.setAcrend("匯出");
//		acrVO2.setAcrtotal(333);
//		acrVO2.setAcrid("ACR000011");
//		dao.update(acrVO2);
		
		//刪除
//		dao.delete("ACR000012");
		
		//查詢(單筆)
//		AcrVO acrVO3 = dao.findByPrimaryKey("ACR000001");
//		System.out.print(acrVO3.getAcrid() + ",");
//		System.out.print(acrVO3.getMemno() + ",");
//		System.out.print(acrVO3.getAcrtime() + ",");
//		System.out.print(acrVO3.getAcrprice() + ",");
//		System.out.print(acrVO3.getAcrsource() + ",");
//		System.out.print(acrVO3.getAcrend() + ",");
//		System.out.println(acrVO3.getAcrtotal());
//		System.out.println("---------------------");

		//查詢(多筆)
		List<AcrVO> list = dao.getMemAll("MEM000001");
		for(AcrVO aAcr : list) {
			System.out.print(aAcr.getAcrid() + ",");
			System.out.print(aAcr.getMemno() + ",");
			System.out.print(aAcr.getAcrtime() + ",");
			System.out.print(aAcr.getAcrprice() + ",");
			System.out.print(aAcr.getAcrsource() + ",");
			System.out.print(aAcr.getAcrend() + ",");
			System.out.print(aAcr.getAcrtotal());
			System.out.println();
		}
	}

}
