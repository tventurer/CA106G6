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

import com.rtd.model.RtdDAO;
import com.rtd.model.RtdVO;
import com.rtr.model.RtrDAO;
import com.rtr.model.RtrVO;
import com.spo.model.SpoDAO;
import com.spo.model.SpoVO;
import com.tde.model.TdeDAO;
import com.tde.model.TdeVO;
import com.tod.model.TodDAO;
import com.tod.model.TodVO;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

@WebServlet("/Test")
public class Test extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
//------行程Trip------
		
//		TriDAO tdao = new TriDAO();
//		TriVO t1 = new TriVO();
//		t1.setMemno("MEM000001");
//		t1.setTriname("桃園好好3");
//		t1.setTribegdate(Date.valueOf("2019-11-11"));
//		t1.setTrienddate(Date.valueOf("2019-11-12"));
//		t1.setTristat(0);
//		
//		tdao.add(t1);
		
		
//		TriVO t2 = tdao.findByPk("TRI000004");
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
		
//------景點Spot------
		
//		SpoDAO sdao = new SpoDAO();
//		SpoVO s1 = new SpoVO();
//		s1.setSponame("淡水");
//		s1.setSpoclass("景點");
//		s1.setSpocon("台灣");
//		s1.setSpocity("新北市");
//		s1.setSpolat(121.3258);
//		s1.setSpolong(23.5542);
//		s1.setSpoaddr("tset123");
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
		
//		List<String> list = sdao.showClass();
//		for(String str : list) {
//			System.out.println(str);
//		}
		
//		SpoVO s2 = sdao.findByPk("SPO000022");
//		s2.setSponame("2");
//		s2.setSpocon("Taiwan");
		
//		sdao.update(s2);
		
//		SpoVO s3 = sdao.findByName("123");
//			System.out.println(s3.getSpono());
//			System.out.println(s3.getSponame());
//			System.out.println(s3.getSpoclass());
//			System.out.println(s3.getSpocon());
//			System.out.println(s3.getSpocity());
//			System.out.println(s3.getSpolat());
//			System.out.println(s3.getSpolong());
//			System.out.println(s3.getSpoaddr());
//			System.out.println(s3.getSpoattribute());
		
//		List<SpoVO> s3 = sdao.findByCity("台北市");
//		for(SpoVO spo : s3) {
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
//		
//		System.out.println("----------景點----------");
//		
//		List<SpoVO> s4 = sdao.findByClass("景點");
//		for(SpoVO spot : s4) {
//			System.out.println(spot.getSpono());
//			System.out.println(spot.getSponame());
//			System.out.println(spot.getSpoclass());
//			System.out.println(spot.getSpocon());
//			System.out.println(spot.getSpocity());
//			System.out.println(spot.getSpolat());
//			System.out.println(spot.getSpolong());
//			System.out.println(spot.getSpoaddr());
//			System.out.println(spot.getSpoattribute());
//		}
		
		
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
		
		SpoDAO s5 = new SpoDAO();
		List<String> citys = s5.getCity("台");
		for(String city : citys) {
			System.out.println(city);
		}
		
//------行程明細tde------
		
//		TdeDAO tdao = new TdeDAO();
//		TdeVO t1 = new TdeVO();
//		t1.setTrino("TRI000001");
//		t1.setSpono("SPO000001");
////		t1.setTdestart(Timestamp.valueOf("2019-08-17 08:00:00"));
////		t1.setTdefinish(Timestamp.valueOf("2019-08-17 10:00:00"));
//		t1.setTdestart(null);
//		t1.setTdefinish(null);
//		t1.setTdedate("D1");
//		t1.setTdeseq(1);
//		t1.setTderemark("132");
//		
//		tdao.add(t1);
		
		
//		TdeVO t2 = tdao.findByPk("TDE000004");
//		
//		t2.setTdedate("D123");
//		t2.setTdestart(Timestamp.valueOf("2019-08-17 12:00:00"));
//		t2.setTdefinish(Timestamp.valueOf("2019-08-17 23:00:00"));
//		
//		tdao.update(t2);
		
//		tdao.delete("TDE000005");
		
//		List<TdeVO> list = tdao.findByTri("TRI000001");
//		for(TdeVO tde : list) {
//			System.out.println(tde.getTdeno());
//			System.out.println(tde.getTrino());
//			System.out.println(tde.getSpono());
//			System.out.println(tde.getTdestart());
//			System.out.println(tde.getTdefinish());
//			System.out.println(tde.getTdedate());
//			System.out.println(tde.getTdeseq());
//			System.out.println(tde.getTderemark());
//		}
		
