package com.ema.controller;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

import com.ema.model.EmaService;

import com.emp.model.EmpVO;
import com.emr.model.EmrVO;
import com.ema.model.EmaVO;

@MultipartConfig(fileSizeThreshold=1024*1024, maxFileSize=5*1024*1024, maxRequestSize=5*5*1024*1024)
public class EmaServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if("getOne_For_Display".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>(); //錯誤判斷塞訊息是每個if一直跑，用ArrayList塞錯誤訊息應該會比較快，為何使用LinkedList
			req.setAttribute("errorMsgs", errorMsgs); //為什麼errorMsgs物件可以先塞，後面if才用add方法加?是因為errorMsgs物件還沒真的跑完servlet動作就還未放到request內嗎?
			
			try {
				//1.請求參數錯誤處理
				String empno = req.getParameter("empno");
				String emrno = req.getParameter("emrno");
				String empnoReg = "^[E][M][P][0-9]{6}$";
				String emrnoReg = "^[E][M][R][0-9]{6}$";
				if(empno == null || (empno.trim()).length() == 0 || emrno == null || (emrno.trim()).length() == 0) {
					errorMsgs.add("管理員編號或權限編號: 請勿空白");
				}else if(!(empno.trim()).matches(empnoReg) || !(emrno.trim()).matches(emrnoReg)) {
					errorMsgs.add("管理員前三碼需為EMP，後六碼為數字。權限編號前三碼需為EMR，後六碼為數字。");
				}
				
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/ema/select_page.jsp");
					failureView.forward(req, res);
					return;
				}
				//2.查詢資料
				EmaService emaSvc = new EmaService();
				EmaVO emaVO = emaSvc.getOneEma(empno, emrno);
				
				if(emaVO == null) {
					errorMsgs.add("查無資料");
				}
				if(!errorMsgs.isEmpty()){
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/ema/select_page.jsp");
					failureView.forward(req, res);
					return;
				}
				//3.轉交資料
				req.setAttribute("emaVO", emaVO);
				RequestDispatcher successView = req.getRequestDispatcher("/backend/ema/listOneEma.jsp");
				successView.forward(req, res);
			}catch(Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/ema/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		if("getOne_For_Update".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				//1.接收參數
				String empno = req.getParameter("empno");
				String emrno = req.getParameter("emrno");
				//2.查詢資料
				EmaService emaSvc = new EmaService();
				EmaVO emaVO = emaSvc.getOneEma(empno, emrno);
				//3.查詢轉交
				req.setAttribute("emaVO", emaVO);
				RequestDispatcher successView = req.getRequestDispatcher("/backend/ema/update_ema_input.jsp");
				successView.forward(req, res);
				//錯誤處理
			}catch(Exception e) {
				errorMsgs.add("無法取得要修改的資料" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/ema/listAllEma.jsp");
				failureView.forward(req, res);
			}
			
		}
		
		if ("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				//1.接收參數
				//管理員編號與權限編號
				String empno = req.getParameter("empno");
				String emrno = req.getParameter("emrno");

				//權限狀態
				Integer emastate = new Integer(req.getParameter("emastate"));
				
				EmaVO emaVO = new EmaVO();
				emaVO.setEmpno(empno);
				emaVO.setEmrno(emrno);
				emaVO.setEmastate(emastate);

				if(!errorMsgs.isEmpty()) {
					req.setAttribute("emaVO", emaVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/ema/update_ema_input.jsp");
					failureView.forward(req, res);
					return;
				}
				
				//2.更新資料
				EmaService emaSvc = new EmaService();
				emaSvc.updateEma(empno, emrno, emastate);
				//3.更新後轉交
				req.setAttribute("emaVO", emaVO);
				RequestDispatcher successView = req.getRequestDispatcher("/backend/ema/listOneEma.jsp");
				successView.forward(req, res);
				
				//其他錯誤
			}
			catch(Exception e){
				errorMsgs.add("資料修改失敗" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/ema/ema");
				failureView.forward(req, res);
			}
		}
		
		if ("insert".equals(action)) { // 來自addEma.jsp的請求  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				//管理員號碼與權限號碼
				String empno = req.getParameter("empno");
				String emrno = req.getParameter("emrno");
				String empnoReg = "^[E][M][P][(0-9)]{6}$";
				String emrnoReg = "^[E][M][R][(0-9)]{6}$";
				if (empno == null || empno.trim().length() == 0 || emrno == null || emrno.trim().length() == 0) { 
					errorMsgs.add("管理員編號或權限名稱: 請勿空白");
				} else if(!empno.trim().matches(empnoReg) || !emrno.trim().matches(emrnoReg)) { 
					errorMsgs.add("管理員前三碼需為EMP，後六碼為數字。權限編號前三碼需為EMR，後六碼為數字。");
	            }
				//權限狀態
				Integer emastate = new Integer(req.getParameter("emastate"));

				EmaVO emaVO = new EmaVO();
				emaVO.setEmpno(empno);
				emaVO.setEmrno(emrno);
				emaVO.setEmastate(emastate);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("emaVO", emaVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/ema/addEma.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				EmaService emaSvc = new EmaService();
				emaVO = emaSvc.addEma(empno, emrno, emastate);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				RequestDispatcher successView = req.getRequestDispatcher("/backend/ema/listAllEma.jsp"); // 轉交listAllEma.jsp
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("資料新增失敗" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/ema/addEma.jsp");
				failureView.forward(req, res);
			}
		}
		
		if("delete".equals(action)) {
			List<String> errorMsgs = new LinkedList<>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				String empno = req.getParameter("empno");
				String emrno = req.getParameter("emrno");
				
				EmaService emaSvc = new EmaService();
				emaSvc.deleteEma(empno, emrno);
				
				RequestDispatcher successView = req.getRequestDispatcher("/backend/ema/listAllEma.jsp");
				successView.forward(req, res);
			}catch(Exception e) {
				errorMsgs.add("資料刪除失敗" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/ema/listAllEma.jsp");
				failureView.forward(req,  res);
			}	
		}
	
	}

}
