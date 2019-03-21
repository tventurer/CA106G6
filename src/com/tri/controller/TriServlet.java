package com.tri.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tde.model.TdeService;
import com.tde.model.TdeVO;
import com.tod.model.TodService;
import com.tri.model.TriService;
import com.tri.model.TriVO;

public class TriServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		HttpSession session = req.getSession();
		String city = (String)session.getAttribute("city");
		
		if("displayTri".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				//1.接收請求參數
				String memno = req.getParameter("memno");
				
				//2.呼叫model
				TriService triSvc = new TriService();
				List<TriVO> triList = triSvc.getAllByMemno(memno);
				
				if(triList == null || triList.isEmpty()) {
					errorMsgs.add("查無資料!");
					RequestDispatcher failure = req.getRequestDispatcher("/tri/select_page.jsp");
					failure.forward(req, res);
					return;
				}
				
				//3.執行成功,進行轉交
				req.setAttribute("triList", triList);
				RequestDispatcher success = req.getRequestDispatcher("/tri/listTriByMem.jsp?memno=" + memno);
				success.forward(req, res);
				
			} catch(Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failure = req.getRequestDispatcher("/tri/select_page.jsp");
				failure.forward(req, res);
			}
			
		}
		
		if("setCity".equals(action)) {
			
			city = req.getParameter("city");
			
			session.setAttribute("city", city);
			
		}
		
		if("insert".equals(action)) {
			
			Map<String, String> errorMsgs = new LinkedHashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				//1.接收請求參數,輸入格式錯誤處理
				String triname = req.getParameter("triname").trim();
				if(triname == "" || (triname.trim()).length() == 0) {
					errorMsgs.put("triname","請輸入行程名稱!");
				}
				
				Date tribegdate = null;
				try{
					tribegdate = Date.valueOf(req.getParameter("tribegdate"));
				} catch(IllegalArgumentException ie) {
					errorMsgs.put("tribegdate","請選擇出發日期!");
				}
				
				Date trienddate = null;
				try{
					trienddate = Date.valueOf(req.getParameter("trienddate"));
				} catch(IllegalArgumentException ie) {
					errorMsgs.put("trienddate","請選擇回程日期!");
				}
				
				//未輸入人數預設為1人
				String tripeonum = req.getParameter("tripeonum");
				if(tripeonum == "" || (tripeonum.trim()).length() == 0) {
					tripeonum = "1";
				}
				
				Integer tpn = null;
				try{
					tpn = new Integer(tripeonum);
				} catch(NumberFormatException ne) {
					errorMsgs.put("tripeonum","輸入的人數格式有誤!");
				}
				
				if(city == null) {
					errorMsgs.put("city","請選擇旅遊城市!");
				}
				
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failure = req.getRequestDispatcher("/frontend/tri/build_trip2.jsp");
					failure.forward(req, res);
					return;
				}
				
				//2.建立VO放入session,待行程明細建立完成才送出(需注意會員登入)(String)session.getAttribute("memno")
				TriVO triVO = new TriVO();
				triVO.setMemno((String)session.getAttribute("memno"));//會員
				triVO.setTriname(triname);
				triVO.setTribegdate(tribegdate);
				triVO.setTrienddate(trienddate);
				triVO.setTripeonum(tpn);
				triVO.setTristat(0);
				
				//3.執行成功,進行轉交
				session.setAttribute("triVO", triVO);
				System.out.println("city=" + city);
				RequestDispatcher success = req.getRequestDispatcher("/frontend/tde/tde_map.jsp");
				success.forward(req, res);
				
			} catch(Exception e) {
				errorMsgs.put("error","無法建立行程:"+ e.getMessage());
				e.printStackTrace();
				RequestDispatcher failure = req.getRequestDispatcher("/frontend/tri/build_trip2.jsp");
				failure.forward(req, res);
			}
		}
		
		if("getOneForUpdate".equals(action)) {
			
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);
			String url = null;
			String come = req.getParameter("come");
			String reqURL = req.getParameter("reqURL");
			
			try {
				//1.接收請求參數
				String trino = req.getParameter("trino");
				String whichPage = req.getParameter("whichPage");
				String memno = req.getParameter("memno");
				
				//2.呼叫model
				TriService triSvc = new TriService();
				TriVO triVO = triSvc.getOneTri(trino);
				
				//3.執行成功,進行轉交
				req.setAttribute("triVO", triVO);
				req.setAttribute("whichPage", whichPage);
				
				System.out.println("trino=" + triVO.getTrino());
				
				if(memno != null) {
					req.setAttribute("memno", memno);
				}
				
				//依come參數決定forward路徑
				if("frontend".equals(come)) {
					url = "/frontend/tri/update_trip.jsp";
				} else {
					url = "/backend/tri/update_trip.jsp";
				}
				req.setAttribute("reqURL", reqURL);
				RequestDispatcher success = req.getRequestDispatcher(url);
				success.forward(req, res);
			} catch(Exception e) {
				errorMsgs.put("error","資料無法修改:" + e.getMessage());
				RequestDispatcher failure = req.getRequestDispatcher(url);
				failure.forward(req, res);
			}
		}
		
		if("update".equals(action)) {
			
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);
			String url = null;
			String come = req.getParameter("come");
			
			System.out.println("come:" + come);
			
			String reqURL = req.getParameter("reqURL");
			
			try{
				//1.接收請求參數,輸入格式錯誤處理
				String triname = req.getParameter("triname").trim();
				if(triname == "" || (triname.trim()).length() == 0) {
					errorMsgs.put("triname","請輸入行程名稱!");
				}
				
				Date tribegdate = null;
				try {
					tribegdate = Date.valueOf(req.getParameter("tribegdate"));
				} catch(IllegalArgumentException ie) {
					errorMsgs.put("tribegdate","請選擇出發日期!");
				}
				
				Date trienddate = null;
				try {
					trienddate = Date.valueOf(req.getParameter("trienddate"));
				} catch(IllegalArgumentException ie) {
					errorMsgs.put("trienddate","請選擇回程日期!");
				}
				
				String tripeonum = req.getParameter("tripeonum");
				if(tripeonum == "" || (tripeonum.trim()).length() == 0) {
					tripeonum = "1";
				}
				
				Integer tpn = null;
				try {
					tpn = Integer.parseInt(tripeonum);
				} catch(NumberFormatException ne) {
					errorMsgs.put("tripeonum","輸入的人數格式有誤!");
				}
				
				String trino = req.getParameter("trino");

				TriVO triVO = new TriVO();
				triVO.setTrino(trino);
				triVO.setTriname(triname);
				triVO.setTribegdate(tribegdate);
				triVO.setTrienddate(trienddate);
				triVO.setTripeonum(tpn);
				
				//依come參數決定forward路徑(錯誤頁面)
				if("frontend".equals(come)) {
					url = "/frontend/tri/update_trip.jsp";
				} else {
					url = "/backend/tri/update_trip.jsp";
				}
				
				if(!errorMsgs.isEmpty()) {
					req.setAttribute("triVO", triVO);
					RequestDispatcher failure = req.getRequestDispatcher(url);
					failure.forward(req, res);
					return;
				}
				
				//2.呼叫model
				TriService triSvc = new TriService();
				//維持原行程狀態
				TriVO t = triSvc.getOneTri(trino);
				int tristat = t.getTristat();
				triSvc.updateTri(triname, tribegdate, trienddate, tpn, tristat, null, trino);
				System.out.println("111");
				//3.執行成功,進行轉交
				String memno = req.getParameter("memno");
				String whichPage = req.getParameter("whichPage");
				
//				if(memno != null) {
//					RequestDispatcher success = req.getRequestDispatcher("/tri/listTriByMem.jsp?whichPage=" + whichPage +"&memno=" + memno);
//					success.forward(req, res);
//					return;
//				}
				
				//依come參數決定forward路徑(成功頁面)
				String okUrl = null;
				if("frontend".equals(come)) {
					okUrl = "/frontend/tri/listTriByMem.jsp";
				} else {
					okUrl = reqURL;
				}
				
				RequestDispatcher success = req.getRequestDispatcher(okUrl + "?whichPage=" + whichPage);
				success.forward(req, res);
				
			} catch(Exception e) {
				e.printStackTrace();
				errorMsgs.put("error","資料修改失敗:" + e.getMessage());
				RequestDispatcher failure = req.getRequestDispatcher(url);
				failure.forward(req, res);
			}
			
		}
		
		if("delete".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			String reqURL = req.getParameter("reqURL");
			String whichPage = req.getParameter("whichPage");
			
			System.out.println("reqURL:" + reqURL);
			
			try {
				//1.接收請求參數
				String trino = req.getParameter("trino");
				
				System.out.println("trino" + trino);
				
				//2.呼叫model,刪除需先刪行程明細(還有訂單要刪)************
				TdeService tdeSvc = new TdeService();
				List<TdeVO> triList = tdeSvc.getAllByTri(trino);
				for(TdeVO tdeVO : triList) {
					tdeSvc.deleteTde(tdeVO.getTdeno());
				}
				
				TodService todSvc = new TodService();
				todSvc.deleteTod(todSvc.getOneTodByTrino(trino).getTodno());
				
				TriService triSvc = new TriService();
				triSvc.deleteTri(trino);
				
				//3.執行成功,進行轉交
				String memno = req.getParameter("memno");
				
				if(memno != null) {
					RequestDispatcher success = req.getRequestDispatcher(reqURL + "?whichPage=" + whichPage +"&memno=" + memno);
					success.forward(req, res);
					return;
				}
				
				RequestDispatcher success = req.getRequestDispatcher(reqURL + "?whichPage=" + whichPage);
				success.forward(req, res);
				
			} catch(Exception e) {
				e.printStackTrace();
				errorMsgs.add("無法刪除資料:" + e.getMessage());
				RequestDispatcher failure = req.getRequestDispatcher(reqURL + "?whichPage=" + whichPage);
				failure.forward(req, res);
			}
		}
	}

}
