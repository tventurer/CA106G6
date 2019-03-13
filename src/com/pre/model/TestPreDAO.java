package com.pre.model;

import java.util.List;

import com.por.model.PorVO;

public class TestPreDAO {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//測試PorJDBCDAO
		PreJDBCDAO dao = new PreJDBCDAO();
						
		//測試PreJNDIDAO
		//PreJNDIDAO dao = new PreJNDIDAO();
		
		//新增
//		PreVO preVO1 = new PreVO();
//		preVO1.setMemno("MEM000001");
//		preVO1.setPurid("PUR000003");
//		preVO1.setEmpno("EMP000001");
//		preVO1.setPrecause("代購內容不當");
//		preVO1.setPrestatus(0);
//		preVO1.setPrelabel(11);
//		preVO1.setPreresult(1);
//		dao.insert(preVO1);
		
		//修改
//		PreVO preVO2 = new PreVO();
//		preVO2.setMemno("MEM000001");
//		preVO2.setPurid("PUR000003");
//		preVO2.setEmpno("EMP000001");
//		preVO2.setPrecause("看他不爽");
//		preVO2.setPrestatus(0);
//		preVO2.setPrelabel(11);
//		preVO2.setPreresult(1);
//		preVO2.setPreid("PRE000005");
//		dao.update(preVO2);
		
		//刪除
//		dao.delete("PRE000007");
		
		//查詢(單筆)
//		PreVO preVO3 = dao.findByPrimaryKey("PRE000005");
//		System.out.print(preVO3.getPreid() + ",");
//		System.out.print(preVO3.getMemno() + ",");
//		System.out.print(preVO3.getPurid() + ",");
//		System.out.print(preVO3.getEmpno() + ",");
//		System.out.print(preVO3.getPrecause() + ",");
//		System.out.print(preVO3.getPretime() + ",");
//		System.out.print(preVO3.getPrestatus());
//		System.out.print(preVO3.getPrelabel() + ",");
//		System.out.println(preVO3.getPreresult());
//		System.out.println("---------------------");
	
		//查詢(多筆)
		List<PreVO> list = dao.getAll();
		for(PreVO aPre : list) {
			System.out.print(aPre.getPreid() + ",");
			System.out.print(aPre.getMemno() + ",");
			System.out.print(aPre.getPurid() + ",");
			System.out.print(aPre.getEmpno() + ",");
			System.out.print(aPre.getPrecause() + ",");
			System.out.print(aPre.getPretime() + ",");
			System.out.print(aPre.getPrestatus());
			System.out.print(aPre.getPrelabel() + ",");
			System.out.println(aPre.getPreresult());
			System.out.println();
		}
	}

}
