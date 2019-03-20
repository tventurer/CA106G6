package com.acr.controller;

import java.io.*;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.acr.model.AcrService;
import com.acr.model.AcrVO;
import com.mem.model.MemService;
import com.mem.model.MemVO;

public class AcrServlet extends HttpServlet{
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
				String str = req.getParameter("acrid");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入交易序號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/acr/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				String acrid = null;
				try {
					acrid = new String(str);
				} catch (Exception e) {
					errorMsgs.add("交易序號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/acr/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				AcrService acrSvc = new AcrService();
				AcrVO acrVO = acrSvc.getOneAcr(acrid);
				if (acrVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/acr/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("acrVO", acrVO); // 資料庫取出的acrVO物件,存入req
				String url = "/frontend/acr/listOneAcr.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneAcr.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/acr/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("search".equals(action)) { // 來自b/listAllAcr.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String memmail = req.getParameter("mememail");
				String memmailReg = "^.*@.*\\..*$";
				MemService memSvc = new MemService();
				MemVO memVO = memSvc.getEmailForLogin(memmail);
				String memno = null;
				if (memmail == null || memmail.trim().length() == 0) {
					errorMsgs.add("請輸入搜尋的會員帳號");
				} else if(!memmail.trim().matches(memmailReg)) {
					errorMsgs.add("會員帳號請輸入正確");
	            }else if(memVO.getMemno().isEmpty()) {
	            	errorMsgs.add("查無此會員");
	            }else {
	            	memno = new String(memVO.getMemno());
	            }
				
				java.sql.Timestamp atime = null;
				try {
					atime = java.sql.Timestamp.valueOf(req.getParameter("atime").trim());
				} catch (IllegalArgumentException e) {
					atime=new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				
				java.sql.Timestamp btime = null;
				try {
					btime = java.sql.Timestamp.valueOf(req.getParameter("btime").trim());
				} catch (IllegalArgumentException e) {
					btime=new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/acr/listAllAcr.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				
				/***************************2.開始查詢資料****************************************/
				AcrService acrSvc = new AcrService();
				List<AcrVO> acrVO = acrSvc.getMemTimeBetween(memno, atime, btime);
				if (acrVO.isEmpty()) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/acr/listAllAcr.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("acrVO", acrVO);         // 資料庫取出的acrVO物件,存入req
				String url ="/backend/acr/listAllAcr.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 /backend/acr/listAllAcr.jsp
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/acr/listAllAcr.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("getMemall_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("memno");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入會員編號");
				}
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/acr/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				String memno = null;
				try {
					memno = new String(str);
				} catch (Exception e) {
					errorMsgs.add("會員編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/acr/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				
				/***************************2.開始查詢資料****************************************/
				AcrService acrSvc = new AcrService();
				List<AcrVO> acrVO = acrSvc.getMemAll(memno);
				String memnoReg = "MEM+[0-9][0-9][0-9][0-9][0-9][0-9]";
				if(!memno.trim().matches(memnoReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("會員編號：只能是英文字母開頭為MEM、數字，且長度必須是9碼");
	            }
				if (acrVO.isEmpty()) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/acr/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("acrVO", acrVO);         // 資料庫取出的acrVO物件,存入req
				String url = "/frontend/acr/listMemAllAcr.jsp?memno="+memno;
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 listMemAllAcr.jsp.jsp
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/acr/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("getOne_For_Update".equals(action)) { // 來自listAllAcr.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				String acrid = new String(req.getParameter("acrid"));
				
				/***************************2.開始查詢資料****************************************/
				AcrService acrSvc = new AcrService();
				AcrVO acrVO = acrSvc.getOneAcr(acrid);
				
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("acrVO", acrVO);         // 資料庫取出的acrVO物件,存入req
				String url = "/frontend/acr/update_acr_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_acr_input.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/acr/listAllAcr.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("update".equals(action)) { // 來自update_acr_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				
				
				AcrService acrSvc = new AcrService();
				String acrid = new String(req.getParameter("acrid").trim());
				
				String memno = req.getParameter("memno");
				String memnoReg = "MEM+[0-9][0-9][0-9][0-9][0-9][0-9]";
				if (memno == null || memno.trim().length() == 0) {
					errorMsgs.add("會員編號：請勿空白");
				} else if(!memno.trim().matches(memnoReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("會員編號：只能是英文字母開頭為MEM、數字，且長度必須是9碼");
	            }
				
				Integer acrprice = null;
				try {
					acrprice = new Integer(req.getParameter("acrprice").trim());
				} catch (NumberFormatException e) {
					acrprice = 0;
					errorMsgs.add("交易金額請填數字");
				}
				
				Integer acrsource = new Integer(req.getParameter("acrsource").trim());
				
				String acrend = req.getParameter("acrend");
				if (acrend == null || acrend.trim().length() == 0) {
					errorMsgs.add("匯款目的地：請勿空白");
				}
				
				AcrVO acrVO1 = acrSvc.getOneAcr(acrid);
				Integer acrprice1 = acrVO1.getAcrprice();
				Integer acrsource1 = acrVO1.getAcrsource();
				
				Integer acrtotal = acrSvc.getMemacrtotal(memno);
				if(acrsource1==0) {
					acrtotal=acrtotal+acrprice1;
				}else if(acrsource1==1) {
					acrtotal=acrtotal-acrprice1;
				}
				if(acrsource == 0) {
					acrprice= 0-acrprice;
					acrtotal = acrtotal + acrprice;
					if(acrtotal<0) {
						acrprice=0-acrprice;
						errorMsgs.add("餘額為負數，請重新輸入");
					}
				}else if (acrsource ==1) {
					acrtotal = acrtotal + acrprice;
					if(acrtotal<0) {
						acrprice=0-acrprice;
						errorMsgs.add("餘額為負數，請重新輸入");
					}
				}

				AcrVO acrVO = new AcrVO();
				acrVO.setAcrid(acrid);
				acrVO.setMemno(memno);
				acrVO.setAcrprice(acrprice);
				acrVO.setAcrsource(acrsource);
				acrVO.setAcrend(acrend);
				acrVO.setAcrtotal(acrtotal);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("acrVO", acrVO); // 含有輸入格式錯誤的acrVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/acr/update_acr_input.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				
				acrVO = acrSvc.updateAcr(memno, acrprice, acrsource, acrend, acrtotal ,acrid);
				acrVO = acrSvc.findByPrimaryKey(acrid);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("acrVO", acrVO); // 資料庫update成功後,正確的的acrVO物件,存入req
				String url = "/frontend/acr/listOneAcr.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/acr/update_acr_input.jsp");
				failureView.forward(req, res);
			}
		}
		
	     if ("insert".equals(action)) { //來自addAcr.jsp的請求  
	    	 	AcrService acrSvc = new AcrService();
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);

				try {
					/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
					String memno = req.getParameter("memno");
					String memnoReg = "MEM+[0-9][0-9][0-9][0-9][0-9][0-9]";//QQ
					if (memno == null || memno.trim().length() == 0) {
						errorMsgs.add("會員編號：請勿空白");
					} else if(!memno.trim().matches(memnoReg)) { //以下練習正則(規)表示式(regular-expression)
						errorMsgs.add("會員編號：只能是英文字母開頭為MEM、數字，且長度必須是9碼");
		            }
					
					Integer acrprice = 0;
					try {
						acrprice = new Integer(req.getParameter("acrprice").trim());
					} catch (NumberFormatException e) {
						acrprice = 0;
						errorMsgs.add("交易金額請填數字");
					}
					
					Integer acrsource = new Integer(req.getParameter("acrsource").trim());
					
					String acrend = req.getParameter("acrend");
					if (acrend == null || acrend.trim().length() == 0) {
						errorMsgs.add("匯款目的地：請勿空白");
					}
					
					Integer acrtotal = acrSvc.getMemacrtotal(memno);
					if(acrsource == 0) {
						acrprice= 0-acrprice;
						acrtotal = acrtotal + acrprice;
						if(acrtotal<0) {
							acrprice=0-acrprice;
							errorMsgs.add("餘額為負數，請重新輸入");
						}
					}else if (acrsource == 1) {
						acrtotal = acrtotal + acrprice;
					}
					
					String cardno = new String(req.getParameter("cardno").trim());
					if(cardno == null || cardno.trim().length() == 0) {
						errorMsgs.add("沒信用卡號");
					}else {
						String acrend1 = cardno.substring(0, 8);
						String acrend2 = cardno.substring(8,16);
						String acrend1_1 = acrend1.replaceAll("[0-9]", "*");
						acrend=acrend+"：使用信用卡 "+acrend1_1+"-"+acrend2;
						
					}

					AcrVO acrVO = new AcrVO();
					acrVO.setMemno(memno);
					acrVO.setAcrprice(acrprice);
					acrVO.setAcrsource(acrsource);
					acrVO.setAcrend(acrend);
					acrVO.setAcrtotal(acrtotal);

					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						req.setAttribute("acrVO", acrVO); // 含有輸入格是錯誤的AcrVO物件，也存入req
						RequestDispatcher failureView = req
								.getRequestDispatcher("/frontend/acr/successAcr.jsp");
						failureView.forward(req, res);
						return;
					}
					
					/******************************2.開始新增資料***************************************/
					
					acrVO = acrSvc.addAcr(memno, acrprice, acrsource, acrend, acrtotal);
					
					/***************************3.新增完成，準備轉交(Send the Success view)***********/
					String url = req.getContextPath()+"/frontend/acr/successAcr.jsp?acrprice="+acrprice;
					res.sendRedirect(url); // 新增成功後轉交successAcr.jsp
					
					/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
					errorMsgs.add(e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/acr/successAcr.jsp");
					failureView.forward(req, res);
				}
			}
	     
	     if ("delete".equals(action)) { // 來自listAllAcr.jsp

				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
		
				try {
					/***************************1.接收請求參數***************************************/
					String acrid = new String(req.getParameter("acrid"));
					
					/***************************2.開始刪除資料***************************************/
					AcrService acrSvc = new AcrService();
					acrSvc.deleteAcr(acrid);
					
					/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
					String url = "/frontend/acr/listAllAcr.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
					successView.forward(req, res);
					
					/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
					errorMsgs.add("刪除資料失敗:"+e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/acr/listAllAcr.jsp");
					failureView.forward(req, res);
				}
			}
	}
}
