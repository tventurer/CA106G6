package com.emr.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.emr.model.EmrService;
import com.emr.model.EmrVO;

public class EmrServlet extends HttpServlet {
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
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
				String emrno = req.getParameter("emrno");
				String emrnoReg = "^[E][M][R][0-9]{6}$";
				if(emrno == null || (emrno.trim()).length() == 0) {
					errorMsgs.add("請輸入權限編號");
				}else if(!(emrno.trim()).matches(emrnoReg)) {
					errorMsgs.add("權限編號前三碼需為EMR，後六碼為數字。");
				}
				
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/emr/select_page.jsp");
					failureView.forward(req, res);
					return;
				}
				//2.查詢資料
				EmrService emrSvc = new EmrService();
				EmrVO emrVO = emrSvc.getOneEmr(emrno);
				
				if(emrVO == null) {
					errorMsgs.add("查無資料");
				}
				if(!errorMsgs.isEmpty()){
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/emr/select_page.jsp");
					failureView.forward(req, res);
					return;
				}
				//3.轉交資料
				req.setAttribute("emrVO", emrVO);
				RequestDispatcher successView = req.getRequestDispatcher("/backend/emr/listOneEmr.jsp");
				successView.forward(req, res);
			}catch(Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/emr/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		if("getOne_For_Update".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				//1.接收參數
				String emrno = req.getParameter("emrno");
				//2.查詢資料
				EmrService emrSvc = new EmrService();
				EmrVO emrVO = emrSvc.getOneEmr(emrno);
				//3.查詢轉交
				req.setAttribute("emrVO", emrVO);
				RequestDispatcher successView = req.getRequestDispatcher("/backend/emr/update_emr_input.jsp");
				successView.forward(req, res);
				//錯誤處理
			}catch(Exception e) {
				errorMsgs.add("無法取得要修改的資料" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/emr/listAllEmr.jsp");
				failureView.forward(req, res);
			}
			
		}
		
		if ("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				//1.接收參數
				//權限編號
				String emrno = req.getParameter("emrno");
				//權限名稱
				String emrname = req.getParameter("emrname");
				String emrnameReg = "^[(\u4e00-\u9fa5)(a-zA-Z)]{1,12}$"; 
				if (emrname == null || emrname.trim().length() == 0) { 
					errorMsgs.add("權限名稱: 請勿空白");
				} else if(!emrname.trim().matches(emrnameReg)) {
					errorMsgs.add("權限名稱: 只能是中、英文 , 且長度必需在1到12之間");
	            }
				
				EmrVO emrVO = new EmrVO();
				emrVO.setEmrno(emrno);
				emrVO.setEmrname(emrname);

				
				if(!errorMsgs.isEmpty()) {
					req.setAttribute("emrVO", emrVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/emr/update_emr_input.jsp");
					failureView.forward(req, res);
					return;
				}
				
				//2.更新資料
				EmrService emrSvc = new EmrService();
				emrSvc.updateEmr(emrno, emrname);
				//3.更新後轉交
				req.setAttribute("emrVO", emrVO);
				RequestDispatcher successView = req.getRequestDispatcher("/backend/emr/listOneEmr.jsp");
				successView.forward(req, res);
				
				//其他錯誤
			}
			catch(Exception e){
				errorMsgs.add("資料修改失敗" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/emr/emr");
				failureView.forward(req, res);
			}
		}
		
		if ("insert".equals(action)) { // 來自addEmr.jsp的請求  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				//權限名稱
				String emrname = req.getParameter("emrname");
				String emrnameReg = "^[(\u4e00-\u9fa5)(a-zA-Z)]{1,10}$";
				if (emrname == null || emrname.trim().length() == 0) { //null判斷是加分，其實不用，因為表單沒東西是傳空字串
					errorMsgs.add("權限名稱:請勿空白");
				} else if(!emrname.trim().matches(emrnameReg)) {
					errorMsgs.add("權限名稱: 只能是中、英文 , 且長度必需在1到10之間");
	            }
				
				EmrVO emrVO = new EmrVO();
				emrVO.setEmrname(emrname);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("emrVO", emrVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/emr/addEmr.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				EmrService emrSvc = new EmrService();
				emrVO = emrSvc.addEmr(emrname);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				RequestDispatcher successView = req.getRequestDispatcher("/backend/emr/listAllEmr.jsp");
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("資料新增失敗" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/emr/addEmr.jsp");
				failureView.forward(req, res);
			}
		}
		
		if("delete".equals(action)) {
			List<String> errorMsgs = new LinkedList<>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				String emrno = req.getParameter("emrno");
				
				EmrService emrSvc = new EmrService();
				emrSvc.deleteEmr(emrno);
				
				RequestDispatcher successView = req.getRequestDispatcher("/backend/emr/listAllEmr.jsp");
				successView.forward(req, res);
			}catch(Exception e) {
				errorMsgs.add("資料刪除失敗" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/emr/listAllEmr.jsp");
				failureView.forward(req,  res);
			}
			
		}
		
	}

}
