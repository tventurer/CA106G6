package com.ema.model;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class TestEmaDAO {
	public static void main(String[] args) {
	
		//測試insert******************************
		
		EmaVO emaVO = new EmaVO();
		EmaDAO emaDAO = new EmaDAO();

		emaVO.setEmpno("EMP000004");
		emaVO.setEmrno("EMR000001");
		emaVO.setEmastate(1);

		emaDAO.insert(emaVO);
		
		//測試update******************************
//		EmaVO emaVO = new EmaVO();
//		EmaDAO emaDAO = new EmaDAO();
//
//				
//		emaVO.setEmpno("EMP000004");
//		emaVO.setEmrno("EMR000001");
//		emaVO.setEmastate(1);
//
//		emaDAO.update(emaVO);
		
		//測試delete******************************
//		EmaDAO emaDAO = new EmaDAO();
//
//		emaDAO.delete("EMP000004", "EMR000001");

		//測試findByPrimaryKey******************************
//		EmaVO emaVO = new EmaVO();
//		EmaDAO emaDAO = new EmaDAO();
//	
//		emaVO = emaDAO.findByPrimaryKey("EMP000004", "EMR000001");
//		
//		System.out.println(emaVO.getEmpno());
//		System.out.println(emaVO.getEmrno());
//		System.out.println(emaVO.getEmastate());

        //測試getAll******************************
//		EmaDAO emaDAO = new EmaDAO();
//		List<EmaVO> list = new ArrayList<EmaVO>();
//		EmaVO emaVO = null;
//		
//		list = emaDAO.getAll();
//		
//		Iterator ite = list.iterator();
//		while(ite.hasNext()) {
//			emaVO = new EmaVO();
//			emaVO = (EmaVO)ite.next();
//			System.out.println(emaVO.getEmpno());
//			System.out.println(emaVO.getEmrno());
//			System.out.println(emaVO.getEmastate());
//			System.out.println("========================");
//		}
				
	}
}
