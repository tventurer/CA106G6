package com.tde.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.spo.model.SpoService;
import com.spo.model.SpoVO;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import com.tde.model.TdeVO;
import com.tri.model.TriDAO;
import com.tri.model.TriVO;

public class TdeServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		//行程表(方便javascript使用)
		Map<String,List<SpoVO>> dayTripList = (LinkedHashMap<String,List<SpoVO>>)session.getAttribute("dayTripList");
		//先包好tdeVO作為最後送出時使用
		List<TdeVO> tdeVOList = (List<TdeVO>)session.getAttribute("tdeVOList");

		String action = req.getParameter("action");
		
		if("ADD".equals(action)) {
			
			//接收點擊新增時送出的景點名稱,再透過查詢取得景點VO
			String sponame = req.getParameter("sponame");
			String tdedate = req.getParameter("tdedate");
			System.out.println("----------this is for ADD----------");
			System.out.println("本次欲新增的行程表天數:" + tdedate);
			
			SpoService spoSvc = new SpoService();
			SpoVO spoVO = spoSvc.getAllByName(sponame);
			
			//將圖片設為空值,另外處理(效能問題)
			spoVO.setSpopic(null);
			
			//只有在第一次新增時才會建立LinkedHashMap及LinkedList
			if(dayTripList == null) {
				dayTripList = new LinkedHashMap<String,List<SpoVO>>();
				List<SpoVO> tripList = new LinkedList<SpoVO>();
				tripList.add(spoVO);
				dayTripList.put(tdedate, tripList);
			} else {
				if(dayTripList.containsKey(tdedate)) {
					if(!dayTripList.get(tdedate).contains(spoVO)) {
						dayTripList.get(tdedate).add(spoVO);
					}else {
						spoVO = null;  //若行程表內已有該景點則回傳空值
					}
				} else {  //只有在第一次新增該行程天數時才會建立LinkedList
					List<SpoVO> tripList = new LinkedList<SpoVO>();
					tripList.add(spoVO);
					dayTripList.put(tdedate, tripList);
				}
			}

			
			//圖片轉碼Base64
//			byte[] b = spoVO.getSpopic();
//			String encode = Base64.encode(b);
			
			//執行成功,輸出json
			for(String key:dayTripList.keySet()) {
				System.out.println("the Map key name=" + key);
			}
			System.out.println(tdedate + "的行程表數量:" + dayTripList.get(tdedate).size());
			session.setAttribute("dayTripList", dayTripList);
			res.setContentType("text/plain");
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			String outstr = new Gson().toJson(spoVO);
			System.out.println("輸出json字串:" + outstr);
			System.out.println("----------this is end of ADD----------");
			out.write(outstr);
			out.flush();
			out.close();
		}
		
		if("delete".equals(action)) {
			
			//1.接收點擊刪除時送出的請求參數,取得欲刪除的景點順序
			int seq = Integer.parseInt(req.getParameter("seq"));
			String tdedate = req.getParameter("tdedate");
			System.out.println("----------this is for delete----------");
			System.out.println("本次欲刪除的行程表天數:" + tdedate);
			System.out.println("本次欲刪除的行程表順序:" + seq);
			
			//2.找出對應行程表的位置進行刪除(包括移除tdeVOList內的VO)
			List<SpoVO> tripList = dayTripList.get(tdedate);
			String spono = tripList.get(seq).getSpono();
			tripList.remove(seq);
			
			//原寫法tdeVOList.get(i).getTdeseq() == (seq+1)有bug無法完整刪除
			if(tdeVOList != null) {
				for(int i = 0; i < tdeVOList.size(); i++) {
					if(tdeVOList.get(i).getTdedate().equals(tdedate) && tdeVOList.get(i).getSpono().equals(spono)) {
						System.out.println("=============================");
						tdeVOList.remove(tdeVOList.indexOf(tdeVOList.get(i)));
					}
				}
			}
			
			//3.執行成功,輸出json
			System.out.println(tdedate + "的行程表剩餘數量:" + tripList.size());
			session.setAttribute("tripList", tripList);
			res.setContentType("text/plain");
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			String outstr = new Gson().toJson(tripList);
			System.out.println("輸出json字串:" + outstr);
			out.write(outstr);
			System.out.println("----------this is end of delete----------");
			out.flush();
			out.close();
		}
		
		if("makeTdeVO".equals(action)) {
			
			//1.接收點擊天數時送出的請求參數,取得指定天數及輸入時間
			String tdedate = req.getParameter("tdedate");
			String xmlday = req.getParameter("xmlday");
			String whichDate = req.getParameter("whichDate");
			String tdestart = req.getParameter("tdestart");
			String tdefinish = req.getParameter("tdefinish");  //tdefinish=10%3A23+PM&tdefinish=10%3A23+PM
															   //tdestart=09%3A00&tdestart=09%3A30&tdestart=10%3A00
			
			System.out.println("參數tdefinish:" + tdefinish);
			System.out.println("whichDate:" + whichDate);
			
			String encodeStart = URLDecoder.decode(tdestart, "UTF-8");
			String encodeFinish = URLDecoder.decode(tdefinish, "UTF-8");
			
			//從使用者輸入的起始時間及點擊的天數計算是第幾天(whichDate若修改打包過的tdeVO需重新修改時間)(超過10天切字串會有問題
			int dayNum = Integer.parseInt(tdedate.substring(1, 2)) - 1;
			System.out.println("dayNum=" + dayNum);
			Date date = new Date(Date.valueOf(whichDate).getTime() + dayNum*24*60*60*1000);
			System.out.println("Date=" + date);
			
			//時間字串分割
			StringTokenizer stkForStart = new StringTokenizer(encodeStart, "tdestart");
			StringTokenizer stkForFinish = new StringTokenizer(encodeFinish, "tdefinish");
			
			List<String> start = new ArrayList<String>();
			List<String> finish = new ArrayList<String>();
			
			while (stkForStart.hasMoreTokens()) {
				String str = stkForStart.nextToken();
				System.out.println("str" + str);
				String hour;
				if(!str.equals("=&") && !str.equals("=")) {
					hour = String.valueOf((Integer.parseInt(str.substring(1, 3))));

					start.add(date.toString() + " " + hour + ":" + str.substring(4,6) + ":00");
					System.out.println(date.toString() + " " + hour + ":" + str.substring(4,6) + ":00");
				} else {
					start.add("");
				}
			}
			
			System.out.println("起始時間集合大小:" + start.size());
			
			while (stkForFinish.hasMoreTokens()) {
				String str = stkForFinish.nextToken();
				System.out.println("BugStr=" + str);
				String hour;
				if(!str.equals("=&") && !str.equals("=")) {
					hour = String.valueOf((Integer.parseInt(str.substring(1, 3))));
					
					finish.add(date.toString() + " " + hour + ":" + str.substring(4,6) + ":00");
					System.out.println(date.toString() + " " + hour + ":" + str.substring(4,6) + ":00");
				} else {
					finish.add("");
				}
			}
			
			System.out.println("----------this is for makeTdeVO----------");
			System.out.println("本次欲打包的行程表天數:" + tdedate);
			System.out.println("start陣列大小:" + start.size());
			System.out.println("finish陣列大小:" + finish.size());
			
			//2.取出指定天數的行程,包裝tdeVO
			
			if(dayTripList == null) {
				dayTripList = new LinkedHashMap<String,List<SpoVO>>();
			}
			
			List<SpoVO> tripList = dayTripList.get(tdedate);
			//避免下方程式碼NullPointerException
			if(tripList == null) {
				tripList = new LinkedList<SpoVO>();
			}
			//避免下方程式碼NullPointerException
			if(tdeVOList == null) {
				tdeVOList = new ArrayList<TdeVO>();
			}
			
			System.out.println("tripList大小:" + tripList.size());
			
			for(int i = 0; i < tripList.size(); i++) {
				TdeVO tdeVO = new TdeVO();
				tdeVO.setSpono(tripList.get(i).getSpono());
				
				if(start.size() != 0 && start.get(i) != "") {
					tdeVO.setTdestart(Timestamp.valueOf(start.get(i)));
					System.out.println("startTime=" + start.get(i));
				}
				
				if(finish.size() != 0 && finish.get(i) != "") {
					tdeVO.setTdefinish(Timestamp.valueOf(finish.get(i)));
					System.out.println("startTime=" + finish.get(i));
				}
				
				tdeVO.setTdedate(tdedate);
				tdeVO.setTdeseq((i+1));
				
				if(tdeVOList.contains(tdeVO)) {  //##同天同景點需要個別處理
					//作為更新使用者輸入時間
					int index = tdeVOList.indexOf(tdeVO);
					tdeVOList.remove(index);
					tdeVOList.add(index, tdeVO);
				} else {
					tdeVOList.add(tdeVO);
				}
			}
			
			session.setAttribute("tdeVOList", tdeVOList);
			System.out.println("tdeVOList數量:" + tdeVOList.size());
			
			//3.執行成功,輸出指定天數是否為空
			if(tripList != null) {
				System.out.println(tdedate + "的行程表數量:" + tripList.size());
			}

			tdeVOList.stream().forEach(t -> {
				System.out.println("trino=" + t.getTdeno());
				System.out.println("spono=" + t.getSpono());
				System.out.println("tdestart=" + t.getTdestart());
				System.out.println("tdefinish=" + t.getTdefinish());
				System.out.println("tdedate=" + t.getTdedate());
				System.out.println("tdeseq=" + t.getTdeseq());
			});
			
			System.out.println("----------this is end of makeTdeVO----------");
			
			res.setContentType("text/plain");
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			if(!dayTripList.containsKey(xmlday)) {
				out.write("null");
			} else {
				String outstr = new Gson().toJson(tripList);
				System.out.println("輸出json字串:" + outstr);
				out.write(outstr);
			}
			
			out.flush();
			out.close();

		}
