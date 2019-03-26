package com.ptp.controller;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.pac.model.PacService;
import com.ptp.model.*;


public class PtpServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String ptpno = req.getParameter("ptpno");
				if (ptpno == null || (ptpno.trim()).length() == 0) {
					errorMsgs.add("請輸入套裝出團編號");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/ptp/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				
				String ptpnoReg= "^[P][T][P]000\\d\\d\\d$";
				if (ptpno == null || ptpno.trim().length() == 0) {
					errorMsgs.add("管理員編號: 請勿空白");
				} else if(!ptpno.toUpperCase().trim().matches(ptpnoReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("管理員編號: 只能是加上PAC六碼數字");
	            }
				
								
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/ptp/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
			
			
				
				/***************************2.開始查詢資料*****************************************/
				PtpService ptpSvc = new PtpService();
				PtpVO ptpVO = ptpSvc.getOnePtp(ptpno);
				if (ptpVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/ptp/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("ptpVO", ptpVO); // 資料庫取出的ptpVO物件,存入req
				String url = "/backend/ptp/listOnePtp.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOnePtp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/ptp/select_page.jsp");
				failureView.forward(req, res);
			}
		}
//-----------------------------
		if ("joinPtp1".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String ptpno = req.getParameter("ptpno");
				if (ptpno == null || (ptpno.trim()).length() == 0) {
					errorMsgs.add("找不到出團內容編號");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/ptp/ptphead.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				
//				String ptpnoReg= "^[P][T][P]000\\d\\d\\d$";
//				if (ptpno == null || ptpno.trim().length() == 0) {
//					errorMsgs.add("管理員編號: 請勿空白");
//				} else if(!ptpno.toUpperCase().trim().matches(ptpnoReg)) { //以下練習正則(規)表示式(regular-expression)
//					errorMsgs.add("管理員編號: 只能是加上PAC六碼數字");
//	            }
//				
								
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/ptp/ptphead.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
			
			
				
				/***************************2.開始查詢資料*****************************************/
				PtpService ptpSvc = new PtpService();
				PtpVO ptpVO = ptpSvc.getOnePtp(ptpno);
				if (ptpVO == null) {
					errorMsgs.add("無出團資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/ptp/pacChoose.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("ptpVO", ptpVO); // 資料庫取出的ptpVO物件,存入req
				String url = "/backend/ptp/pacChoose4.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOnePtp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/ptp/pacChoose.jsp");
				failureView.forward(req, res);
			}
		}
		
		
//---------------------------------------------------------------------------------------------------			
		    if ("getOne_For_UpdateX".equals(action)) { // 來自listAllEmp.jsp 或  /dept/listEmps_ByDeptno.jsp 的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL"); // 送出修改的來源網頁路徑: 可能為【/emp/listAllEmp.jsp】 或  【/dept/listEmps_ByDeptno.jsp】 或 【 /dept/listAllDept.jsp】		
			
			try {
				/***************************1.接收請求參數****************************************/
				String ptpno = req.getParameter("ptpno");
				
				/***************************2.開始查詢資料****************************************/
				PtpService ptpSvc = new PtpService();
				PtpVO ptpVO = ptpSvc.getOnePtp(ptpno);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("ptpVO", ptpVO); // 資料庫取出的empVO物件,存入req
				String url = "/backend/ptp/update_ptp_inputX.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交backend/ptp/update_ptp_inputX.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料取出時失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}
		  //---------------------------------------------------------------------------------------------------			
		    if ("getOne_For_UpdateY".equals(action)) { // 來自listAllEmp.jsp 或  /dept/listEmps_ByDeptno.jsp 的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL"); // 送出修改的來源網頁路徑: 可能為【/emp/listAllEmp.jsp】 或  【/dept/listEmps_ByDeptno.jsp】 或 【 /dept/listAllDept.jsp】		
			
			try {
				/***************************1.接收請求參數****************************************/
				String ptpno = req.getParameter("ptpno");
				
				/***************************2.開始查詢資料****************************************/
				PtpService ptpSvc = new PtpService();
				PtpVO ptpVO = ptpSvc.getOnePtp(ptpno);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("ptpVO", ptpVO); // 資料庫取出的empVO物件,存入req
				String url = "/backend/ptp/update_ptp_inputY.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交update_emp_input.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料取出時失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}
//---------------------------------------------------------------------------------------------------		
		if ("getOne_For_Update".equals(action)) { // 來自listAllPtp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				String ptpno =req.getParameter("ptpno");
				
				/***************************2.開始查詢資料****************************************/
				PtpService ptpSvc = new PtpService();
				PtpVO ptpVO = ptpSvc.getOnePtp(ptpno);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("ptpVO", ptpVO);         // 資料庫取出的ptpVO物件,存入req
				String url = "/backend/ptp/update_ptp_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_ptp_input.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/ptp/listAllPtp.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("update".equals(action)) { // 來自update_ptp_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String ptpno =req.getParameter("ptpno").trim();
//				String ptpnoReg= "^[P][T][P]000\\d\\d\\d$";
					if (ptpno == null || ptpno.trim().length() == 0) {
							errorMsgs.add("套裝行程編號: 請勿空白");
					}
			
				String pacno =req.getParameter("pacno");
				String pacnoReg= "^[P][A][C]000\\d\\d\\d$";
				if (pacno == null || pacno.trim().length() == 0) {
					errorMsgs.add("套裝行程編號: 請勿空白");
				} else if(!pacno.toUpperCase().trim().matches(pacnoReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("套裝行程編號: 只能是加上PAC接六碼數字");
	            }
				
				java.sql.Timestamp ptpstart = null;
				try {
					ptpstart = java.sql.Timestamp.valueOf(req.getParameter("ptpstart").trim());
				} catch (IllegalArgumentException e) {
					ptpstart=new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入出發日期!");
				}
				
				java.sql.Date ptpend = null;
				try {
					ptpend = java.sql.Date.valueOf(req.getParameter("ptpend").trim());
				} catch (IllegalArgumentException e) {
					ptpend=new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入回程日期!");
				}
				
				java.sql.Date ptpsigndle = null;
				try {
					ptpsigndle = java.sql.Date.valueOf(req.getParameter("ptpsigndle").trim());
				} catch (IllegalArgumentException e) {
					ptpsigndle=new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入報名截止日期!");
				}
				String ptpnotice= " 無  ";
				ptpnotice = req.getParameter("ptpnotice");
				if (ptpnotice == null || ptpnotice.trim().length() == 0) {
					errorMsgs.add("異動公告: 請勿空白，或輸入無");
				}
				
				//, , ptpvacancy, , , , ptptimelog
			
				Integer ptpvacancy = 0;
				try {
					ptpvacancy = new Integer(req.getParameter("ptpvacancy"));
				} catch (Exception e) {
					errorMsgs.add("剩餘空位輸入錯誤");
				}
				
				Integer ptpminmen = 0;
				try {
					ptpminmen = new Integer(req.getParameter("ptpminmen"));
				} catch (Exception e) {
					errorMsgs.add("最低出團人數不正確");
				}finally {
					if(ptpminmen==0) {
						errorMsgs.add("最低出團人數不能為0");	
					}
				}
//				
				Integer ptpmaxmen= 0;
				try {
					ptpmaxmen = new Integer(req.getParameter("ptpmaxmen"));
				} catch (Exception e) {
					errorMsgs.add("出團人數上限不正確");
				}finally {
					if(ptpmaxmen==0) {
						errorMsgs.add("出團人數上限不能為0");	
					}
				}
				
				Integer ptpstatus= 0;
				try {
					ptpstatus = new Integer(req.getParameter("ptpstatus"));
				} catch (Exception e) {
					errorMsgs.add("出團狀態不正確");
				}
				
				java.sql.Timestamp ptptimelog = null;
				try {
					ptptimelog = java.sql.Timestamp.valueOf(req.getParameter("ptptimelog").trim());
				} catch (IllegalArgumentException e) {
					ptptimelog=new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入上架日期!");
				}

				PtpVO ptpVO = new PtpVO();
				
				ptpVO.setPtpno(ptpno);
				ptpVO.setPacno(pacno);
				ptpVO.setPtpstart(ptpstart);
				ptpVO.setPtpend(ptpend);
				ptpVO.setPtpsigndle(ptpsigndle);
				ptpVO.setPtpnotice(ptpnotice);
				ptpVO.setPtpvacancy(ptpvacancy);
				ptpVO.setPtpminmen(ptpminmen);
				ptpVO.setPtpmaxmen(ptpmaxmen);
				ptpVO.setPtpstatus(ptpstatus);
				ptpVO.setPtptimelog(ptptimelog);
				
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("ptpVO", ptpVO); // 含有輸入格式錯誤的ptpVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/ptp/update_ptp_input.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				/***************************2.開始修改資料*****************************************/
				PtpService ptpSvc = new PtpService();
				ptpVO = ptpSvc.updatePtp(ptpno ,pacno ,ptpstart ,ptpend ,ptpsigndle ,ptpnotice ,ptpvacancy ,
						ptpminmen ,ptpmaxmen,ptpstatus,ptptimelog);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("ptpVO", ptpVO); // 資料庫update成功後,正確的的ptpVO物件,存入req
				String url = "/backend/ptp/listOnePtp.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOnePtp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/ptp/update_ptp_input.jsp");
				failureView.forward(req, res);
			}
		}
		
if ("updateX".equals(action)) { // 來自update_emp_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL"); // 送出修改的來源網頁路徑: 可能為【/emp/listAllEmp.jsp】 或  【/dept/listEmps_ByDeptno.jsp】 或 【 /dept/listAllDept.jsp】 或 【 /emp/listEmps_ByCompositeQuery.jsp】
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String ptpno = req.getParameter("ptpno").trim();
//				String ptpnoReg= "^[P][T][P]000\\d\\d\\d$";
				if (ptpno == null || ptpno.trim().length() == 0) {
						errorMsgs.add("套裝行程編號: 請勿空白");
				}
		     System.out.println("1111");
			String pacno =req.getParameter("pacno");
			String pacnoReg= "^[P][A][C]000\\d\\d\\d$";
			if (pacno == null || pacno.trim().length() == 0) {
				errorMsgs.add("套裝行程編號: 請勿空白");
			} else if(!pacno.toUpperCase().trim().matches(pacnoReg)) { //以下練習正則(規)表示式(regular-expression)
				errorMsgs.add("套裝行程編號: 只能是加上PAC接六碼數字");
            }
			System.out.println("22");
			java.sql.Timestamp ptpstart = null;
			try {
				ptpstart = java.sql.Timestamp.valueOf(req.getParameter("ptpstart").trim());
			} catch (IllegalArgumentException e) {
				ptpstart=new java.sql.Timestamp(System.currentTimeMillis());
				errorMsgs.add("請輸入出發日期!");
			}
			System.out.println("33");
			java.sql.Date ptpend = null;
			try {
				ptpend = java.sql.Date.valueOf(req.getParameter("ptpend").trim());
			} catch (IllegalArgumentException e) {
				ptpend=new java.sql.Date(System.currentTimeMillis());
				errorMsgs.add("請輸入回程日期!");
			}
			
			System.out.println("44");
			java.sql.Date ptpsigndle = null;
			try {
				ptpsigndle = java.sql.Date.valueOf(req.getParameter("ptpsigndle").trim());
			} catch (IllegalArgumentException e) {
				ptpsigndle=new java.sql.Date(System.currentTimeMillis());
				errorMsgs.add("請輸入報名截止日期!");
			}
			System.out.println("5555");
			String ptpnotice= " 無  ";
			ptpnotice = req.getParameter("ptpnotice");
			if (ptpnotice == null || ptpnotice.trim().length() == 0) {
				errorMsgs.add("異動公告: 請勿空白，或輸入無");
			}
			
			//, , ptpvacancy, , , , ptptimelog
			System.out.println("6666");
			Integer ptpvacancy = 0;
			try {
				ptpvacancy = new Integer(req.getParameter("ptpvacancy"));
			} catch (Exception e) {
				errorMsgs.add("剩餘空位輸入錯誤");
			}
			System.out.println("777");
			Integer ptpminmen = 0;
			try {
				ptpminmen = new Integer(req.getParameter("ptpminmen"));
			} catch (Exception e) {
				errorMsgs.add("最低出團人數不正確");
			}finally {
				if(ptpminmen==0) {
					errorMsgs.add("最低出團人數不能為0");	
				}
			}
			System.out.println("999");
			
			Integer ptpmaxmen= 0;
			try {
				ptpmaxmen = new Integer(req.getParameter("ptpmaxmen"));
			} catch (Exception e) {
				errorMsgs.add("出團人數上限不正確");
			}finally {
				if(ptpmaxmen==0) {
					errorMsgs.add("出團人數上限不能為0");	
				}
			}
			System.out.println("10");
			
			Integer ptpstatus= 0;
			try {
				ptpstatus = new Integer(req.getParameter("ptpstatus"));
			} catch (Exception e) {
				errorMsgs.add("出團狀態不正確");
			}
			
			System.out.println("11");
			java.sql.Timestamp ptptimelog = null;
			try {
				ptptimelog = java.sql.Timestamp.valueOf(req.getParameter("ptptimelog").trim());
			} catch (IllegalArgumentException e) {
				ptptimelog=new java.sql.Timestamp(System.currentTimeMillis());
				errorMsgs.add("請輸入上架日期!");
			}

			System.out.println("12");
			PtpVO ptpVO = new PtpVO();
			
			ptpVO.setPtpno(ptpno);
			ptpVO.setPacno(pacno);
			ptpVO.setPtpstart(ptpstart);
			ptpVO.setPtpend(ptpend);
			ptpVO.setPtpsigndle(ptpsigndle);
			ptpVO.setPtpnotice(ptpnotice);
			ptpVO.setPtpvacancy(ptpvacancy);
			ptpVO.setPtpminmen(ptpminmen);
			ptpVO.setPtpmaxmen(ptpmaxmen);
			ptpVO.setPtpstatus(ptpstatus);
			ptpVO.setPtptimelog(ptptimelog);
			
			System.out.println("13");
			
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("ptpVO", ptpVO); // 含有輸入格式錯誤的ptpVO物件,也存入req
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/ptp/update_ptp_input.jsp");
				failureView.forward(req, res);
				return; //程式中斷
			}
			System.out.println("14");
			/***************************2.開始修改資料*****************************************/
			PtpService ptpSvc = new PtpService();
			ptpVO = ptpSvc.updatePtp(ptpno ,pacno ,ptpstart ,ptpend ,ptpsigndle ,ptpnotice ,ptpvacancy ,
					ptpminmen ,ptpmaxmen,ptpstatus,ptptimelog);
			
			System.out.println("15");
			
			/***************************3.修改完成,準備轉交(Send the Success view)*************/
			PacService pacSvc = new PacService();
			System.out.println(requestURL);
			if(requestURL.equals("/backend/ptp/listPtps_ByPacno.jsp") || requestURL.equals("/backend/ptp/listAllPacX.jsp"))
				req.setAttribute("listPtps_ByPacno",pacSvc.getPtpsByPacno(pacno)); // 資料庫取出的list物件,存入request
			
			System.out.println("16");            
			String url = requestURL;
System.out.println("-----------------------------------url="+url);	
			res.sendRedirect(requestURL);
			
			/***************************其他可能的錯誤處理*************************************/
		} catch (Exception e) {
			e.printStackTrace();
			errorMsgs.add("修改資料失敗:"+e.getMessage());
			RequestDispatcher failureView = req
					.getRequestDispatcher("/backend/ptp/update_ptp_input.jsp");
			failureView.forward(req, res);
				
			}
			System.out.println("18");
		}

//--------------------------------------------------------------------
if ("updateY".equals(action)) { // 來自update_emp_input.jsp的請求
	
	List<String> errorMsgs = new LinkedList<String>();
	// Store this set in the request scope, in case we need to
	// send the ErrorPage view.
	req.setAttribute("errorMsgs", errorMsgs);
	
	String requestURL = req.getParameter("requestURL"); // 送出修改的來源網頁路徑: 可能為【/emp/listAllEmp.jsp】 或  【/dept/listEmps_ByDeptno.jsp】 或 【 /dept/listAllDept.jsp】 或 【 /emp/listEmps_ByCompositeQuery.jsp】

	try {
		/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
		String ptpno = req.getParameter("ptpno").trim();
//		String ptpnoReg= "^[P][T][P]000\\d\\d\\d$";
		if (ptpno == null || ptpno.trim().length() == 0) {
				errorMsgs.add("套裝行程編號: 請勿空白");
		}
     System.out.println("1111");
	String pacno =req.getParameter("pacno");
	String pacnoReg= "^[P][A][C]000\\d\\d\\d$";
	if (pacno == null || pacno.trim().length() == 0) {
		errorMsgs.add("套裝行程編號: 請勿空白");
	} else if(!pacno.toUpperCase().trim().matches(pacnoReg)) { //以下練習正則(規)表示式(regular-expression)
		errorMsgs.add("套裝行程編號: 只能是加上PAC接六碼數字");
    }
	java.sql.Timestamp ptpstart = null;
	try {
		ptpstart = java.sql.Timestamp.valueOf(req.getParameter("ptpstart").trim());
	} catch (IllegalArgumentException e) {
		ptpstart=new java.sql.Timestamp(System.currentTimeMillis());
		errorMsgs.add("請輸入出發日期!");
	}
	java.sql.Date ptpend = null;
	try {
		ptpend = java.sql.Date.valueOf(req.getParameter("ptpend").trim());
	} catch (IllegalArgumentException e) {
		ptpend=new java.sql.Date(System.currentTimeMillis());
		errorMsgs.add("請輸入回程日期!");
	}
	
	if(!ptpstart.before(ptpend)) {
		errorMsgs.add("出發日期不得晚於回程日期!");
	}
	
	java.sql.Date ptpsigndle = null;
	try {
		ptpsigndle = java.sql.Date.valueOf(req.getParameter("ptpsigndle").trim());
	} catch (IllegalArgumentException e) {
		ptpsigndle=new java.sql.Date(System.currentTimeMillis());
		errorMsgs.add("請輸入報名截止日期!");
	}
	String ptpnotice= " 無  ";
	ptpnotice = req.getParameter("ptpnotice");
	if (ptpnotice == null || ptpnotice.trim().length() == 0) {
		errorMsgs.add("異動公告: 請勿空白，或輸入無");
	}
	
	//, , ptpvacancy, , , , ptptimelog
	System.out.println("6666");
	Integer ptpvacancy = 0;
	try {
		ptpvacancy = new Integer(req.getParameter("ptpvacancy"));
	} catch (Exception e) {
		errorMsgs.add("剩餘空位輸入錯誤");
	}
	System.out.println("777");
	Integer ptpminmen = 0;
	try {
		ptpminmen = new Integer(req.getParameter("ptpminmen"));
	} catch (Exception e) {
		errorMsgs.add("最低出團人數不正確");
	}finally {
		if(ptpminmen==0) {
			errorMsgs.add("最低出團人數不能為0");	
		}
	}
	Integer ptpmaxmen= 0;
	try {
		ptpmaxmen = new Integer(req.getParameter("ptpmaxmen"));
	} catch (Exception e) {
		errorMsgs.add("出團人數上限不正確");
	}finally {
		if(ptpmaxmen==0) {
			errorMsgs.add("出團人數上限不能為0");	
		}
	}
	Integer ptpstatus= 0;
	try {
		ptpstatus = new Integer(req.getParameter("ptpstatus"));
	} catch (Exception e) {
		errorMsgs.add("出團狀態不正確");
	}
	java.sql.Timestamp ptptimelog = null;
	try {
		ptptimelog = java.sql.Timestamp.valueOf(req.getParameter("ptptimelog").trim());
	} catch (IllegalArgumentException e) {
		ptptimelog=new java.sql.Timestamp(System.currentTimeMillis());
		errorMsgs.add("請輸入上架日期!");
	}
	PtpVO ptpVO = new PtpVO();
	
	ptpVO.setPtpno(ptpno);
	ptpVO.setPacno(pacno);
	ptpVO.setPtpstart(ptpstart);
	ptpVO.setPtpend(ptpend);
	ptpVO.setPtpsigndle(ptpsigndle);
	ptpVO.setPtpnotice(ptpnotice);
	ptpVO.setPtpvacancy(ptpvacancy);
	ptpVO.setPtpminmen(ptpminmen);
	ptpVO.setPtpmaxmen(ptpmaxmen);
	ptpVO.setPtpstatus(ptpstatus);
	ptpVO.setPtptimelog(ptptimelog);
	
	if (!errorMsgs.isEmpty()) {
		req.setAttribute("ptpVO", ptpVO); // 含有輸入格式錯誤的ptpVO物件,也存入req
		RequestDispatcher failureView = req
				.getRequestDispatcher("/backend/ptp/update_ptp_inputY.jsp");
		failureView.forward(req, res);
		return; //程式中斷
	}
	/***************************2.開始修改資料*****************************************/
	PtpService ptpSvc = new PtpService();
	ptpVO = ptpSvc.updatePtp(ptpno ,pacno ,ptpstart ,ptpend ,ptpsigndle ,ptpnotice ,ptpvacancy ,
			ptpminmen ,ptpmaxmen,ptpstatus,ptptimelog);
	
	/***************************3.修改完成,準備轉交(Send the Success view)*************/
	String url="/backend/ptp/listAllPtpY.jsp";
	RequestDispatcher successView = req.getRequestDispatcher(url);   // 修改成功後,轉交回送出修改的來源網頁
	successView.forward(req, res);
	
	/***************************其他可能的錯誤處理*************************************/
} catch (Exception e) {
	e.printStackTrace();
	errorMsgs.add("修改資料失敗:"+e.getMessage());
	RequestDispatcher failureView = req
			.getRequestDispatcher("/backend/ptp/update_ptp_inputY.jsp");
	failureView.forward(req, res);
		
	}
}

//--------------------------------------------------------------------
		 if ("insert".equals(action)) { // 來自addPac.jsp的請求  
				
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);

				try {
					/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
					
					String pacno =req.getParameter("pacno").trim();
					String pacnoReg= "^[P][A][C]000\\d\\d\\d$";
					if (pacno == null || pacno.trim().length() == 0) {
						errorMsgs.add("套裝行程編號: 請勿空白");
					} else if(!pacno.toUpperCase().trim().matches(pacnoReg)) { //以下練習正則(規)表示式(regular-expression)
						errorMsgs.add("套裝行程編號: 只能是加上PAC接六碼數字");
		            }
					
					java.sql.Timestamp ptpstart = null;
					try {
						ptpstart = java.sql.Timestamp.valueOf(req.getParameter("ptpstart").trim());
					} catch (IllegalArgumentException e) {
						ptpstart=new java.sql.Timestamp(System.currentTimeMillis());
						errorMsgs.add("請輸入出發日期!");
					}
					
					java.sql.Date ptpend = null;
					try {
						ptpend = java.sql.Date.valueOf(req.getParameter("ptpend").trim());
					} catch (IllegalArgumentException e) {
						ptpend=new java.sql.Date(System.currentTimeMillis());
						errorMsgs.add("請輸入回程日期!");
					}
					if(ptpend.before(ptpstart)) {
						errorMsgs.add("回程日期不得小於出發時間!");
					}
					
					
					java.sql.Date ptpsigndle = null;
					try {
						ptpsigndle = java.sql.Date.valueOf(req.getParameter("ptpsigndle").trim());
					} catch (IllegalArgumentException e) {
						ptpsigndle=new java.sql.Date(System.currentTimeMillis());
						errorMsgs.add("請輸入報名截止日期!");
					}
					
					String ptpnotice = req.getParameter("ptpnotice");
					if (ptpnotice == null || ptpnotice.trim().length() == 0) {
						errorMsgs.add("異動公告: 請勿空白，或輸入無");
					}
					
					Integer ptpvacancy = null;
					try {
						ptpvacancy = new Integer(req.getParameter("ptpvacancy"));
					} catch (Exception e) {
						errorMsgs.add("剩餘座位錯誤");
					}
					
					Integer ptpminmen = null;
					try {
						ptpminmen = new Integer(req.getParameter("ptpminmen"));
					} catch (Exception e) {
						errorMsgs.add("最低出團人數不正確");
					}finally {
						if(ptpminmen==0) {
							errorMsgs.add("最低出團人數不能為0");	
						}
					}
//					
					Integer ptpmaxmen= 0;
					try {
						ptpmaxmen = new Integer(req.getParameter("ptpmaxmen"));
					} catch (Exception e) {
						errorMsgs.add("出團人數上限不正確");
					}finally {
						if(ptpmaxmen==0)
						errorMsgs.add("出團人數上限不能為0");	
					}
					
					Integer ptpstatus= null;
					try {
						ptpstatus = new Integer(req.getParameter("ptpstatus"));
					} catch (Exception e) {
						errorMsgs.add("出團狀態不正確");
					}
					
					java.sql.Timestamp ptptimelog = null;
					try {
						ptptimelog = java.sql.Timestamp.valueOf(req.getParameter("ptptimelog").trim());
					} catch (IllegalArgumentException e) {
						ptptimelog=new java.sql.Timestamp(System.currentTimeMillis());
						errorMsgs.add("請輸入上架日期!");
					}
					
					PtpVO ptpVO = new PtpVO();
//					ptpVO.setPtpno(ptpno);
					ptpVO.setPacno(pacno);
					ptpVO.setPtpstart(ptpstart);
					ptpVO.setPtpend(ptpend);
					ptpVO.setPtpsigndle(ptpsigndle);
					ptpVO.setPtpnotice(ptpnotice);
					ptpVO.setPtpvacancy(ptpvacancy);
					ptpVO.setPtpminmen(ptpminmen);
					ptpVO.setPtpmaxmen(ptpmaxmen);
					ptpVO.setPtpstatus(ptpstatus);
					ptpVO.setPtptimelog(ptptimelog);
					
					
					if (!errorMsgs.isEmpty()) {
						req.setAttribute("ptpVO", ptpVO); // 含有輸入格式錯誤的ptpVO物件,也存入req
						RequestDispatcher failureView = req
								.getRequestDispatcher("/backend/ptp/addPtp.jsp");
						failureView.forward(req, res);
						return;
					}
					
					/***************************2.開始新增資料***************************************/
					PtpService ptpSvc = new PtpService();
					ptpVO = ptpSvc.addPtp(pacno ,ptpstart ,ptpend ,ptpsigndle ,ptpnotice ,ptpvacancy ,ptpminmen ,ptpmaxmen,ptpstatus,ptptimelog); 
					
					/***************************3.新增完成,準備轉交(Send the Success view)***********/
					String url = "/backend/ptp/listAllPacX.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllPtp.jsp
					successView.forward(req, res);				
					
					/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
					errorMsgs.add(e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/ptp/addPtp.jsp");
					failureView.forward(req, res);
				}
			}
				
			
//			
			if ("delete".equals(action)) { // 來自listAllPtp.jsp

				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
		
				try {
					/***************************1.接收請求參數***************************************/
					String ptpno =req.getParameter("ptpno");
					
					/***************************2.開始刪除資料***************************************/
					PtpService ptpSvc = new PtpService();
					ptpSvc.deletePtp(ptpno);
					
					/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
					String url = "/backend/ptp/listAllPtpY.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
					successView.forward(req, res);
					
					/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
					errorMsgs.add("刪除資料失敗:"+e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/ptp/listAllPtpY.jsp");
					failureView.forward(req, res);
				}
			}
			
			if ("delete_query".equals(action)) { // 來自listAllPac.jsp

				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
				String requestURL = req.getParameter("requestURL"); // 送出刪除的來源網頁路徑: 可能為【/emp/listAllEmp.jsp】 或  【/dept/listEmps_ByDeptno.jsp】 或 【 /dept/listAllDept.jsp】 或 【 /emp/listEmps_ByCompositeQuery.jsp】

				try {
					/***************************1.接收請求參數***************************************/
					String ptpno =req.getParameter("ptpno");
					
					/***************************2.開始刪除資料***************************************/
					PtpService ptpSvc = new PtpService();
					PtpVO ptpVO = ptpSvc.getOnePtp(ptpno);
					ptpSvc.deletePtp(ptpno);
					
					
					PacService pacSvc = new PacService();
					if(requestURL.equals("/backend/ptp/listPtps_ByPacno.jsp") || requestURL.equals("/backend/ptp/listAllPacX.jsp"))
						req.setAttribute("listPtps_ByPacno",pacSvc.getPtpsByPacno(ptpVO.getPacno())); // 資料庫取出的list物件,存入request

					
					/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
//					String url = requestURL;
					RequestDispatcher successView = req.getRequestDispatcher("/backend/ptp/listAllPacX.jsp"); // 刪除成功後,轉交回送出刪除的來源網頁
					successView.forward(req, res);
					
					/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
					errorMsgs.add("刪除資料失敗:"+e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher(requestURL);
					failureView.forward(req, res);
				}
			}
		}
	}
		
