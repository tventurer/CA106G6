package com.tod.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tod.model.TodService;
import com.tod.model.TodVO;
import com.tri.model.TriService;
import com.tri.model.TriVO;

public class TodServlet extends HttpServlet {
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if("insert".equals(action)) {
			
			Map<String, String> errorMsgs = new LinkedHashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				//1.接收請求參數,輸入格式的錯誤處理
				String[] pdtName = req.getParameterValues("pdtName");
				if(pdtName.length == 0 || pdtName[0].trim().length() == 0) {
					errorMsgs.put("pdtName", "請至少輸入一項商品名稱!");
				}
				
				String[] pdtPrice = req.getParameterValues("pdtPrice");
				if(pdtName.length == 0 || pdtName[0].trim().length() == 0) {
					errorMsgs.put("pdtPrice", "請至少輸入一項商品價格!");
				}
				
				Date todddl = null;
				try {
					todddl = Date.valueOf(req.getParameter("todddl").trim());
				} catch(IllegalArgumentException ie) {
					errorMsgs.put("todddl", "輸入的日期格式有誤!");
				}
				
				String trino = req.getParameter("trino");
				String whichPage = req.getParameter("whichPage");
				System.out.println("whichPage=" + whichPage);
				
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failure = req.getRequestDispatcher("/backend/tod/addTod.jsp?trino=" + trino + "&whichPage=" + whichPage);
					failure.forward(req, res);
					return;
				}
				
				//組合商品內容成字串
				StringBuffer sb = new StringBuffer();
				for(int i = 0; i < pdtName.length; i++) {
					if(i != 1)
					sb.append("name=" + pdtName[i] + "price=" + pdtPrice[i]);
				}
				
				System.out.println(sb.toString());
				
				//計算總金額
				int todquo = 0;
				for(int i =0; i < pdtPrice.length; i++) {
					if(i != 1)
						todquo += Integer.parseInt(pdtPrice[i]);
				}
				
				System.out.println("todquo:" + todquo);
				
				//2.呼叫model
				TodService todSvc = new TodService();
				//員工
				HttpSession session = req.getSession();
				String empno = (String)session.getAttribute("empno");
				
				todSvc.addTod(req.getParameter("memno"), trino, empno, todquo, todddl, sb.toString(), 0);
				
				//將行程狀態改為2(已報價)
				TriService triSvc = new TriService();
				TriVO triVO = triSvc.getOneTri(trino);
				triSvc.updateTri(triVO.getTriname(), triVO.getTribegdate(), triVO.getTrienddate(), triVO.getTripeonum(), 2, null, trino);
				
