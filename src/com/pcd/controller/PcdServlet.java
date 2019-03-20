package com.pcd.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;
import com.pcd.model.*;

public class PcdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
				String pcdno = req.getParameter("pcdno");
				if (pcdno == null || (pcdno.trim()).length() == 0) {
					errorMsgs.add("請輸入套裝訂單編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/pcd/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				
				String pcdnoReg= "^[P][C][D]000\\d\\d\\d$";
				if (pcdno == null || pcdno.trim().length() == 0) {
					errorMsgs.add("管理員編號: 請勿空白");
				} else if(!pcdno.toUpperCase().trim().matches(pcdnoReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("管理員編號: 只能是加上PCD六碼數字");
	            }
				
								
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/pcd/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
			
			
				
				/***************************2.開始查詢資料*****************************************/
				PcdService pcdSvc = new PcdService();
				PcdVO pcdVO = pcdSvc.getOnePcd(pcdno);
				if (pcdVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/pcd/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("pcdVO", pcdVO); // 資料庫取出的pcdVO物件,存入req
				String url = "/backend/pcd/listOnePcd.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOnePcd.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/pcd/select_page.jsp");
				failureView.forward(req, res);
			}
		}
//---------------------------------------------------------------------------------------------------		
		if ("getOne_For_Update".equals(action)) { // 來自listAllPcd.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				String pcdno =req.getParameter("pcdno");
				
				/***************************2.開始查詢資料****************************************/
				PcdService pcdSvc = new PcdService();
				PcdVO pcdVO = pcdSvc.getOnePcd(pcdno);
							
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("pcdVO", pcdVO);         // 資料庫取出的pcdVO物件,存入req
				String url = "/backend/pcd/update_pcd_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_pcd_input.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/pcd/listAllPcd.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("update".equals(action)) { // 來自update_pcd_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String pcdno =req.getParameter("pcdno").trim();
				String pcdnoReg= "^[P][C][D]000\\d\\d\\d$";
				if (pcdno == null || pcdno.trim().length() == 0) {
					errorMsgs.add("套裝訂單編號: 請勿空白");
				} else if(!pcdno.toUpperCase().trim().matches(pcdnoReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("套裝訂單編號: 只能是加上PCD接六碼數字");
	            }
				
				String ptpno =req.getParameter("ptpno").trim();
				String ptpnoReg= "^[P][T][P]000\\d\\d\\d$";
				if (ptpno == null || ptpno.trim().length() == 0) {
					errorMsgs.add("行程內容編號: 請勿空白");
				} else if(!ptpno.toUpperCase().trim().matches(ptpnoReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("行程內容編號: 只能是加上PTP接六碼數字");
	            }
//				
				String memno =req.getParameter("memno").trim();
				String memnoReg= "^[M][E][M]000\\d\\d\\d$";
				if (memno == null || memno.trim().length() == 0) {
					errorMsgs.add("會員編號: 請勿空白");
				} else if(!memno.toUpperCase().trim().matches(memnoReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("會員編號: 只能是加上MEM接六碼數字");
	            }
				
				Integer pcdtripmen = 0;
				try {
					pcdtripmen = new Integer(req.getParameter("pcdtripmen"));
				} catch (Exception e) {
					errorMsgs.add("報名人數不正確");
				}finally{
					if(pcdtripmen==0) {
						errorMsgs.add("報名人數不為0，至少是1");
					}else if(pcdtripmen>9) {
						errorMsgs.add("報名人數不超出9");
					}
				}
				
				java.sql.Date pcdordday;
				try {
					pcdordday = java.sql.Date.valueOf(req.getParameter("pcdordday").trim());
				} catch (IllegalArgumentException e) {
					pcdordday=new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入繳費日期!");
				}
				
				
				Integer pcdmoney = 0;
				try {
					pcdmoney = new Integer(req.getParameter("pcdmoney"));
				} catch (Exception e) {
					errorMsgs.add("繳交費用不正確");
				}finally{
					if(pcdmoney==0) {
						errorMsgs.add("繳交費用不為0");
					}
				}
				Integer pcdstatus = 0;
				try {
					pcdstatus = new Integer(req.getParameter("pcdstatus"));
				} catch (Exception e) {
					errorMsgs.add("套裝狀態不合格式");
				}
				String pcdsecphone = req.getParameter("pcdsecphone").trim();
				if (pcdsecphone == null || pcdsecphone.trim().length() == 0) {
					errorMsgs.add("手機號碼請勿空白");
				}	
				
				String pcdfamdata = req.getParameter("pcdfamdata").trim();
				if (pcdfamdata == null || pcdfamdata.trim().length() == 0) {
					errorMsgs.add("參團人資料請勿空白");
				}	
				
				String pcdmark=req.getParameter("pcdmark");
				if(pcdmark==null||pcdmark.trim().length() == 0) {
					pcdmark = "";
				}
				
				
				
				PcdVO pcdVO = new PcdVO();
				pcdVO.setPcdno(pcdno);
				pcdVO.setPtpno(ptpno);
				pcdVO.setMemno(memno);
				pcdVO.setPcdtripmen(pcdtripmen);
				pcdVO.setPcdordday(pcdordday);
				pcdVO.setPcdmoney(pcdmoney);
				pcdVO.setPcdstatus(pcdstatus);
				pcdVO.setPcdsecphone(pcdsecphone);
				pcdVO.setPcdfamdata(pcdfamdata);
				pcdVO.setPcdmark(pcdmark);
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("pcdVO", pcdVO); // 含有輸入格式錯誤的pcdVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/pcd/update_pcd_input.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				/***************************2.開始修改資料*****************************************/
				PcdService pcdSvc = new PcdService();
				pcdVO = pcdSvc.updatePcd(pcdno,ptpno, memno, pcdtripmen,pcdordday,pcdmoney,
				 pcdstatus, pcdsecphone, pcdfamdata, pcdmark);

				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("pcdVO", pcdVO); // 資料庫update成功後,正確的的pcdVO物件,存入req
				String url = "/backend/pcd/listOnePcd.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOnePcd.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/pcd/update_pcd_input.jsp");
				failureView.forward(req, res);
			}
		}	
		 if ("join4".equals(action)) { 
			
					List<String> errorMsgs = new LinkedList<String>();
					req.setAttribute("errorMsgs", errorMsgs);
					
					try {
						/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
						String ptpno =req.getParameter("ptpno");
//						System.out.println("ptpno"+ptpno);
						String ptpnoReg= "^[P][T][P]000\\d\\d\\d$";
						if (ptpno == null || ptpno.trim().length() == 0) {
							errorMsgs.add("行程內容編號: 請勿空白");
						} else if(!ptpno.toUpperCase().trim().matches(ptpnoReg)) { //以下練習正則(規)表示式(regular-expression)
							errorMsgs.add("行程內容編號: 只能是加上PTP接六碼數字");
			            }
						
						Integer	pcdtripmen = new Integer(req.getParameter("pcdtripmen"));
							if(pcdtripmen==0) {
								errorMsgs.add("報名人數不為0，至少是1");
							}
						
						System.out.println("999");
						String memno =req.getParameter("memno");
						String memnoReg= "^[M][E][M]000\\d\\d\\d$";
						if (memno == null || memno.trim().length() == 0) {
							errorMsgs.add("會員編號: 請勿空白");
						} else if(!memno.toUpperCase().trim().matches(memnoReg)) { //以下練習正則(規)表示式(regular-expression)
							errorMsgs.add("會員編號: 只能是加上MEM接六碼數字");
			            }
						
//						java.sql.Date pcdordday;
//						try {
//							pcdordday = java.sql.Date.valueOf(req.getParameter("pcdordday").trim());
//						} catch (IllegalArgumentException e) {
//							pcdordday=new java.sql.Date(System.currentTimeMillis());
//						}
						System.out.println("1");
						PcdVO pcdVO = new PcdVO();
						pcdVO.setPtpno(ptpno);
						pcdVO.setPcdtripmen(pcdtripmen);
						pcdVO.setMemno(memno);
						System.out.println("===ptpno為"+pcdVO.getPtpno());
						System.out.println("==人數="+pcdVO.getPcdtripmen());
						System.out.println("===會員編號"+pcdVO.getMemno());
						
						if (!errorMsgs.isEmpty()) {
							req.setAttribute("pcdVO", pcdVO); // 含有輸入格式錯誤的pcdVO物件,也存入req
							RequestDispatcher failureView = req
									.getRequestDispatcher("/backend/pcd/join.jsp");
							System.out.println("123");
							failureView.forward(req, res);
							return;
						} 
							req.setAttribute("pcdVO", pcdVO);
							RequestDispatcher successView = req.getRequestDispatcher("/backend/pcd/join4.jsp"); // 新增成功後轉交第二個新增訂單的頁面
							successView.forward(req, res);		
						
					 } catch (Exception e) {
						 e.printStackTrace();
						 errorMsgs.add(e.getMessage());
						 RequestDispatcher failureView = req
								 .getRequestDispatcher("/backend/pcd/join.jsp");
						 failureView.forward(req, res);
					}
				}
		 if ("insert".equals(action)) { // 來自addPcd.jsp的請求  
				
				List<String> errorMsgs = new LinkedList<String>();
				req.setAttribute("errorMsgs", errorMsgs);

//				try {
					/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
					String ptpno =req.getParameter("ptpno");
					int pcdtripmen = 0;
					try {
						pcdtripmen = new Integer(req.getParameter("pcdtripmen"));
					} catch (Exception e) {
						errorMsgs.add("報名人數不正確");
					}finally{
						if(pcdtripmen==0) {
							errorMsgs.add("請填人數，人數不為0，至少是1");
						}
					}
					String memno =req.getParameter("memno");

					java.sql.Date pcdordday=null;
					try {
						pcdordday = java.sql.Date.valueOf(req.getParameter("pcdordday").trim());
					} catch (IllegalArgumentException e) {
						pcdordday=new java.sql.Date(System.currentTimeMillis());
					}finally {
						pcdordday=new java.sql.Date(System.currentTimeMillis());
					}
					
					Integer pcdmoney = 0;
					try {
						pcdmoney = new Integer(req.getParameter("pcdmoney"));
					} catch (Exception e) {
						errorMsgs.add("繳交費用不正確");
					}finally {
						if(pcdmoney==0) {
							errorMsgs.add("繳交費用不為0");
						}
					}
					Integer pcdstatus = 0;
					try {
						pcdstatus = new Integer(req.getParameter("pcdstatus"));
					} catch (Exception e) {
						errorMsgs.add("套裝狀態不合格式");
					}
					String pcdsecphone = req.getParameter("pcdsecphone");
					if (pcdsecphone == null || pcdsecphone.trim().length() == 0) {
						errorMsgs.add("手機號碼請勿空白");
					}	
					String pcdfamdata = req.getParameter("pcdfamdata");
					if (pcdfamdata == null || pcdfamdata.trim().length() == 0) {
						errorMsgs.add("參團人資料請勿空白");
					}	
					String	 pcdmark =req.getParameter("pcdmark");
					
					
					PcdVO pcdVO = new PcdVO();
//					pcdVO.setPtpno(ptpno);
//					pcdVO.setMemno(memno);
//					pcdVO.setPcdtripmen(pcdtripmen);
					pcdVO.setPcdordday(pcdordday);
					pcdVO.setPcdmoney(pcdmoney);
					pcdVO.setPcdstatus(pcdstatus);
					pcdVO.setPcdsecphone(pcdsecphone);
					pcdVO.setPcdfamdata(pcdfamdata);
					pcdVO.setPcdmark(pcdmark);
					
					if (!errorMsgs.isEmpty()) {
						req.setAttribute("pcdVO", pcdVO); // 含有輸入格式錯誤的pcdVO物件,也存入req
						RequestDispatcher failureView = req
								.getRequestDispatcher("/backend/pcd/join4.jsp");
						System.out.println("123");
						failureView.forward(req, res);
						return;
					} 
					
					
					/***************************2.開始新增資料***************************************/
					PcdService pcdSvc = new PcdService();
					pcdVO = (PcdVO)req.getAttribute("pcdVO");
					pcdVO = pcdSvc.addPcd(ptpno, memno, pcdtripmen,pcdordday,pcdmoney,
							 pcdstatus, pcdsecphone, pcdfamdata, pcdmark);

					
					/***************************3.新增完成,準備轉交(Send the Success view)***********/
					String url = "/backend/pcd/listAllPcd.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllPcd.jsp
					successView.forward(req, res);				
					
					/***************************其他可能的錯誤處理**********************************/
//				} catch (Exception e) {
//					errorMsgs.add(e.getMessage());
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/backend/pcd/join4.jsp");
//					failureView.forward(req, res);
//				}
			}
		 			
		 if ("insertX".equals(action)) { // 來自addPcd.jsp的請求  
				
				List<String> errorMsgs = new LinkedList<String>();
				req.setAttribute("errorMsgs", errorMsgs);

//				try {
					/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
					String ptpno =req.getParameter("ptpno");
					Integer pcdtripmen = 0;
					try {
						pcdtripmen = new Integer(req.getParameter("pcdtripmen"));
					} catch (Exception e) {
						errorMsgs.add("報名人數不正確");
					}finally{
						if(pcdtripmen==0) {
							errorMsgs.add("請填人數，人數不為0，至少是1");
						}
					}
					String memno =req.getParameter("memno");

					java.sql.Date pcdordday;
					try {
						pcdordday = java.sql.Date.valueOf(req.getParameter("pcdordday").trim());
					} catch (IllegalArgumentException e) {
						pcdordday=new java.sql.Date(System.currentTimeMillis());
					}finally {
						pcdordday=new java.sql.Date(System.currentTimeMillis());
					}
					
					Integer pcdmoney = 0;
					try {
						pcdmoney = new Integer(req.getParameter("pcdmoney"));
					} catch (Exception e) {
						errorMsgs.add("繳交費用不正確");
					}finally {
						if(pcdmoney==0) {
							errorMsgs.add("繳交費用不為0");
						}
					}
					Integer pcdstatus = 0;
					try {
						pcdstatus = new Integer(req.getParameter("pcdstatus"));
					} catch (Exception e) {
						errorMsgs.add("套裝狀態不合格式");
					}
					String pcdsecphone = req.getParameter("pcdsecphone");
					if (pcdsecphone == null || pcdsecphone.trim().length() == 0) {
						errorMsgs.add("手機號碼請勿空白");
					}	
					String pcdfamdata = req.getParameter("pcdfamdata");
					if (pcdfamdata == null || pcdfamdata.trim().length() == 0) {
						errorMsgs.add("參團人資料請勿空白");
					}	
					String	 pcdmark =req.getParameter("pcdmark");
					
					
					PcdVO pcdVO = new PcdVO();
//					pcdVO.setPtpno(ptpno);
//					pcdVO.setMemno(memno);
//					pcdVO.setPcdtripmen(pcdtripmen);
					pcdVO.setPcdordday(pcdordday);
					pcdVO.setPcdmoney(pcdmoney);
					pcdVO.setPcdstatus(pcdstatus);
					pcdVO.setPcdsecphone(pcdsecphone);
					pcdVO.setPcdfamdata(pcdfamdata);
					pcdVO.setPcdmark(pcdmark);
					
					if (!errorMsgs.isEmpty()) {
						req.setAttribute("pcdVO", pcdVO); // 含有輸入格式錯誤的pcdVO物件,也存入req
						RequestDispatcher failureView = req
								.getRequestDispatcher("/backend/pcd/join4.jsp");
						System.out.println("123");
						failureView.forward(req, res);
						return;
					} 
					
					
					/***************************2.開始新增資料***************************************/
					PcdService pcdSvc = new PcdService();
					pcdVO = (PcdVO)req.getAttribute("pcdVO");
					pcdVO = pcdSvc.addPcd(ptpno, memno, pcdtripmen,pcdordday,pcdmoney,
							 pcdstatus, pcdsecphone, pcdfamdata, pcdmark);

					
					/***************************3.新增完成,準備轉交(Send the Success view)***********/
					String url = "/backend/pcd/listAllPcd.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllPcd.jsp
					successView.forward(req, res);				
					
					/***************************其他可能的錯誤處理**********************************/
//				} catch (Exception e) {
//					errorMsgs.add(e.getMessage());
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/backend/pcd/join4.jsp");
//					failureView.forward(req, res);
//				}
			}
				
			if ("delete".equals(action)) { // 來自listAllPcd.jsp

				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
		
				try {
					/***************************1.接收請求參數***************************************/
					String pcdno =req.getParameter("pcdno");
					
					/***************************2.開始刪除資料***************************************/
					PcdService pcdSvc = new PcdService();
					pcdSvc.deletePcd(pcdno);
					
					/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
					String url = "/backend/pcd/listAllPcd.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
					successView.forward(req, res);
					
					/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
					errorMsgs.add("刪除資料失敗:"+e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/pcd/listAllPcd.jsp");
					failureView.forward(req, res);
				}
			}
	}
	
}		
