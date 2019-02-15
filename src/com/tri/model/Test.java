package com.tri.model;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spo.model.SpoDAO;
import com.spo.model.SpoVO;

import java.sql.Date;
import java.util.List;

@WebServlet("/Test")
public class Test extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
//------測試Trip------
		
//		TriDAO tdao = new TriDAO();
//		TriVO t1 = new TriVO();
//		t1.setMemno("MEM000001");
//		t1.setTriname("桃園好好玩3");
//		t1.setTribegdate(Date.valueOf("2019-11-11"));
//		t1.setTrienddate(Date.valueOf("2019-11-12"));
//		t1.setTristat(0);
//		
//		tdao.add(t1);
		
		
//		TriVO t2 = dao.findByPk("TRI000004");
//		
//		t2.setTriname("墾丁123");
//		t2.setTristat(1);
//		
//		tdao.update(t2);
		
//		tdao.delete("TRI000004");
		
//		List<TriVO> list = tdao.getAll();
//		for(TriVO trip : list) {
//			System.out.println(trip.getTrino());
//			System.out.println(trip.getMemno());
//			System.out.println(trip.getTriname());
//			System.out.println(trip.getTribegdate());
//			System.out.println(trip.getTrienddate());
//			System.out.println(trip.getTripeonum());
//			System.out.println(trip.getTristat());
//			System.out.println(trip.getTriremark());
//		}
		
//------測試Spot------
		
		SpoDAO sdao = new SpoDAO();
//		SpoVO s1 = new SpoVO();
//		s1.setSponame("淡水老街");
//		s1.setSpoclass("景點");
//		s1.setSpocon("台灣");
//		s1.setSpocity("台北市");
//		s1.setSpolat(121.3258);
//		s1.setSpolong(23.5542);
//		s1.setSpoaddr("淡水");
//		File file = new File("D:/pic/123.jpg");
//		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
//		ByteArrayOutputStream bos = new ByteArrayOutputStream();
//		byte[] b = new byte[8192];
//		int i;
//		while((i = bis.read(b)) != -1) {
//			bos.write(b);
//		}
//		bos.close();
//		bis.close();
//		s1.setSpopic(bos.toByteArray());
//		s1.setSpoattribute(0);
//		
//		sdao.add(s1);
		
//		SpoVO s2 = sdao.findByPk("SPO000022");
//		s2.setSponame("淡水老街2");
//		s2.setSpocon("Taiwan");
		
//		sdao.update(s2);
		
		List<SpoVO> s3 = sdao.findByCity("台北市");
		for(SpoVO spo : s3) {
			System.out.println(spo.getSpono());
			System.out.println(spo.getSponame());
			System.out.println(spo.getSpoclass());
			System.out.println(spo.getSpocon());
			System.out.println(spo.getSpocity());
			System.out.println(spo.getSpolat());
			System.out.println(spo.getSpolong());
			System.out.println(spo.getSpoaddr());
			System.out.println(spo.getSpoattribute());
		}
		
		System.out.println("----------景點搜尋----------");
		
		List<SpoVO> s4 = sdao.findByClass("景點");
		for(SpoVO spot : s4) {
			System.out.println(spot.getSpono());
			System.out.println(spot.getSponame());
			System.out.println(spot.getSpoclass());
			System.out.println(spot.getSpocon());
			System.out.println(spot.getSpocity());
			System.out.println(spot.getSpolat());
			System.out.println(spot.getSpolong());
			System.out.println(spot.getSpoaddr());
			System.out.println(spot.getSpoattribute());
		}
		
		
//		sdao.delete("SPO000021");
//		
//		List<SpoVO> list = sdao.getAll();
//		for(SpoVO spo : list) {
//			System.out.println(spo.getSpono());
//			System.out.println(spo.getSponame());
//			System.out.println(spo.getSpoclass());
//			System.out.println(spo.getSpocon());
//			System.out.println(spo.getSpocity());
//			System.out.println(spo.getSpolat());
//			System.out.println(spo.getSpolong());
//			System.out.println(spo.getSpoaddr());
//			System.out.println(spo.getSpoattribute());
//		}
		
	}

}
