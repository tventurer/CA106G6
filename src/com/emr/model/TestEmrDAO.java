package com.emr.model;

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

public class TestEmrDAO {
	public static void main(String[] args) {
	
		//測試insert******************************
		EmrVO emrVO = new EmrVO();
		EmrDAO emrDAO = new EmrDAO();

		emrVO.setEmrname("文章分類標籤管理");

		emrDAO.insert(emrVO);
		
		//測試update******************************
//		EmrVO emrVO = new EmrVO();
//		EmrDAO emrDAO = new EmrDAO();
//		InputStream in = null;
//		byte[] buff = null;
//				
//		emrVO.setEmrname("橘子好好吃");
//		emrVO.setEmrno("EMR000017");
//
//		emrDAO.update(emrVO);
		
		//測試delete******************************
//		EmrDAO emrDAO = new EmrDAO();
//
//		emrDAO.delete("EMR000018");

		//測試findByPrimaryKey******************************
//		EmrVO emrVO = new EmrVO();
//		EmrDAO emrDAO = new EmrDAO();
//	
//		emrVO = emrDAO.findByPrimaryKey("EMR000018");
//		
//		System.out.println(emrVO.getEmrno());
//		System.out.println(emrVO.getEmrname());

        //測試getAll******************************
//		EmrDAO emrDAO = new EmrDAO();
//		List<EmrVO> list = new ArrayList<EmrVO>();
//		EmrVO emrVO = null;
//		
//		list = emrDAO.getAll();
//		
//		Iterator ite = list.iterator();
//		while(ite.hasNext()) {
//			emrVO = new EmrVO();
//			emrVO = (EmrVO) ite.next();
//			System.out.println(emrVO.getEmrno());
//			System.out.println(emrVO.getEmrname());
//			System.out.println("========================");
//		}
		
		
	}
}
