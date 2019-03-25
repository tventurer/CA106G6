package com.pah.controller;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.pah.model.*;
import com.sun.xml.internal.messaging.saaj.util.Base64;

import oracle.jdbc.OracleResultSetMetaData.SecurityAttribute;

import java.util.List;
import java.util.Map;
import java.util.Set;

@MultipartConfig
public class PahServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		doPost(req, res);
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		SimpleDateFormat spf = new SimpleDateFormat("yyyy-MM-dd");
		
		//搜尋一筆機加酒商品
		if("findByPk".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				//檢查機加酒編號
				String pahno = null;
				try {
					pahno = req.getParameter("pahno");
					if(pahno == null || (pahno.trim()).length() == 0) {
						errorMsgs.add("請輸入機加酒編號");
					}
				}catch(Exception e) {
					errorMsgs.add("請輸入機加酒編號");
				}
				//若有錯誤的話導商品顯示頁面
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failure = req.getRequestDispatcher("/frontend/pah/listgrouppah.jsp");
					failure.forward(req, res);
					return;
				}
				
				//開始查詢資料
				PahService pas = new PahService();
				PahVO pahvo = pas.findByPk(pahno);
				if(pahvo == null) {
					errorMsgs.add("查無資料");
				}
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failure = req.getRequestDispatcher("/frontend/pah/listonepah.jsp");
					failure.forward(req, res);
					return;
				}
				//查詢完成後轉交
				req.setAttribute("pahvo", pahvo);
				RequestDispatcher success = req.getRequestDispatcher("/frontend/pah/listonepah.jsp");
				success.forward(req, res);
				return;
				
			}catch(Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failure = req.getRequestDispatcher("/frontend/pah/listonepah.jsp");
				failure.forward(req, res);
				return;
			}
		}
		
		//搜尋一筆需要修改的機加酒資料
		if("oneUpdatePah".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs",errorMsgs);
			
			try {
				//檢查機加酒編號
				String pahno = null;
				try {
					pahno = req.getParameter("pahno");
					if(pahno == null || (pahno.trim()).length() == 0) {
						errorMsgs.add("請輸入機加酒編號");
					}
				}catch(Exception e) {
					errorMsgs.add("請輸入機加酒編號");
				}
				//若有錯誤的話導回商品列表
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failure = req.getRequestDispatcher("/backend/pah/listallpah.jsp");
					failure.forward(req, res);
					return;
				}
				
				//查詢完成資料傳送到更改資料頁面
				PahService pas = new PahService();
				PahVO pahvo = pas.findByPk(pahno);
				req.setAttribute("pahvo", pahvo);
				RequestDispatcher success = req.getRequestDispatcher("/backend/pah/updatepah.jsp");
				success.forward(req, res);
				return;
				
			}catch(Exception e) {
				
				errorMsgs.add("無法修改資料" + e.getMessage());
				RequestDispatcher failure = req.getRequestDispatcher("/backend/pah/listallpah.jsp");
				failure.forward(req, res);
				return;
			}
		}
	
		//進行商品修改
		if("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			PahService pas = new PahService();
			
			try {
				//機加酒編號無法修改故無需錯誤驗證
				String pahno = req.getParameter("pahno");
				//驗證機加酒名稱3~33個字
				String pahname = null;
				try {
					pahname = req.getParameter("pahname");					
					String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{3,33}$";
					if (pahname == null || pahname.trim().length() == 0) {
						errorMsgs.add("機加酒名稱請勿空白");
					} else if(!pahname.trim().matches(enameReg)) { 
						errorMsgs.add("機加酒名稱: 只能是中、英文字母、數字和_ , 且長度必需在3到33之間");
					}
				}catch(Exception e) {
					errorMsgs.add("機加酒名稱輸入錯誤");
				}
				//驗證簡介
				String pahintro = req.getParameter("pahintro");
				if (pahintro == null || pahintro.trim().length() == 0) {
					errorMsgs.add("機加酒簡介請勿空白");
				}
				//驗證內容
				String pahcontent = req.getParameter("pahcontent");
				if (pahcontent == null || pahcontent.trim().length() == 0) {
					errorMsgs.add("機加酒內容請勿空白");
				}
				//驗證價格
				Integer pahprice = null;
				try {
					pahprice = new Integer(req.getParameter("pahprice").trim());
					if(pahprice<=0){
						errorMsgs.add("價格必須大於0元");
					}
				}catch(Exception e) {
					pahprice = 0;
					errorMsgs.add("價格請填數字");
				}
				//驗證國家
				String pahcountry = req.getParameter("pahcountry");
				if (pahcountry == null || pahcountry.trim().length() == 0) {
					errorMsgs.add("國家請勿空白");
				}
				//驗證數量
				Integer pahnum = null;
				try {
					pahnum = new Integer(req.getParameter("pahnum").trim());
					if(pahnum<0){
						errorMsgs.add("數量必須大於0");
					}
				}catch(Exception e) {
					pahnum = 0;
					errorMsgs.add("數量請填數字");
				}
				//驗證出發日期
				java.sql.Date pahstdate = null;
				try {
					pahstdate = java.sql.Date.valueOf(req.getParameter("pahstdate"));	
				}catch(IllegalArgumentException e) {
					pahstdate = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入出發日期");
				}
				//驗證回程日期
				java.sql.Date pahenddate = null;
				try {
					pahenddate = java.sql.Date.valueOf(req.getParameter("pahenddate"));	
				}catch(IllegalArgumentException e) {
					pahenddate = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入回程日期");
				}
				//驗證下架日期
				java.sql.Timestamp pahdown = null;
				try {
					pahdown = java.sql.Timestamp.valueOf(req.getParameter("pahdown"));	
				}catch(IllegalArgumentException e) {
					pahdown = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入下架時間");
				}
				
				//驗證出發日期早於回程日期
				if(pahenddate.before(pahstdate)) {
					errorMsgs.add("出發時間必須早於回程時間");
				}
				//狀態驗證
				Integer pahstatus=null;
				try {
					pahstatus = new Integer(req.getParameter("pahstatus"));					
					if(pahstatus>1 || pahstatus<0) {
						errorMsgs.add("請輸入正確狀態");
					}
				}catch(Exception e) {
					errorMsgs.add("請輸入狀態");
				}
				//第一張圖
				byte item1[] = pas.findByPk(pahno).getPahpc1();
				try {
					Part part = req.getPart("pahpc1");
					if(part.getSubmittedFileName() != "") {
						BufferedInputStream bif = new BufferedInputStream(part.getInputStream());
						ByteArrayOutputStream bao = new ByteArrayOutputStream();
						int len;
						byte[] b = new byte[8192];
						while((len = bif.read(b)) != -1) {
							bao.write(b);
						}
						item1 = bao.toByteArray();
					}
				}catch(Exception e) {
					errorMsgs.add("上傳照片失敗，請重新上傳");
				}
				//第二張圖
				byte item2[] = pas.findByPk(pahno).getPahpc2();
				try {
					Part part = req.getPart("pahpc2");
					if(part.getSubmittedFileName() != "") {
						BufferedInputStream bif = new BufferedInputStream(part.getInputStream());
						ByteArrayOutputStream bao = new ByteArrayOutputStream();
						int len;
						byte[] b = new byte[8192];
						while((len = bif.read(b)) != -1) {
							bao.write(b);
						}
						item2 = bao.toByteArray();
					}
				}catch(Exception e) {
					errorMsgs.add("上傳照片失敗，請重新上傳");
				}
				//第三張圖
				byte item3[] = pas.findByPk(pahno).getPahpc3();
				try {
					Part part = req.getPart("pahpc3");
					if(part.getSubmittedFileName() != "") {
						BufferedInputStream bif = new BufferedInputStream(part.getInputStream());
						ByteArrayOutputStream bao = new ByteArrayOutputStream();
						int len;
						byte[] b = new byte[8192];
						while((len = bif.read(b)) != -1) {
							bao.write(b);
						}
						item3 = bao.toByteArray();
					}
				}catch(Exception e) {
					errorMsgs.add("上傳照片失敗，請重新上傳");
				}
				//第四張圖
				byte item4[] = pas.findByPk(pahno).getPahpc4();
				try {
					Part part = req.getPart("pahpc4");
					if(part.getSubmittedFileName() != "") {
						BufferedInputStream bif = new BufferedInputStream(part.getInputStream());
						ByteArrayOutputStream bao = new ByteArrayOutputStream();
						int len;
						byte[] b = new byte[8192];
						while((len = bif.read(b)) != -1) {
							bao.write(b);
						}
						item4 = bao.toByteArray();
					}
				}catch(Exception e) {
					errorMsgs.add("上傳照片失敗，請重新上傳");
				}
				//第五張圖
				byte item5[] = pas.findByPk(pahno).getPahpc5();
				try {
					Part part = req.getPart("pahpc5");
					if(part.getSubmittedFileName() != "") {
						BufferedInputStream bif = new BufferedInputStream(part.getInputStream());
						ByteArrayOutputStream bao = new ByteArrayOutputStream();
						int len;
						byte[] b = new byte[8192];
						while((len = bif.read(b)) != -1) {
							bao.write(b);
						}
						item5 = bao.toByteArray();
					}
				}catch(Exception e) {
					errorMsgs.add("上傳照片失敗，請重新上傳");
				}
				//驗證管理員編號
				String empno = null;
				try {
					empno = req.getParameter("empno");
					if(empno == null || (empno.trim()).length() == 0) {
						errorMsgs.add("請輸入管理員編號");
					}
				}catch(Exception e) {
					errorMsgs.add("請輸入管理員編號");
				}
				//包裝資料
				PahVO pahvo = new PahVO();
				pahvo.setPahno(pahno);
				pahvo.setPahname(pahname);
				pahvo.setPahintro(pahintro);
				pahvo.setPahcontent(pahcontent);
				pahvo.setPahprice(pahprice);
				pahvo.setPahcountry(pahcountry);
				pahvo.setPahnum(pahnum);
				pahvo.setPahstdate(pahstdate);
				pahvo.setPahenddate(pahenddate);
				pahvo.setPahdown(pahdown);
				pahvo.setPahstatus(pahstatus);
				pahvo.setPahpc1(item1);
				pahvo.setPahpc2(item2);
				pahvo.setPahpc3(item3);
				pahvo.setPahpc4(item4);
				pahvo.setPahpc5(item5);
				pahvo.setEmpno(empno);
				//失敗轉向
				if(!errorMsgs.isEmpty()) {
					req.setAttribute("pahvo", pahvo);
					RequestDispatcher failure = req.getRequestDispatcher("/backend/pah/updatepah.jsp");
					failure.forward(req, res);
					return;
				}
				
				//成功更改資料
				PahService phs = new PahService();
				phs.updatePah(pahname, pahintro, pahcontent, pahprice, pahcountry, pahnum, pahstdate, pahenddate, pahdown, pahstatus, item1, item2, item3, item4, item5, empno, pahno);
				
				req.setAttribute("sucessUpdate", pahvo);
				RequestDispatcher success = req.getRequestDispatcher("/backend/pah/listallpah.jsp");
				success.forward(req, res);
				return;
				
			}catch(Exception e) {
				errorMsgs.add("修改資料失敗" + e.getMessage());
				RequestDispatcher failure = req.getRequestDispatcher("/backend/pah/updatepah.jsp");
				failure.forward(req, res);
				return;
			}
			
		}
		
		
		if("insert".equals(action)){
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {				
				//驗證機加酒名稱3~33個字
				String pahname = null;
				try {
					pahname = req.getParameter("pahname");					
					String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{3,33}$";
					if (pahname == null || pahname.trim().length() == 0) {
						errorMsgs.add("機加酒名稱請勿空白");
					} else if(!pahname.trim().matches(enameReg)) { 
						errorMsgs.add("機加酒名稱: 只能是中、英文字母、數字和_ , 且長度必需在3到33之間");
					}
				}catch(Exception e) {
					errorMsgs.add("機加酒名稱輸入錯誤");
				}
				//驗證簡介
				String pahintro = req.getParameter("pahintro");
				if (pahintro == null || pahintro.trim().length() == 0) {
					errorMsgs.add("機加酒簡介請勿空白");
				}
				//驗證內容
				String pahcontent = req.getParameter("pahcontent");
				if (pahcontent == null || pahcontent.trim().length() == 0) {
					errorMsgs.add("機加酒內容請勿空白");
				}
				//驗證價格
				Integer pahprice = null;
				try {
					pahprice = new Integer(req.getParameter("pahprice").trim());
					if(pahprice<=0){
						errorMsgs.add("價格必須大於0元");
					}
				}catch(Exception e) {
					pahprice = 0;
					errorMsgs.add("價格請填數字");
				}
				//驗證國家
				String pahcountry = req.getParameter("pahcountry");
				if (pahcountry == null || pahcountry.trim().length() == 0) {
					errorMsgs.add("國家請勿空白");
				}
				//驗證數量
				Integer pahnum = null;
				try {
					pahnum = new Integer(req.getParameter("pahnum").trim());
					if(pahnum<0){
						errorMsgs.add("數量必須大於0");
					}
				}catch(Exception e) {
					pahnum = 0;
					errorMsgs.add("數量請填數字");
				}
				//驗證出發日期
				java.sql.Date pahstdate = null;
				try {
					pahstdate = java.sql.Date.valueOf(req.getParameter("pahstdate"));	
				}catch(IllegalArgumentException e) {
					pahstdate = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入出發日期");
				}
				//驗證回程日期
				java.sql.Date pahenddate = null;
				try {
					pahenddate = java.sql.Date.valueOf(req.getParameter("pahenddate"));	
				}catch(IllegalArgumentException e) {
					pahenddate = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入回程日期");
				}
				//驗證下架日期
				java.sql.Timestamp pahdown = null;
				try {
					pahdown = java.sql.Timestamp.valueOf(req.getParameter("pahdown"));	
				}catch(IllegalArgumentException e) {
					pahdown = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入下架時間");
				}
				
				//驗證出發日期早於回程日期
				if(pahenddate.before(pahstdate)) {
					errorMsgs.add("出發時間必須早於回程時間");
				}
				//狀態驗證
				Integer pahstatus=null;
				try {
					pahstatus = new Integer(req.getParameter("pahstatus"));					
					if(pahstatus>1 || pahstatus<0) {
						errorMsgs.add("請輸入正確狀態");
					}
				}catch(Exception e) {
					errorMsgs.add("請輸入狀態");
				}
				//第一張圖
				byte item1[] = null;
				try {
					Part part = req.getPart("pahpc1");
					if(part.getSubmittedFileName() != "") {
						BufferedInputStream bif = new BufferedInputStream(part.getInputStream());
						ByteArrayOutputStream bao = new ByteArrayOutputStream();
						int len;
						byte[] b = new byte[8192];
						while((len = bif.read(b)) != -1) {
							bao.write(b);
						}
						item1 = bao.toByteArray();
					}
				}catch(Exception e) {
					errorMsgs.add("上傳照片失敗，請重新上傳");
				}
				//第二張圖
				byte item2[] = null;
				try {
					Part part = req.getPart("pahpc2");
					if(part.getSubmittedFileName() != "") {
						BufferedInputStream bif = new BufferedInputStream(part.getInputStream());
						ByteArrayOutputStream bao = new ByteArrayOutputStream();
						int len;
						byte[] b = new byte[8192];
						while((len = bif.read(b)) != -1) {
							bao.write(b);
						}
						item2 = bao.toByteArray();
					}
				}catch(Exception e) {
					errorMsgs.add("上傳照片失敗，請重新上傳");
				}
				//第三張圖
				byte item3[] = null;
				try {
					Part part = req.getPart("pahpc3");
					if(part.getSubmittedFileName() != "") {
						BufferedInputStream bif = new BufferedInputStream(part.getInputStream());
						ByteArrayOutputStream bao = new ByteArrayOutputStream();
						int len;
						byte[] b = new byte[8192];
						while((len = bif.read(b)) != -1) {
							bao.write(b);
						}
						item3 = bao.toByteArray();
					}
				}catch(Exception e) {
					errorMsgs.add("上傳照片失敗，請重新上傳");
				}
				//第四張圖
				byte item4[] = null;
				try {
					Part part = req.getPart("pahpc4");
					if(part.getSubmittedFileName() != "") {
						BufferedInputStream bif = new BufferedInputStream(part.getInputStream());
						ByteArrayOutputStream bao = new ByteArrayOutputStream();
						int len;
						byte[] b = new byte[8192];
						while((len = bif.read(b)) != -1) {
							bao.write(b);
						}
						item4 = bao.toByteArray();
					}
				}catch(Exception e) {
					errorMsgs.add("上傳照片失敗，請重新上傳");
				}
				//第五張圖
				byte item5[] = null;
				try {
					Part part = req.getPart("pahpc5");
					if(part.getSubmittedFileName() != "") {
						BufferedInputStream bif = new BufferedInputStream(part.getInputStream());
						ByteArrayOutputStream bao = new ByteArrayOutputStream();
						int len;
						byte[] b = new byte[8192];
						while((len = bif.read(b)) != -1) {
							bao.write(b);
						}
						item5 = bao.toByteArray();
					}
				}catch(Exception e) {
					errorMsgs.add("上傳照片失敗，請重新上傳");
				}
				//驗證管理員編號
				String empno = null;
				try {
					empno = req.getParameter("empno");
					if(empno == null || (empno.trim()).length() == 0) {
						errorMsgs.add("請輸入管理員編號");
					}
				}catch(Exception e) {
					errorMsgs.add("請輸入管理員編號");
				}
				//包裝資料
				PahVO pahvo = new PahVO();
				pahvo.setPahname(pahname);
				pahvo.setPahintro(pahintro);
				pahvo.setPahcontent(pahcontent);
				pahvo.setPahprice(pahprice);
				pahvo.setPahcountry(pahcountry);
				pahvo.setPahnum(pahnum);
				pahvo.setPahstdate(pahstdate);
				pahvo.setPahenddate(pahenddate);
				pahvo.setPahdown(pahdown);
				pahvo.setPahstatus(pahstatus);
				pahvo.setPahpc1(item1);
				pahvo.setPahpc2(item2);
				pahvo.setPahpc3(item3);
				pahvo.setPahpc4(item4);
				pahvo.setPahpc5(item5);
				pahvo.setEmpno(empno);				
				//失敗轉向
				if(!errorMsgs.isEmpty()) {
					req.setAttribute("pahvo", pahvo);
					RequestDispatcher failure = req.getRequestDispatcher("/backend/pah/addpah.jsp");
					failure.forward(req, res);
					return;
				}
				
				//成功更改資料轉向
				PahService phs = new PahService();
				phs.addPah(pahname, pahintro, pahcontent, pahprice, pahcountry, pahnum, pahstdate, pahenddate, pahdown, pahstatus, item1, item2, item3, item4, item5, empno);
				
				RequestDispatcher success = req.getRequestDispatcher("/backend/pah/listallpah.jsp");
				success.forward(req, res);
				return;
			}catch(Exception e) {
				errorMsgs.add("新增資料失敗，請重新新增");
				RequestDispatcher failure = req.getRequestDispatcher("/backend/pah/addpah.jsp");
				failure.forward(req, res);
				return;
			}
			
			
		}
		
		//刪除商品
		if("delete".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				//檢查機加酒編號
				String pahno = null;
				try {
					pahno = req.getParameter("pahno");
					if(pahno == null || (pahno.trim()).length() == 0) {
						errorMsgs.add("請輸入機加酒編號");
					}
				}catch(Exception e) {
					errorMsgs.add("請輸入機加酒編號");
				}
				//刪除資料
				PahService phs = new PahService();
				phs.delete(pahno);
				//查看資料
				RequestDispatcher success = req.getRequestDispatcher("/backend/pah/.jsp");
				success.forward(req, res);
				return;			
			}catch(Exception e) {
				errorMsgs.add("刪除資料失敗，請重新刪除");
				RequestDispatcher failure = req.getRequestDispatcher("/backend/pah/.jsp");
				failure.forward(req, res);
				return;
			}
		}
			
		//查詢所有商品
		if("getall".equals(action)) {
			List<String> errorMsgs = new LinkedList<>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				PahService phs = new PahService();
				List<PahVO> pahList = phs.getall();
						
				HttpSession session = req.getSession();
				session.setAttribute("pahList", pahList);
				RequestDispatcher success = req.getRequestDispatcher("/frontend/pah/listgrouppah.jsp");
				success.forward(req, res);
				return;
			}catch(Exception e) {
				try {
					HttpSession session = req.getSession();
					session.removeAttribute("pahList");						
				}catch(NullPointerException ne) {
				}
				errorMsgs.add("沒有資料，請重新查詢");
				RequestDispatcher failure = req.getRequestDispatcher("/frontend/pah/listgrouppah.jsp");
				failure.forward(req, res);
				return;
			}
		}
	
		//複合查詢
		if ("listPahBySelect".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			HttpSession session = req.getSession();

			try {
				
				//將輸入資料轉為Map
				HashMap<String, String[]> map = new HashMap<String, String[]>(req.getParameterMap());
								
				//開始複合查詢
				PahService pahSvc = new PahService();
				List<PahVO> pahList  = pahSvc.getSelectAll(map);
				if(pahList.isEmpty()) {
					try{
						session.removeAttribute("pahList");
					}catch(Exception e) {
					}
					errorMsgs.add("無符合條件之商品");
				}
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failure = req.getRequestDispatcher("/frontend/pah/listgrouppah.jsp");
					failure.forward(req, res);
					return;
				}
				
				//查詢完成,準備轉交
				session.setAttribute("pahList", pahList); // 資料庫取出的list物件,存入request
				RequestDispatcher success = req.getRequestDispatcher("/frontend/pah/listgrouppah.jsp"); 
				success.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("查無資料請重新查詢");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/pah/listgrouppah.jsp");
				failureView.forward(req, res);
			}
		}
	}

}