//======================================================		
//		if("save".equals(action)) {
//			
//			//將打包好的tdeVO透過DAO新增到資料庫
//			TriDAO dao = new TriDAO();
//			TriVO triVO = (TriVO)session.getAttribute("triVO");
//			
//			System.out.println("=====this is for save=====");
//			
////			triVO.setTristat(1);
//			System.out.println(triVO.getTriname());
//			System.out.println(triVO.getMemno());
//			System.out.println(triVO.getTripeonum());
//			System.out.println(triVO.getTribegdate());
//			System.out.println(triVO.getTristat());
//			
//	
//			dao.insertWithTdes(triVO, tdeVOList);
//			System.out.println("成功新增:" + tdeVOList.size() + "筆");
//				
//			//執行成功,進行轉交
//				
//			res.setContentType("text/plain");
//			res.setCharacterEncoding("UTF-8");
//			PrintWriter out = res.getWriter();			
//			out.write("ok");
//			out.flush();
//			out.close();
//				
//		}
		
		if("submit".equals(action)) {
			
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			
			//取得tdeVOList中的最後天數
			int maxDate = 0;
			for(TdeVO tdeVO : tdeVOList) {
				if(Integer.parseInt(tdeVO.getTdedate().substring(1, 2)) > maxDate) {
					maxDate = Integer.parseInt(tdeVO.getTdedate().substring(1, 2));
				}
			}
			
			
			//將打包好的tdeVO透過DAO新增到資料庫
			TriDAO dao = new TriDAO();
			TriVO triVO = (TriVO)session.getAttribute("triVO");
			
			triVO.setTristat(1);
			
			//計算使用者最後規劃的天數存入triVO
			Date tribegdate = triVO.getTribegdate();
			Date trienddate = new Date(tribegdate.getTime() + (maxDate-1)*24*60*60*1000);
			
			triVO.setTrienddate(trienddate);
			
			System.out.println(triVO.getTriname());
			System.out.println(triVO.getMemno());
			System.out.println(triVO.getTripeonum());
			System.out.println(triVO.getTribegdate());
			System.out.println(triVO.getTrienddate());
			System.out.println(triVO.getTristat());
			
			try {	
				dao.insertWithTdes(triVO, tdeVOList);
				System.out.println("成功新增:" + tdeVOList.size() + "筆");
				
				//執行成功,進行轉交
				RequestDispatcher success = req.getRequestDispatcher("/frontend/tri/finish_trip.jsp");
				success.forward(req, res);
				
			} catch(Exception e) {
				e.printStackTrace();
				errorMsgs.put("error", "無法新增行程明細:" +e.getMessage());
				RequestDispatcher failure = req.getRequestDispatcher("/frontend/tri/build_trip2.jsp");
				failure.forward(req, res);
			}
		}
	}
}