//		List<TdeVO> list = tdao.getAll();
//		for(TdeVO tde : list) {
//			System.out.println(tde.getTdeno());
//			System.out.println(tde.getTrino());
//			System.out.println(tde.getSpono());
//			System.out.println(tde.getTdestart());
//			System.out.println(tde.getTdefinish());
//			System.out.println(tde.getTdedate());
//			System.out.println(tde.getTdeseq());
//			System.out.println(tde.getTderemark());
//		}
		
//------推薦行程rtr------
		
//		RtrDAO rdao = new RtrDAO();
//		RtrVO r1 = new RtrVO();
//		r1.setEmpno("EMP000001");
//		r1.setRtrcon("美國");
//		r1.setRtrcity("休士頓");
//		r1.setRtrdays(5);
//		r1.setRtrpref(0);
//		
//		rdao.add(r1);
		
		
//		RtrVO r2 = rdao.findByPk("RTR000004");
//		
//		r2.setRtrcon("USA");
//		r2.setRtrdays(6);
//
//		rdao.update(r2);
		
//		rdao.delete("RTR000004");
		
//		List<RtrVO> list = rdao.findByCdt("台灣", "台北市", 1, 1);
//		for(RtrVO rtr : list) {
//			System.out.println(rtr.getRtrno());
//			System.out.println(rtr.getEmpno());
//			System.out.println(rtr.getRtrcon());
//			System.out.println(rtr.getRtrcity());
//			System.out.println(rtr.getRtrdays());
//			System.out.println(rtr.getRtrpeonum());
//			System.out.println(rtr.getRtrpref());
//		}
		
//		List<RtrVO> list = rdao.getAll();
//		for(RtrVO rtr : list) {
//			System.out.println(rtr.getRtrno());
//			System.out.println(rtr.getEmpno());
//			System.out.println(rtr.getRtrcon());
//			System.out.println(rtr.getRtrcity());
//			System.out.println(rtr.getRtrdays());
//			System.out.println(rtr.getRtrpeonum());
//			System.out.println(rtr.getRtrpref());
//		}
		
//------推薦行程明細rtd------
		
//		RtdDAO rdao = new RtdDAO();
//		RtdVO r1 = new RtdVO();
//		r1.setRtrno("RTR000001");
//		r1.setSpono("SPO000003");
//		r1.setRtdstart(Timestamp.valueOf("2019-02-14 13:30:00"));
//		r1.setRtdfinish(Timestamp.valueOf("2019-02-14 14:30:00"));
//		r1.setRtddays("D1");
//		r1.setRtdseq(1);
//		
//		rdao.add(r1);
		
		
//		RtdVO r2 = rdao.findByPk("RTD000004");
//		
//		r2.setRtddays("D123");
//		r2.setRtdseq(6);
//
//		rdao.update(r2);
		
//		rdao.delete("RTD000004");
		
//		List<RtdVO> list = rdao.findByRtr("RTR000002");
//		for(RtdVO rtd : list) {
//			System.out.println(rtd.getRtdno());
//			System.out.println(rtd.getRtrno());
//			System.out.println(rtd.getSpono());
//			System.out.println(rtd.getRtdstart());
//			System.out.println(rtd.getRtdfinish());
//			System.out.println(rtd.getRtddays());
//			System.out.println(rtd.getRtdseq());
//		}
		
//		List<RtdVO> list = rdao.getAll();
//		for(RtdVO rtd : list) {
//			System.out.println(rtd.getRtdno());
//			System.out.println(rtd.getRtrno());
//			System.out.println(rtd.getSpono());
//			System.out.println(rtd.getRtdstart());
//			System.out.println(rtd.getRtdfinish());
//			System.out.println(rtd.getRtddays());
//			System.out.println(rtd.getRtdseq());
//		}
		
//------訂單自由行tod------
		
//		TodDAO tdao = new TodDAO();
//		TodVO t1 = new TodVO();
//		t1.setMemno("MEM000003");
//		t1.setTrino("TRI000002");
//		t1.setEmpno("EMP000002");
//		t1.setTodquo(5600);
//		t1.setTodddl(Date.valueOf("2019-05-05"));
//		t1.setToddate(Date.valueOf("2019-05-01"));
//		t1.setTodstat(1);
//		
//		tdao.add(t1);
		
		
//		TodVO t2 = tdao.findByPk("TOD000005");
//		
//		t2.setTodquo(9999);
//		t2.setTodstat(2);
//
//		tdao.update(t2);
		
//		tdao.delete("TOD000005");
//		
//		List<TodVO> list = tdao.getAll();
//		for(TodVO tod : list) {
//			System.out.println(tod.getTodno());
//			System.out.println(tod.getMemno());
//			System.out.println(tod.getTrino());
//			System.out.println(tod.getEmpno());
//			System.out.println(tod.getTodquo());
//			System.out.println(tod.getTodddl());
//			System.out.println(tod.getToddate());
//			System.out.println(tod.getTodremark());
//			System.out.println(tod.getTodstat());
//		}
	}

}