				//3.執行成功,進行轉交
				String url = "/backend/tri/listAllTri.jsp?whichPage=" + whichPage;
				if("todstat".equals(req.getParameter("come"))) {
					url = "/backend/tod/listAllTod.jsp";
				}
				System.out.println("url:" + url);
				RequestDispatcher success = req.getRequestDispatcher(url);
				success.forward(req, res);
				
			} catch(Exception e) {
				e.printStackTrace();
				errorMsgs.put("error", "資料新增失敗:" + e.getMessage());
				RequestDispatcher failure = req.getRequestDispatcher("/backend/tod/addTod.jsp");
				failure.forward(req, res);
			}
		}
		
		if("getOneForUpdate".equals(action)) {
			
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			String reqURL = req.getParameter("reqURL");
			
			try {
				
				//1.接收請求參數
				String todno = req.getParameter("todno");
				String whichPage = req.getParameter("whichPage");
				
				//2.呼叫model
				TodService todSvc = new TodService();
				TodVO todVO = todSvc.getOneTod(todno);
				
				//3.執行成功,進行轉交
				req.setAttribute("whichPage", whichPage);
				req.setAttribute("reqURL", reqURL);
				req.setAttribute("todVO", todVO);
				RequestDispatcher success = req.getRequestDispatcher("/backend/tod/updateTod.jsp");
				success.forward(req, res);
				
			} catch(Exception e) {
				errorMsgs.put("error", "無法修改資料:" + e.getMessage());
				RequestDispatcher failure = req.getRequestDispatcher(reqURL);
				failure.forward(req, res);
			}
		}
		
		if("update".equals(action)) {
			
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			String reqURL = req.getParameter("reqURL");
			System.out.println("reqURL=" + reqURL);
			try {
				
				//1.接收請求參數,輸入格式的錯誤處理
				
				String todno = req.getParameter("todno");
				
				String[] pdtName = req.getParameterValues("pdtName");
				for(String name : pdtName) {
					System.out.println(name);
				}
				if(pdtName.length == 0 || pdtName[0].trim().length() == 0) {
					errorMsgs.put("pdtName", "請至少輸入一項商品名稱!");
				}
				
				String[] pdtPrice = req.getParameterValues("pdtPrice");
				for(String price : pdtPrice) {
					System.out.println(price);
				}
				if(pdtName.length == 0 || pdtName[0].trim().length() == 0) {
					errorMsgs.put("pdtPrice", "請至少輸入一項商品價格!");
				}
				
//				Integer todquo = null;
//				try {
//					todquo = Integer.parseInt(req.getParameter("todquo").trim());
//				} catch(NumberFormatException ne) {
//					errorMsgs.put("todquo", "輸入的報價格式有誤!");
//				}
				
				Date todddl = null;
				try {
					todddl = Date.valueOf(req.getParameter("todddl").trim());
				} catch(IllegalArgumentException ie) {
					errorMsgs.put("todddl", "輸入的日期格式有誤!");
				}
				
				Integer todstat = Integer.parseInt(req.getParameter("todstat"));
				
				TodVO todVO = new TodVO();
				todVO.setTodddl(todddl);
				todVO.setTodstat(todstat);
				
				if(!errorMsgs.isEmpty()) {
					req.setAttribute("todVO", todVO);
					RequestDispatcher failure = req.getRequestDispatcher("/backend/tod/updateTod.jsp");
					failure.forward(req, res);
					return;
				}

				//組合商品內容成字串
				StringBuffer sb = new StringBuffer();
				for(int i = 0; i < pdtName.length; i++) {
					if(pdtName[i] != "") {
					sb.append("name=" + pdtName[i].trim() + "price=" + pdtPrice[i].trim());
					}
				}
				
				System.out.println(sb.toString());
				
				//計算總金額
				int todquo = 0;
				for(int i =0; i < pdtPrice.length; i++) {
						if(pdtPrice[i] != "") {
							todquo += Integer.parseInt(pdtPrice[i]);
						}

				}
				
				System.out.println("todquo:" + todquo);
				
				
				//2.呼叫model
				TodService todSvc = new TodService();
				
				System.out.println("todno:" + todno);
				
				//員工
				HttpSession session = req.getSession();
				String empno = (String)session.getAttribute("empno");
				
				todSvc.updateTod(empno, todquo, todddl, sb.toString(), todstat, todno);
				
				//3.執行成功,進行轉交
				RequestDispatcher success = req.getRequestDispatcher("/backend/tod/listAllTod.jsp");
				success.forward(req, res);
				
			} catch(Exception e) {
				e.printStackTrace();
				errorMsgs.put("error", "修改資料失敗:" + e.getMessage());
				RequestDispatcher failure = req.getRequestDispatcher("/backend/tod/updateTod.jsp");
				failure.forward(req, res);
				
			}
		}
		
		if("delete".equals(action)) {
			
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			String reqURL = req.getParameter("reqURL");
			
			try {
				
				//1.接收請求參數
				String todno = req.getParameter("todno");
				
				//2.呼叫model
				TodService todSvc = new TodService();
				todSvc.deleteTod(todno);
				
				//3.執行成功,進行轉交
				RequestDispatcher success = req.getRequestDispatcher(reqURL);
				success.forward(req, res);
				
			} catch(Exception e) {
				errorMsgs.put("error", "資料刪除失敗:" + e.getMessage());
				RequestDispatcher failure = req.getRequestDispatcher(reqURL);
				failure.forward(req, res);
			}
		}
		
		if("displayMemOrder".equals(action)) {
			
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try{
				//1.接收請求參數
				String trino = req.getParameter("trino");
				
				//2.呼叫model
				TodService todSvc = new TodService();
				TodVO todVO = todSvc.getOneTodByTrino(trino);
				
				//3.執行成功,進行轉交
				req.setAttribute("todVO", todVO);
				RequestDispatcher success = req.getRequestDispatcher("/frontend/tod/trip_order.jsp");
				success.forward(req, res);
				
			} catch(Exception e) {
				errorMsgs.put("error", "無法顯示:" + e.getMessage());
				RequestDispatcher failure = req.getRequestDispatcher("/frontend/tri/listTriByMem.jsp");
				failure.forward(req, res);
			}
		}
		
		if("purchasing".equals(action)) {
			
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try{
				//1.接收請求參數,輸入格式的錯誤處理
				String todno = req.getParameter("todno");
				String[] todpurchase = req.getParameterValues("todpurchase");
				if(todpurchase == null || todpurchase.length == 0) {
					errorMsgs.put("todpurchase", "請選擇商品!");
				}
				//先取出原todVO,在錯誤時丟回給原頁面
				TodService todSvc = new TodService();
				TodVO todVO = todSvc.getOneTod(todno);
				
				req.setAttribute("todVO", todVO);
				
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failure = req.getRequestDispatcher("/frontend/tod/trip_order.jsp");
					failure.forward(req, res);
					return;
				}

				//2.呼叫model,將選擇的商品傳到付款頁,待客戶付款後再進行結帳
				
				StringBuffer sb = new StringBuffer();
				for(int i = 0; i < todpurchase.length; i++) {
					sb.append(todpurchase[i]);
				}
				
				System.out.println("sb:" + sb.toString());
				
				//3.執行成功,進行轉交
				req.setAttribute("todpurchase", sb.toString());
				req.setAttribute("todno", todno);
				RequestDispatcher success = req.getRequestDispatcher("/frontend/tod/order.jsp");
				success.forward(req, res);
				
			} catch(Exception e) {
				e.printStackTrace();
				errorMsgs.put("error", "購買失敗:" + e.getMessage());
				RequestDispatcher failure = req.getRequestDispatcher("/frontend/tod/trip_order.jsp");
				failure.forward(req, res);
			}
		}
		
		if("todPay".equals(action)) {
			
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				
				//1.接收請求參數,輸入格式的錯誤處理
				String todowner = req.getParameter("todowner").trim();
				String todownerReg = "^[(\u4e00-\u9fa5)(a-zA-Z)]{1,20}$";
				if(todowner == null || todowner.trim().length() == 0) {
					errorMsgs.put("todowner", "請輸入聯絡人姓名!");
				} else if(todowner.length() > 10) {
					errorMsgs.put("todowner", "輸入的內容過長!");
				} else if(!todowner.trim().matches(todownerReg)) {
					errorMsgs.put("todowner", "請勿輸入錯誤字元!");
				}
				
				String todphone = req.getParameter("todphone").trim();
				String todphoneReg = "^09[0-9]{8}$";
				if(todphone == null || todphone.trim().length() == 0) {
					errorMsgs.put("todphone", "請輸入聯絡手機!");
				} else if(!todphone.trim().matches(todphoneReg)) {
					errorMsgs.put("todphone", "輸入的手機格式有誤!");
				}
				
				String todmail = req.getParameter("todmail").trim();
				if(todmail == null || todmail.trim().length() == 0) {
					errorMsgs.put("todmail", "請輸入e-mail!");
				}
				
				String todvisa0 = req.getParameter("todvisa0");
				String todvisa1 = req.getParameter("todvisa1");
				String todvisa2 = req.getParameter("todvisa2");
				String todvisa3 = req.getParameter("todvisa3");
				String todvisaReg = "^[0-9]{16}$";
				StringBuffer sb = new StringBuffer()
								.append(todvisa0)
								.append(todvisa1)
								.append(todvisa2)
								.append(todvisa3);
				if(!sb.toString().matches(todvisaReg)) {
					errorMsgs.put("todvisa", "輸入的信用卡格式有誤!");
				}
				
				String todno = req.getParameter("todno");
				String todpurchase = req.getParameter("todpurchase");
				
				if(!errorMsgs.isEmpty()) {
					req.setAttribute("todno", todno);
					req.setAttribute("todpurchase", todpurchase);
					RequestDispatcher failure = req.getRequestDispatcher("/frontend/tod/order.jsp");
					failure.forward(req, res);
					return;
				}
				
				//2.呼叫model(toBuy方法拿到的VO只有購買資訊)
				TodService todSvc = new TodService();
				todSvc.todBuy(todowner, todphone, todmail, todpurchase, todno);
				
				//將訂單狀態改為1(已付款待出貨)
				TodVO todVO = todSvc.getOneTod(todno);
				System.out.println(todVO.getTodpurchase()+"aaaaaaaaaaaa");
				todSvc.updateTod(todVO.getEmpno(), todVO.getTodquo(), todVO.getTodddl(), todVO.getTodremark(), 1, todno);
				
				//3.執行成功,進行轉交
				RequestDispatcher success = req.getRequestDispatcher("/frontend/tod/success_buy.jsp");
				success.forward(req, res);
				
			} catch(Exception e) {
				errorMsgs.put("error", "購買失敗:" + e.getMessage());
				RequestDispatcher failure = req.getRequestDispatcher("/frontend/tod/order.jsp");
				failure.forward(req, res);
			}
		}
		
		if("getOneForCheckOrder".equals(action)) {
			
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				//1.接收請求參數
				String todno = req.getParameter("todno");
				
				//2.呼叫model
				TodService todSvc = new TodService();
				TodVO todVO = todSvc.findPurContent(todno);
				
				//3.執行成功,進行轉交
				req.setAttribute("todVO", todVO);
				RequestDispatcher success = req.getRequestDispatcher("/backend/tod/check_order.jsp");
				success.forward(req, res);
				
			} catch(Exception e) {
				errorMsgs.put("error", "查詢失敗:" + e.getMessage());
				RequestDispatcher failure = req.getRequestDispatcher("/backend/tod/listAllByTodstat.jsp");
				failure.forward(req, res);
			}
		}
	}

}
