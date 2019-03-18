package com.pho.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pah.model.*;
import com.phd.model.*;
import com.pho.model.*;

import java.util.List;
import java.util.Map;
import java.util.Vector;

public class PhoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		HttpSession session = req.getSession(); 
		
		//訂單資料驗證
		if("insert".equals(action)) {
			boolean error = false;
			try {
				//檢查顧客姓名
				String phoowner = null;
				try {
					phoowner = req.getParameter("phoowner");
					if(phoowner==null || phoowner.trim().length()==0) {
						String nameerrorMsgs = "顧客姓名不得為空白";
						req.setAttribute("nameerrorMsgs", nameerrorMsgs);
						error=true;
					}
				}catch(Exception e) {
					String nameerrorMsgs = "顧客姓名不得為空白";
					req.setAttribute("nameerrorMsgs", nameerrorMsgs);
					error=true;
				}
				//檢查電話號碼
				String phophone = null;
				try {
					phophone = req.getParameter("phophone");
					String cellphoneReg = "^09[0-9]{8}$";
					if(phophone==null || phophone.trim().length()==0) {
						String phoneerrorMsgs = "手機號碼不得為空白";
						req.setAttribute("phoneerrorMsgs", phoneerrorMsgs);
						error=true;
					}else if(!phophone.matches(cellphoneReg)) {
						String phoneerrorMsgs = "手機號碼格式錯誤";
						req.setAttribute("phoneerrorMsgs", phoneerrorMsgs);
						error=true;
					}
				}catch(Exception e) {
					String phoneerrorMsgs = "請重新輸入手機號碼";
					req.setAttribute("phoneerrorMsgs", phoneerrorMsgs);
					error=true;
				}
				//驗證EMAIL
				String phomail = null;
				try {
					phomail = req.getParameter("phomail");
					if(phomail==null || phomail.trim().length()==0) {
						String emailerrorMsgs = "E-mail不得為空白";
						req.setAttribute("emailerrorMsgs", emailerrorMsgs);
						error=true;
					}
				}catch(Exception e) {
					String emailerrorMsgs = "請重新輸入E-mail";
					req.setAttribute("emailerrorMsgs", emailerrorMsgs);
					error=true;
				}
				//驗證信用卡
				String phovisa = null;
				String phovisa0 = null;
				String phovisa1 = null;
				String phovisa2 = null;
				String phovisa3 = null;
				Integer test = null;
				try {
					//錯誤測試
					phovisa0 = req.getParameter("phovisa0").trim();
					phovisa1 = req.getParameter("phovisa1").trim();
					phovisa2 = req.getParameter("phovisa2").trim();
					phovisa3 = req.getParameter("phovisa3").trim();
					test = new Integer(phovisa0);
					phovisa = phovisa0;
					test = new Integer(phovisa1);
					phovisa += phovisa1;
					test = new Integer(phovisa2);
					phovisa += phovisa2;
					test = new Integer(phovisa3);
					phovisa += phovisa3;
					if(phovisa.length() != 16) {
						String carderrorMsgs = "信用卡號碼長度錯誤";
						req.setAttribute("carderrorMsgs", carderrorMsgs);
						error=true;
					}
				}catch(Exception e) {
					String carderrorMsgs = "信用卡號碼為數字";
					req.setAttribute("carderrorMsgs", carderrorMsgs);
					error=true;
				}
				//填入總金額
				int totalbuy=0;
				List<PahVO> buyList = (Vector<PahVO>)session.getAttribute("shoppingcart");
				for(PahVO buy:buyList){
					totalbuy += buy.getPahprice();
				}
				Integer phototal = totalbuy;
				
				//輸入員工編號
				String memno = "MEM000001";
				
				PhoVO phovo = new PhoVO();
				phovo.setPhoowner(phoowner);
				phovo.setPhophone(phophone);
				phovo.setPhomail(phomail);
				phovo.setPhovisa(phovisa);
				phovo.setPhototal(phototal);
				phovo.setMemno(memno);
				
				if(error==true) {
					req.setAttribute("phovo", phovo);
					RequestDispatcher failure = req.getRequestDispatcher("/frontend/pho/order.jsp");
					failure.forward(req, res);
					return;
				}
				
				//輸入訂單明細、扣除商品數量
				List<PhdVO> phdList = new ArrayList<PhdVO>();
				for(PahVO buy:buyList){
					PhdVO phdvo = new PhdVO();
					phdvo.setPhdnum(buy.getPahnum());
					phdvo.setPahno(buy.getPahno());
					phdList.add(phdvo);
				}
				
				//訂單資料寫入資料庫
				PhoService pos = new PhoService();
				pos.addPho(phoowner, phophone, phomail, phovisa, phototal, memno, phdList);
				
				//寄信及sweetalert
				req.setAttribute("sendMail", "sendMail");
				MailService mailservice = new MailService();
				mailservice.sendMail(phomail, "旅遊浪潮T-Venturer-訂單通知", "Hello!  "+ phoowner + "  您好，您的商品訂單已成立，商品將於3天後寄出，謝謝");
				
				session.removeAttribute("shoppingcart");
				RequestDispatcher success = req.getRequestDispatcher("/pah/pahcontrol?action=listPahBySelect");
				success.forward(req, res);
				return;
				
			}catch(Exception e) {
				e.printStackTrace();
				String errorMsg = "訂單成立失敗，請重新再來";
				RequestDispatcher failure = req.getRequestDispatcher("/frontend/pho/order.jsp");
				failure.forward(req, res);
				return;
			}
		}
		
		//查看自己的訂單
		if("listMeOrder".equals(action) || "listMeOrderback".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				String memno = null;
				try {
					memno = req.getParameter("memno");
					if(memno==null || memno.trim().length()==0) {
						errorMsgs.add("會員編號不得為空");
					}
				}catch(Exception e) {
					errorMsgs.add("會員編號不得為空");
				}
				if(!errorMsgs.isEmpty()) {
					if("listMeOrder".equals(action)) {
						RequestDispatcher failure = req.getRequestDispatcher("/frontend/pho/listorder.jsp");
						failure.forward(req, res);
						return;
					}else {
						RequestDispatcher failure = req.getRequestDispatcher("/backend/pho/listallrefund.jsp");
						failure.forward(req, res);
						return;
					}
				}
				//查詢訂單
				PhoService pos = new PhoService();
				List<PhoVO> phoList = pos.getmeorder(memno);
				if(phoList==null || phoList.isEmpty()) {
					errorMsgs.add("查無訂單資料");
				}
				if(!errorMsgs.isEmpty()) {
					if("listMeOrder".equals(action)) {
						RequestDispatcher failure = req.getRequestDispatcher("/frontend/pho/listorder.jsp");
						failure.forward(req, res);
						return;
					}else {
						RequestDispatcher failure = req.getRequestDispatcher("/backend/pho/listallrefund.jsp");
						failure.forward(req, res);
						return;
					}
				}
				
				//包裝訂單及訂單明細
				PhdService pds = new PhdService();
				Map<PhoVO,List<PhdVO>> orderList = new HashMap<PhoVO,List<PhdVO>>();
				for(PhoVO phoVO:phoList) {
					List<PhdVO> phdList = pds.getbyphono(phoVO.getPhono());
					orderList.put(phoVO, phdList);
				}
				
				//查詢成功
				req.setAttribute("orderList", orderList);
				if("listMeOrder".equals(action)) {
					RequestDispatcher success = req.getRequestDispatcher("/frontend/pho/listorder.jsp");
					success.forward(req, res);
					return;
				}else {
					RequestDispatcher success = req.getRequestDispatcher("/backend/pho/listmemorder.jsp");
					success.forward(req, res);
					return;
				}
				
			}catch(Exception e) {
				errorMsgs.add("查無訂單");
				if("listMeOrder".equals(action)) {
					RequestDispatcher failure = req.getRequestDispatcher("/frontend/pho/listorder.jsp");
					failure.forward(req, res);
					return;
				}else {
					RequestDispatcher failure = req.getRequestDispatcher("/backend/pho/listallrefund.jsp");
					failure.forward(req, res);
					return;
				}
			}	
		}
		
		
		//神奇小按鈕
		if("buildOrder".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				PhoVO phovo = new PhoVO();
				phovo.setPhoowner("香蕉");
				phovo.setPhophone("0987878787");
				phovo.setPhomail("bochen9368@gmail.com");
				
				req.setAttribute("phovo", phovo);
				RequestDispatcher success = req.getRequestDispatcher("/frontend/pho/order.jsp");
				success.forward(req, res);
				return;
			}catch(Exception e) {
				errorMsgs.add("神奇小按鈕失效");
				RequestDispatcher failure = req.getRequestDispatcher("/frontend/pho/order.jsp");
				failure.forward(req, res);
				return;
			}
			
		}
		
		
		
		//前台客戶點選申請退貨按鈕
		if("returnPah".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				String phono = req.getParameter("orderID");
				
				PhoService phs = new PhoService();
				PhoVO phoVO = phs.getOnePho(phono);
				phs.changeStatus(2, "", phoVO.getPhono());
				
				RequestDispatcher success = req.getRequestDispatcher("/pho/phocontrol?action=listMeOrder&memno=MEM000001");
				success.forward(req, res);
				return;
				
			}catch(Exception e) {
				errorMsgs.add("退貨申請失效");
				RequestDispatcher failure = req.getRequestDispatcher("/frontend/pho/listorder.jsp");
				failure.forward(req, res);
				return;
			}			
			
		}
		
				
		//拿到一筆需要修改的訂單
		if("getOneUpdate".equals(action) || "getJudge".equals(action)){
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				String phono = req.getParameter("phono");
				
				PhoService phs = new PhoService();
				PhoVO phovo = phs.getOnePho(phono);
				
				PhdService pds = new PhdService();
				List<PhdVO> phdlist = new ArrayList<PhdVO>();
				phdlist = pds.getbyphono(phono);
				
				
				req.setAttribute("phdlist", phdlist);
				req.setAttribute("phovo", phovo);
				if("getOneUpdate".equals(action)) {
					RequestDispatcher success = req.getRequestDispatcher("/backend/pho/updatepho.jsp");
					success.forward(req, res);
					return;					
				}else if("getJudge".equals(action)) {
					RequestDispatcher success = req.getRequestDispatcher("/backend/pho/judgeorder.jsp");
					success.forward(req, res);
					return;
				}
				
			}catch(Exception e) {
				errorMsgs.add("查無訂單");
				if("getOneUpdate".equals(action)) {
					RequestDispatcher failure = req.getRequestDispatcher("/backend/pho/listallrefund.jsp");
					failure.forward(req, res);
					return;					
				}else if("getJudge".equals(action)) {
					RequestDispatcher failure = req.getRequestDispatcher("/backend/pho/judgeorder.jsp");
					failure.forward(req, res);
					return;
				}
			}
		}
		
		
		
		if("update".equals(action) || "judge".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				//訂單編號
				String phono = req.getParameter("phono");
				//檢查顧客姓名
				String phoowner = null;
				try {
					phoowner = req.getParameter("phoowner");
					if(phoowner==null || phoowner.trim().length()==0) {
						errorMsgs.add("顧客姓名不得為空白");
					}
				}catch(Exception e) {
					errorMsgs.add("顧客姓名不得為空白");
				}
				//檢查電話號碼
				String phophone = null;
				try {
					phophone = req.getParameter("phophone");
					String cellphoneReg = "^09[0-9]{8}$";
					if(phophone==null || phophone.trim().length()==0) {
						errorMsgs.add("手機號碼不得為空白");
					}else if(!phophone.matches(cellphoneReg)) {
						errorMsgs.add("手機號碼格式錯誤");
					}
				}catch(Exception e) {
					errorMsgs.add("請重新輸入手機號碼");
				}
				//驗證EMAIL
				String phomail = null;
				try {
					phomail = req.getParameter("phomail");
					if(phomail==null || phomail.trim().length()==0) {
						errorMsgs.add("E-mail不得為空白");
					}
				}catch(Exception e) {
					errorMsgs.add("E-mail不得為空白");
				}
				//訂單成立日期
				java.sql.Date phostdate = java.sql.Date.valueOf(req.getParameter("phostdate"));
				//訂單狀態
				Integer phostatus = Integer.parseInt(req.getParameter("phostatus"));
				//訂單描述
				String phomark = req.getParameter("phomark");
				if(phostatus==4) {
					try {
						if(phomark.equals("")||phomark==null) {
							errorMsgs.add("請說明無法退貨原因");
						}
					}catch(Exception e) {
						errorMsgs.add("請說明無法退貨原因");
					}
				}
				//驗證信用卡
				String phovisa = null;
				String phovisa0 = null;
				String phovisa1 = null;
				String phovisa2 = null;
				String phovisa3 = null;
				Integer test = null;
				try {
					//錯誤測試
					phovisa0 = req.getParameter("phovisa0").trim();
					phovisa1 = req.getParameter("phovisa1").trim();
					phovisa2 = req.getParameter("phovisa2").trim();
					phovisa3 = req.getParameter("phovisa3").trim();
					test = new Integer(phovisa0);
					phovisa = phovisa0;
					test = new Integer(phovisa1);
					phovisa += phovisa1;
					test = new Integer(phovisa2);
					phovisa += phovisa2;
					test = new Integer(phovisa3);
					phovisa += phovisa3;
					if(phovisa.length() != 16) {
						errorMsgs.add("信用卡號碼長度錯誤");
					}
				}catch(Exception e) {
					errorMsgs.add("信用卡號碼為數字");
				}
				//填入總金額
				Integer phototal = null;
				try {
					phototal = Integer.parseInt(req.getParameter("phototal").trim());
				}catch(Exception e) {
					errorMsgs.add("總金額輸入錯誤");
				}
				
				//輸入員工編號
				String memno = null;
				try {
					memno = req.getParameter("memno");
					if(memno==null || memno.trim().length()==0) {
						errorMsgs.add("員工編號不得為空白");
					}
				}catch(Exception e) {
					errorMsgs.add("員工編號不得為空白");
				}
				
				
				//包裝資料
				PhoVO phovo = new PhoVO();
				phovo.setPhono(phono);
				phovo.setPhoowner(phoowner);
				phovo.setPhophone(phophone);
				phovo.setPhomail(phomail);
				phovo.setPhostdate(phostdate);
				phovo.setPhostatus(phostatus);
				phovo.setPhomark(phomark);
				phovo.setPhovisa(phovisa);
				phovo.setPhototal(phototal);
				phovo.setMemno(memno);
				
				//夾帶訂單明細
				PhdService pds = new PhdService();
				List<PhdVO> phdlist = new ArrayList<PhdVO>();
				phdlist = pds.getbyphono(phono);
				
				
				req.setAttribute("phovo", phovo);
				req.setAttribute("phdlist", phdlist);
				//失敗轉向
				if(!errorMsgs.isEmpty()) {
					if("update".equals(action)) {
						RequestDispatcher failure = req.getRequestDispatcher("/backend/pho/updatepho.jsp");
						failure.forward(req, res);
						return;
						
					}else if("judge".equals(action)){
						RequestDispatcher failure = req.getRequestDispatcher("/backend/pho/judgeorder.jsp");
						failure.forward(req, res);
						return;
						
					}
				}
				
				
				//成功更改資料
				PhoService pos = new PhoService();
				pos.updatePho(phoowner, phophone, phomail, phostdate, phostatus, phomark, phovisa, phototal, memno, phono);
				
				RequestDispatcher success = req.getRequestDispatcher("/pho/phocontrol?action=listMeOrderback&memno="+memno);
				success.forward(req, res);
				return;
				
			}catch(Exception e) {
				//拿到來源網址
				String url = req.getServletPath();
				errorMsgs.add("訂單修改失敗");
				if("update".equals(action)) {
					RequestDispatcher failure = req.getRequestDispatcher("/backend/pho/updatepho.jsp");
					failure.forward(req, res);
					return;
					
				}else if("judge".equals(action)){
					RequestDispatcher failure = req.getRequestDispatcher("/backend/pho/judgeorder.jsp");
					failure.forward(req, res);
					return;
					
				}
			}
			
		}
	}

}
