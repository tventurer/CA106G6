package com.spo.controller;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.spo.model.SpoService;
import com.spo.model.SpoVO;

@MultipartConfig(fileSizeThreshold=1024*1024,
maxFileSize=5*1024*1024, maxRequestSize=5*5*1024*1024)
public class SpoServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("displaySpo".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				// 1.接收請求參數 - 輸入格式的錯誤處理
				String str = req.getParameter("sposearch");
				if (str == "" || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入搜尋內容!");
					RequestDispatcher failure = req.getRequestDispatcher("/spo/select_page.jsp");
					failure.forward(req, res);
					return;
				}

				// 2.呼叫Model
				SpoService spoSvc = new SpoService();
				String srhopt = req.getParameter("srhopt");
				List<SpoVO> spoList = new ArrayList<SpoVO>();
				if ("spocity".equals(srhopt)) {
					spoList = spoSvc.getAllByCity(str);
				}
				else if("sponame".equals(srhopt)) {
					SpoVO spoVO = spoSvc.getAllByName(str);
					if(spoVO.getSpono() != null)
						spoList.add(spoVO);
				}

				if (spoList.size() == 0 || spoList.isEmpty()) {
					errorMsgs.add("查無資料!");
					RequestDispatcher failure = req.getRequestDispatcher("/spo/select_page.jsp");
					failure.forward(req, res);
					return;
				}

				// 3.執行成功,進行轉交
				req.setAttribute("spoList", spoList);
				RequestDispatcher success = req.getRequestDispatcher("/spo/listAllSpo.jsp");
				success.forward(req, res);
				return;

			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failure = req.getRequestDispatcher("/spo/select_page.jsp");
				failure.forward(req, res);
			}
		}
		
		if ("displaySpoByClass".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				// 1.接收請求參數 - 輸入格式的錯誤處理
				String str = req.getParameter("spoclass");
				
				// 2.呼叫Model
				SpoService spoSvc = new SpoService();
				List<SpoVO> spoList = spoSvc.getAllByClass(str);
				
				if (spoList == null || spoList.isEmpty()) {
					errorMsgs.add("查無資料!");
					RequestDispatcher failure = req.getRequestDispatcher("/spo/select_page.jsp");
					failure.forward(req, res);
					return;
				}

				// 3.執行成功,進行轉交
				req.setAttribute("spoList", spoList);
				RequestDispatcher success = req.getRequestDispatcher("/spo/listAllSpo.jsp");
				success.forward(req, res);
				return;

			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failure = req.getRequestDispatcher("/spo/select_page.jsp");
				failure.forward(req, res);
			}
		}
		
		if("insert".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				// 1.接收請求參數 - 輸入格式的錯誤處理
				String sponame = req.getParameter("sponame");
				if(sponame == "" || (sponame.trim()).length() == 0) {
					errorMsgs.add("請輸入景點名稱!");
				}
				
				String spocon = req.getParameter("spocon");
				if(spocon == "" || (spocon.trim()).length() == 0) {
					errorMsgs.add("請輸入景點所在國家!");
				}
				
				String spocity = req.getParameter("spocity");
				if(spocity == "" || (spocity.trim()).length() == 0) {
					errorMsgs.add("請輸入景點所在城市!");
				}
				
				String spoaddr = req.getParameter("spoaddr");
				if(spoaddr == "" || (spoaddr.trim()).length() == 0) {
					errorMsgs.add("請輸入景點地址!");
				}
				
				
				//處理圖片
				
				Part part = req.getPart("spopic");
				BufferedInputStream bis = new BufferedInputStream(part.getInputStream());
				ByteArrayOutputStream bos = new ByteArrayOutputStream();
				byte[] b = new byte[8192];
				int i;
				while((i = bis.read(b)) != -1) {
					bos.write(b);
				}
				byte[] spopic = bos.toByteArray();
				
				//地址轉緯經度
				
				double[] latlong = AddrToLatLong.getLatLong(spoaddr);
				double spolat = latlong[0];
				double spolong = latlong[1];
				
				//將輸入錯誤的資料回傳,以減少user重新輸入
				String spoclass = req.getParameter("spoclass");
				String spocontent = req.getParameter("spocontent");
				
				SpoVO spoVO = new SpoVO();
				spoVO.setSponame(sponame);
				spoVO.setSpoclass(spoclass);
				spoVO.setSpocon(spocon);
				spoVO.setSpocity(spocity);
				spoVO.setSpoaddr(spoaddr);
				spoVO.setSpopic(spopic);
				spoVO.setSpocontent(spocontent);
				
				if(!errorMsgs.isEmpty()) {
					req.setAttribute("spoVO", spoVO);
					RequestDispatcher failure = req.getRequestDispatcher("/spo/addSpo.jsp");
					failure.forward(req, res);
					return;
				}
				
				// 2.呼叫Model
				SpoService spoSvc = new SpoService();
				spoVO = spoSvc.addSpo(sponame, spoclass, spocon, spocity, spolat, spolong, spoaddr, spocontent, spopic, 0);
				
				// 3.執行成功,進行轉交
				RequestDispatcher success = req.getRequestDispatcher("/spo/listAllSpo.jsp");
				success.forward(req, res);
				
			} catch(Exception e) {
				errorMsgs.add("無法新增資料:" + e.getMessage());
				RequestDispatcher failure = req.getRequestDispatcher("/spo/addSpo.jsp");
				failure.forward(req, res);
			}
		}
		
		if("getOneForUpdate".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				//1.接收請求參數
				String spono = req.getParameter("spono");
				String whichPage = req.getParameter("whichPage");
	
				//2.呼叫model
				SpoService spoSvc = new SpoService();
				SpoVO spoVO = spoSvc.getOneSpo(spono);
				
				//3.執行成功,進行轉交
				req.setAttribute("whichPage", whichPage);
				req.setAttribute("spoVO", spoVO);
				RequestDispatcher success = req.getRequestDispatcher("/spo/updateSpo.jsp");
				success.forward(req, res);
				
			} catch(Exception e) {
				errorMsgs.add("資料無法修改" + e.getMessage());
				e.printStackTrace();
				RequestDispatcher failure = req.getRequestDispatcher("/spo/updateSpo.jsp");
				failure.forward(req, res);
			}
		}
		
		if("update".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				//1.接收請求參數-輸入格式的錯誤處理
				String sponame = req.getParameter("sponame");
				if(sponame == "" || (sponame.trim()).length() == 0) {
					errorMsgs.add("請輸入景點名稱!");
				}
				
				String spocon = req.getParameter("spocon");
				if(spocon == "" || (spocon.trim()).length() == 0) {
					errorMsgs.add("請輸入景點所在國家!");
				}
				
				String spocity = req.getParameter("spocity");
				if(spocity == "" || (spocity.trim()).length() == 0) {
					errorMsgs.add("請輸入景點所在城市!");
				}
				
				String spoaddr = req.getParameter("spoaddr");
				if(spoaddr == "" || (spoaddr.trim()).length() == 0) {
					errorMsgs.add("請輸入景點地址!");
				}
				
				//處理圖片
				
				String spono = req.getParameter("spono");
				byte[] spopic = null;
				
				Part part = req.getPart("spopic");
				if(part.getSize() != 0) {
					BufferedInputStream bis = new BufferedInputStream(part.getInputStream());
					ByteArrayOutputStream bos = new ByteArrayOutputStream();
					byte[] b = new byte[8192];
					int i;
					while((i = bis.read(b)) != -1) {
						bos.write(b);
					}
					spopic = bos.toByteArray();
				} else {
					SpoService spoSvc = new SpoService();
					SpoVO spoVO = spoSvc.getOneSpo(spono);
					spopic = spoVO.getSpopic();
				}
				
				//地址轉緯經度
				
				double[] latlong = AddrToLatLong.getLatLong(spoaddr);
				double spolat = latlong[0];
				double spolong = latlong[1];
				
				//將輸入錯誤的資料回傳,以減少user重新輸入
				String spoclass = req.getParameter("spoclass");
				String spocontent = req.getParameter("spocontent");
				SpoVO spoVO = new SpoVO();
				spoVO.setSpono(spono);
				spoVO.setSponame(sponame);
				spoVO.setSpoclass(spoclass);
				spoVO.setSpocon(spocon);
				spoVO.setSpocity(spocity);
				spoVO.setSpoaddr(spoaddr);
				spoVO.setSpopic(spopic);
				spoVO.setSpocontent(spocontent);
				
				if(!errorMsgs.isEmpty()) {
					req.setAttribute("spoVO", spoVO);
					RequestDispatcher failure = req.getRequestDispatcher("/spo/updateSpo.jsp");
					failure.forward(req, res);
					return;
				}
				
				//2.呼叫model
				SpoService spoSvc = new SpoService();
				spoVO = spoSvc.updateSpo(sponame, spoclass, spocon, spocity, spolat, spolong, spoaddr, spocontent, spopic, 0, spono);

				//3.執行成功,進行轉交
				String whichPage = req.getParameter("whichPage");
				req.setAttribute("spoVO", spoVO);
				RequestDispatcher success = req.getRequestDispatcher("/spo/listAllSpo.jsp?whichPage=" + whichPage);
				success.forward(req, res);
				
			} catch(Exception e) {
				errorMsgs.add("資料修改失敗:" + e.getMessage());
				RequestDispatcher failure = req.getRequestDispatcher("/spo/updateSpo.jsp");
				failure.forward(req, res);
			}
		}
		
		if("delete".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				//1.接收請求參數
				String spono = req.getParameter("spono");
				//2.呼叫model
				SpoService spoSvc = new SpoService();
				spoSvc.deleteSpo(spono);
				//3.執行成功,進行轉交
				String whichPage = req.getParameter("whichPage");
				RequestDispatcher success = req.getRequestDispatcher("/spo/listAllSpo.jsp?whichPage=" + whichPage);
				success.forward(req, res);
				
			} catch(Exception e) {
				errorMsgs.add("刪除資料失敗" + e.getMessage());
				RequestDispatcher failure = req.getRequestDispatcher("/spo/updateSpo.jsp");
				failure.forward(req, res);
			}
		}
		
	}

}
