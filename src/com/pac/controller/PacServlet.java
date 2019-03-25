package com.pac.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

import com.pac.model.*;
import com.ptp.model.*;
import com.pur.model.PurService;
import com.pur.model.PurVO;

@MultipartConfig
public class PacServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		res.setContentType("image/gif");
		ServletOutputStream out = res.getOutputStream();
	
		String pacno =req.getParameter("pacno");
		PacService pacSvc = new PacService();
		PacVO pacVO=(PacVO) pacSvc.getOnePac(pacno);
		System.out.println(pacno);
		
		byte[] pic1 =pacVO.getPactchar1();
		if(pic1 !=null) {
			out.write(pic1);
		}
		
		byte[] pic2 =pacVO.getPactchar2();
		if(pic2 !=null) {
			out.write(pic2);
		}
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
				String pacno = req.getParameter("pacno");
				if (pacno == null || (pacno.trim()).length() == 0) {
					errorMsgs.add("請輸入套裝行程編號");
				}
				// Send the use back to the form, if there were errors
								
				String pacnoReg= "^[P][A][C]000\\d\\d\\d$";
				if (pacno == null || pacno.trim().length() == 0) {
					errorMsgs.add("管理員編號: 請勿空白");
				} else if(!pacno.toUpperCase().trim().matches(pacnoReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("管理員編號: 只能是加上PAC六碼數字");
	            }
								
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/pac/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
		
			/***************************2.開始查詢資料*****************************************/
				PacService pacSvc = new PacService();
				PacVO pacVO = pacSvc.getOnePac(pacno);
				if (pacVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/pac/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("pacVO", pacVO); // 資料庫取出的pacVO物件,存入req
				String url = "/backend/pac/listOnePac.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOnePac.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/pac/select_page.jsp");
				failureView.forward(req, res);
			}
		}
//---------------------------------------------------------------------------------------------------
		if ("getOne_For_Update_Pac".equals(action)) { // 來自listAllPacX.jsp 或  backend/ptp/listPtps_ByPacno.jsp 的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL"); // 送出修改的來源網頁路徑: 可能為【/emp/listAllEmp.jsp】 或  【/dept/listEmps_ByDeptno.jsp】 或 【 /dept/listAllDept.jsp】		
			
			try {
				/***************************1.接收請求參數****************************************/
				String pacno =req.getParameter("pacno");
				
				/***************************2.開始查詢資料****************************************/
				PacService pacSvc = new PacService();
				PacVO pacVO = pacSvc.getOnePac(pacno);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("pacVO", pacVO); // 資料庫取出的empVO物件,存入req
				String url = "/backend/pac/update_pac_input.jsp";
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
		
		
//-----------------------		
		if ("getOne_For_Update".equals(action)) { // 來自listAllPac.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				String pacno =req.getParameter("pacno");
				/***************************2.開始查詢資料****************************************/
				PacService pacSvc = new PacService();
				PacVO pacVO = pacSvc.getOnePac(pacno);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("pacVO", pacVO);         // 資料庫取出的pacVO物件,存入req
				String url = "/backend/pac/update_pac_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_pac_input.jsp
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/pac/listAllPac.jsp");
				failureView.forward(req, res);
			}
		}
		if ("update".equals(action)) { // 來自update_pac_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String pacno =req.getParameter("pacno");
				String pacnoReg= "^[P][A][C]000\\d\\d\\d$";
				if (pacno == null || pacno.trim().length() == 0) {
					errorMsgs.add("套裝行程編號: 請勿空白");
				} else if(!pacno.toUpperCase().trim().matches(pacnoReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("套裝行程編號: 只能是加上PAC接六碼數字");
	            }
				
				String empno =req.getParameter("empno");
				String empnoReg= "^[E][M][P]000\\d\\d\\d$";
				if (empno == null || empno.trim().length() == 0) {
					errorMsgs.add("管理員編號: 請勿空白");
				} else if(!empno.toUpperCase().trim().matches(empnoReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("管理員編號: 只能是加上EMP接六碼數字");
	            }
				String pacname = req.getParameter("pacname");
				
				if(pacname.length() < 120 && pacname.trim().length()>0) {
					
				}else {
					errorMsgs.add("套裝行程名稱: 只能是中、英文字母、數字和_ , 且長度必需在2到120之間??");
				}
				
				
//				
//				String pacnameReg = "^[*]{2,120}$";
//				if (pacname == null || pacname.trim().length() == 0) {
//					errorMsgs.add("套裝行程名稱: 請勿空白");
//				} else if(!pacname.trim().matches(pacnameReg)) { //以下練習正則(規)表示式(regular-expression)
//					errorMsgs.add("套裝行程名稱: 只能是中、英文字母、數字和_ , 且長度必需在2到120之間??");
//	            }
				String paccountryReg = "^[(\u4e00-\u9fa5)\\,\\~\\，\\-\\.(a-zA-Z)\\D]{2,60}$";
				String paccountry = req.getParameter("paccountry");
				if (paccountry == null || paccountry.trim().length() == 0) {
					errorMsgs.add("旅遊國家請勿空白");
				}else if(!paccountry.trim().matches(paccountryReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("旅遊國家名稱: 只能是中、英文字母不能有數字 , 且長度必需在2到120之間");
	            }	
				
				String paccityReg = "^[(\u4e00-\u9fa5)+,?\\,\\~\\，\\-\\.(a-zA-Z)\\D]{2,120}$";
				String paccity = req.getParameter("paccity");
				if (paccity == null || paccity.trim().length() == 0) {
					errorMsgs.add("旅遊城市請勿空白");
				}else if(!paccity.trim().matches(paccityReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("旅遊城市名稱: 只能是中、英文字母不能有數字 , 且長度必需在2到120之間");
	            }	
				
				Integer pactotalday = 0;
				try {
					pactotalday = new Integer(req.getParameter("pactotalday"));
				} catch (Exception e) {
					errorMsgs.add("旅遊天數格式不正確");
				}finally {
					if(pactotalday==0) {
						errorMsgs.add("旅遊天數不能為0");	
					}
				}
				
				Integer pacprice = 0;
				try {
					pacprice = new Integer(req.getParameter("pacprice"));
				} catch (Exception e) {
					errorMsgs.add("團費價格不正確");
				}finally {
					if(pactotalday==0) {
						errorMsgs.add("旅遊天數不能為0");	
					}
				}
				
				Integer pacdeposit= 0;
				try {
					pacdeposit = new Integer(req.getParameter("pacdeposit"));
				}catch (Exception e) {
					errorMsgs.add("預繳訂金不正確");
				}finally {
					if(pactotalday==0) {
						errorMsgs.add("旅遊天數不能為0");	
					}
				}
				
				String pacdiv = req.getParameter("pacdiv");
				String pacdivReg = "^[(\u4e00-\u9fa5)+、?\\,\\~\\，\\-\\.(a-zA-Z0-9_)]{2,120}$";
				if (pacdiv == null || pacdiv.trim().length() == 0) {
					errorMsgs.add("特色標籤: 請勿空白");
				} else if(!pacdiv.trim().matches(pacdivReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("特色標籤: 只能是中、英文字母、數字和標點符號、, 且長度必需在2到120之間");
	            }
				
				String paccontent = req.getParameter("paccontent");
				if (paccontent == null || paccontent.trim().length() == 0) {
					errorMsgs.add("行程內容: 請勿空白");
				} 		
				Part pactchar1=req.getPart("pactchar1");
				byte[] imgbyte1=new byte[pactchar1.getInputStream().available()];;
//				System.out.println(pactchar1.getSize());測試用
				if(pactchar1.getSize()==0) {
					PacService pacSvc = new PacService();
					PacVO votchar1VO= pacSvc.getOnePac(pacno);
					imgbyte1 = votchar1VO.getPactchar1();
				}else {
					//
//					byte imgbyte2[]=new byte[pactchar1.getInputStream().available()];
					pactchar1.getInputStream().read(imgbyte1);
					//
//					BufferedInputStream buf1=new BufferedInputStream(pactchar1.getInputStream());
//					ByteArrayOutputStream bao1=new ByteArrayOutputStream();
//					int i;
//					byte b1[]= new byte[200];
//					while((i=buf1.read(b1))!= -1) {
//						bao1.write(b1,0,i);
//					}
//					a = bao1.toByteArray();
				}
				Part pactchar2=req.getPart("pactchar2");
				byte[] imgbyte2=new byte[pactchar2.getInputStream().available()];;
				if(pactchar2.getSize()==0) {
					PacService pacSvc = new PacService();
					PacVO pactchar2VO= pacSvc.getOnePac(pacno);
					imgbyte2 = pactchar2VO.getPactchar2();
				}else {
					pactchar2.getInputStream().read(imgbyte2);
				}	
			
				/*這個沒辦法讀取第二次  必須還在輸入一次           */
//				BufferedInputStream buf2=new BufferedInputStream(pactchar2.getInputStream());
//				ByteArrayOutputStream bao2=new ByteArrayOutputStream();
//				int j;
//				byte b2[]= new byte[8192];
//				while((j=buf2.read(b2))!= -1) {
//					bao2.write(b2,0,j);
//				}
//				bao2.toByteArray();
				/*這個沒辦法讀取第二次  必須還在輸入一次           */
				String pacremark = req.getParameter("pacremark").trim();
				if (pacremark == null || pacremark.trim().length() == 0) {
					errorMsgs.add("注意事項請勿空白");
				}	
				
				Integer pacstatus = null;
				try {
					pacstatus = new Integer(req.getParameter("pacstatus"));
				} catch (Exception e) {
					errorMsgs.add("套裝狀態不合格式");
				}

				PacVO pacVO = new PacVO();
				pacVO.setPacno(pacno);
				pacVO.setEmpno(empno);
				pacVO.setPacname(pacname);
				pacVO.setPaccountry(paccountry);
				pacVO.setPaccity(paccity);
				pacVO.setPactotalday(pactotalday);
				pacVO.setPacprice(pacprice);
				pacVO.setPacdeposit(pacdeposit);
				pacVO.setPacdiv(pacdiv);
				pacVO.setPaccontent(paccontent);
				pacVO.setPactchar1(imgbyte1);
				pacVO.setPactchar2(imgbyte2);
				pacVO.setPacremark(pacremark);
				pacVO.setPacstatus(pacstatus);
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("pacVO", pacVO); // 含有輸入格式錯誤的pacVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/pac/update_pac_input.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				/***************************2.開始修改資料*****************************************/
				PacService pacSvc = new PacService();
				pacVO = pacSvc.updatePac(pacno,empno,pacname,paccountry,paccity,pactotalday,pacprice,pacdeposit,pacdiv
						,paccontent,imgbyte1,imgbyte2,pacremark,pacstatus);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("pacVO", pacVO); // 資料庫update成功後,正確的的pacVO物件,存入req
				String url = "/backend/pac/listAllPac.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOnePac.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/pac/update_pac_input.jsp");
				failureView.forward(req, res);
			}
		}	
		if ("insert".equals(action)) { // 來自addPac.jsp的請求  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				
				String empno =req.getParameter("empno").trim();
				String empnoReg= "^[E][M][P]000\\d\\d\\d$";
				if (empno == null || empno.trim().length() == 0) {
					errorMsgs.add("管理員編號: 請勿空白");
				} else if(!empno.toUpperCase().trim().matches(empnoReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("管理員編號: 只能是加上EMP接六碼數字");
	            }
				String pacname = req.getParameter("pacname");
				
				if(pacname.length() < 120 && pacname.trim().length()>0) {
					
				}else {
					errorMsgs.add("套裝行程名稱: 只能是中、英文字母、數字和_ , 且長度必需在2到120之間");
				}
				
				String paccountryReg = "^[(\u4e00-\u9fa5)\\,\\~\\，\\-\\.\\-(a-zA-Z)\\D]{2,60}$";
				String paccountry = req.getParameter("paccountry").trim();
				if (paccountry == null || paccountry.trim().length() == 0) {
					errorMsgs.add("旅遊國家請勿空白");
				}else if(!paccountry.trim().matches(paccountryReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("旅遊國家名稱: 只能是中、英文字母不能有數字 , 且長度必需在2到120之間");
	            }	
				
				String paccityReg = "^[(\u4e00-\u9fa5)+\\,\\~\\，\\-\\.\\-(a-zA-Z)\\D]{2,120}$";
				String paccity = req.getParameter("paccity");
				if (paccity == null || paccity.trim().length() == 0) {
					errorMsgs.add("旅遊城市請勿空白");
				}else if(!paccity.trim().matches(paccityReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("旅遊城市名稱: 只能是中、英文字母不能有數字 , 且長度必需在2到120之間");
	            }	
				Integer pactotalday=0;
				try {
					pactotalday = new Integer(req.getParameter("pactotalday"));
					if(pactotalday==0)
						errorMsgs.add("旅遊天數不為0");	
				} catch (Exception e) {
					errorMsgs.add("旅遊天數格式不正確");
				}
				
				Integer pacprice = 0;
				try {
					pacprice = new Integer(req.getParameter("pacprice"));
					if(pactotalday==0)
						errorMsgs.add("團費價格不為0");	
				} catch (Exception e) {
					errorMsgs.add("團費價格不正確");
				}
		
				Integer pacdeposit= 0;
				try {
					pacdeposit = new Integer(req.getParameter("pacdeposit"));
				} catch (Exception e) {
					errorMsgs.add("預繳訂金不正確");
				}
				
				String pacdiv = req.getParameter("pacdiv");
				String pacdivReg = "^[(\\u4e00-\\u9fa5)\\\\,\\\\~\\\\，\\\\-\\\\.(a-zA-Z0-9_)]{2,120}$";
				if (pacdiv == null || pacdiv.trim().length() == 0) {
					errorMsgs.add("特色標籤: 請勿空白");
				} else if(!pacdiv.trim().matches(pacdivReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("特色標籤: 只能是中、英文字母、數字和標點符號、, 且長度必需在2到20之間");
	            }
				
				String paccontent = req.getParameter("paccontent");
				if (paccontent == null || paccontent.trim().length() == 0) {
					errorMsgs.add("行程內容: 請勿空白");
				}
				
				Part pactchar1=req.getPart("pactchar1");
				byte b1[]=	 new byte[pactchar1.getInputStream().available()];
				pactchar1.getInputStream().read(b1);
//				BufferedInputStream buf1=new BufferedInputStream(pactchar1.getInputStream());
//				ByteArrayOutputStream bao1=new ByteArrayOutputStream();
//				int i;
//				byte b1[]= new byte[8192];
//				while((i=buf1.read(b1))!= -1) {
//					bao1.write(b1,0,i);
//				}
//				bao1.toByteArray();
				
				Part pactchar2=req.getPart("pactchar2");
				byte b2[]=	 new byte[pactchar2.getInputStream().available()];
				pactchar2.getInputStream().read(b2);

//              Part pactchar2=req.getPart("pactchar2");
//				BufferedInputStream buf2=new BufferedInputStream(pactchar2.getInputStream());
//				ByteArrayOutputStream bao2=new ByteArrayOutputStream();
//				int j;
//				byte b2[]= new byte[8192];
//				while((j=buf2.read(b2))!= -1) {
//					bao2.write(b2,0,j);
//				}
//				bao2.toByteArray();
				
				String pacremark = req.getParameter("pacremark");
				if (pacremark == null || pacremark.trim().length() == 0) {
					errorMsgs.add("注意事項: 請勿空白");
				}
				
				Integer pacstatus = 0;
				try {
					pacstatus = new Integer(req.getParameter("pacstatus"));
				} catch (Exception e) {
					errorMsgs.add("套裝狀態不合格式");
				}
				
				PacVO pacVO = new PacVO();
//				pacVO.setPacno(pacno); INSERT 不需要
				pacVO.setEmpno(empno);
				pacVO.setPacname(pacname);
				pacVO.setPaccountry(paccountry);
				pacVO.setPaccity(paccity);
				pacVO.setPactotalday(pactotalday);
				pacVO.setPacprice(pacprice);
				pacVO.setPacdeposit(pacdeposit);
				pacVO.setPacdiv(pacdiv);
				pacVO.setPaccontent(paccontent);
				pacVO.setPactchar1(b1);
				pacVO.setPactchar2(b2);  //bao2.toByteArray()
				pacVO.setPacremark(pacremark);
				pacVO.setPacstatus(pacstatus);
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("pacVO", pacVO); // 含有輸入格式錯誤的pacVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/pac/addPac.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				PacService pacSvc = new PacService();
				pacVO = pacSvc.addPac(empno,pacname,paccountry,paccity,
					    pactotalday,pacprice,pacdeposit,pacdiv,paccontent,b1,b2,
					    pacremark,pacstatus);

				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/backend/pac/listAllPac.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllPac.jsp
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/pac/addPac.jsp");
				failureView.forward(req, res);
			}
		}
		 
		 if ("insertX".equals(action)) { // 來自addPac.jsp的請求  
				
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);

				try {
					/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
					
					String empno =req.getParameter("empno").trim();
					String empnoReg= "^[E][M][P]000\\d\\d\\d$";
					if (empno == null || empno.trim().length() == 0) {
						errorMsgs.add("管理員編號: 請勿空白");
					} else if(!empno.toUpperCase().trim().matches(empnoReg)) { //以下練習正則(規)表示式(regular-expression)
						errorMsgs.add("管理員編號: 只能是加上EMP接六碼數字");
		            }
					String pacname = req.getParameter("pacname");
					if(pacname.length() < 120 && pacname.trim().length()>0) {
						
					}else {
						errorMsgs.add("套裝行程名稱: 只能是中、英文字母、數字和_ , 且長度必需在2到120之間??");
					}
					
					String paccountryReg = "^[(\u4e00-\u9fa5)\\,\\~\\，\\-\\.\\-(a-zA-Z)\\D]{2,60}$";
					String paccountry = req.getParameter("paccountry").trim();
					if (paccountry == null || paccountry.trim().length() == 0) {
						errorMsgs.add("旅遊國家請勿空白");
					}else if(!paccountry.trim().matches(paccountryReg)) { //以下練習正則(規)表示式(regular-expression)
						errorMsgs.add("旅遊國家名稱: 只能是中、英文字母不能有數字 , 且長度必需在2到120之間");
		            }	
					
					String paccityReg = "^[(\u4e00-\u9fa5)+\\,\\~\\，\\-\\.\\-(a-zA-Z)\\D]{2,120}$";
					String paccity = req.getParameter("paccity");
					if (paccity == null || paccity.trim().length() == 0) {
						errorMsgs.add("旅遊城市請勿空白");
					}else if(!paccity.trim().matches(paccityReg)) { //以下練習正則(規)表示式(regular-expression)
						errorMsgs.add("旅遊城市名稱: 只能是中、英文字母不能有數字 , 且長度必需在2到120之間");
		            }	
					
					
					
					Integer pactotalday=0;
					try {
						pactotalday = new Integer(req.getParameter("pactotalday"));
						if(pactotalday==0)
							errorMsgs.add("旅遊天數不為0");	
					} catch (Exception e) {
						errorMsgs.add("旅遊天數格式不正確");
					}
					
					Integer pacprice = 0;
					try {
						pacprice = new Integer(req.getParameter("pacprice"));
						if(pactotalday==0)
							errorMsgs.add("團費價格不為0");	
					} catch (Exception e) {
						errorMsgs.add("團費價格不正確");
					}
			
					Integer pacdeposit= 0;
					try {
						pacdeposit = new Integer(req.getParameter("pacdeposit"));
					} catch (Exception e) {
						errorMsgs.add("預繳訂金不正確");
					}
					
					String pacdiv = req.getParameter("pacdiv");
					String pacdivReg = "^[(\\u4e00-\\u9fa5)\\\\,\\\\~\\\\，\\\\-\\\\.(a-zA-Z0-9_)]{2,120}$";
					if (pacdiv == null || pacdiv.trim().length() == 0) {
						errorMsgs.add("特色標籤: 請勿空白");
					} else if(!pacdiv.trim().matches(pacdivReg)) { //以下練習正則(規)表示式(regular-expression)
						errorMsgs.add("特色標籤: 只能是中、英文字母、數字和標點符號、, 且長度必需在2到20之間");
		            }
					
					String paccontent = req.getParameter("paccontent");
					if (paccontent == null || paccontent.trim().length() == 0) {
						errorMsgs.add("行程內容: 請勿空白");
					}
					
					
					Part pactchar1=req.getPart("pactchar1");
					byte b1[]=	 new byte[pactchar1.getInputStream().available()];
					pactchar1.getInputStream().read(b1);
//					BufferedInputStream buf1=new BufferedInputStream(pactchar1.getInputStream());
//					ByteArrayOutputStream bao1=new ByteArrayOutputStream();
//					int i;
//					byte b1[]= new byte[8192];
//					while((i=buf1.read(b1))!= -1) {
//						bao1.write(b1,0,i);
//					}
//					bao1.toByteArray();
					
					Part pactchar2=req.getPart("pactchar2");
					byte b2[]=	 new byte[pactchar2.getInputStream().available()];
					pactchar2.getInputStream().read(b2);

//                  Part pactchar2=req.getPart("pactchar2");
//					BufferedInputStream buf2=new BufferedInputStream(pactchar2.getInputStream());
//					ByteArrayOutputStream bao2=new ByteArrayOutputStream();
//					int j;
//					byte b2[]= new byte[8192];
//					while((j=buf2.read(b2))!= -1) {
//						bao2.write(b2,0,j);
//					}
//					bao2.toByteArray();
					
					String pacremark = req.getParameter("pacremark");
					if (pacremark == null || pacremark.trim().length() == 0) {
						errorMsgs.add("注意事項: 請勿空白");
					}
					
					Integer pacstatus = 0;
					try {
						pacstatus = new Integer(req.getParameter("pacstatus"));
					} catch (Exception e) {
						errorMsgs.add("套裝狀態不合格式");
					}
					
					PacVO pacVO = new PacVO();
//					pacVO.setPacno(pacno); INSERT 不需要
					pacVO.setEmpno(empno);
					pacVO.setPacname(pacname);
					pacVO.setPaccountry(paccountry);
					pacVO.setPaccity(paccity);
					pacVO.setPactotalday(pactotalday);
					pacVO.setPacprice(pacprice);
					pacVO.setPacdeposit(pacdeposit);
					pacVO.setPacdiv(pacdiv);
					pacVO.setPaccontent(paccontent);
					pacVO.setPactchar1(b1);
					pacVO.setPactchar2(b2);  //bao2.toByteArray()
					pacVO.setPacremark(pacremark);
					pacVO.setPacstatus(pacstatus);
					
					if (!errorMsgs.isEmpty()) {
						req.setAttribute("pacVO", pacVO); // 含有輸入格式錯誤的pacVO物件,也存入req
						RequestDispatcher failureView = req
								.getRequestDispatcher("/backend/pac/addPacX.jsp");
						failureView.forward(req, res);
						return;
					}
					
					/***************************2.開始新增資料***************************************/
					PacService pacSvc = new PacService();
					pacVO = pacSvc.addPac(empno,pacname,paccountry,paccity,
						    pactotalday,pacprice,pacdeposit,pacdiv,paccontent,b1,b2,
						    pacremark,pacstatus);

					
					/***************************3.新增完成,準備轉交(Send the Success view)***********/
					String url = "/backend/ptp/listAllPacX.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllPac.jsp
					successView.forward(req, res);				
					
					/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
					errorMsgs.add(e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/pac/addPacX.jsp");
					failureView.forward(req, res);
				}
			}
		 if ("updateX".equals(action)) { // 來自update_emp_input.jsp的請求
				
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
				
				String requestURL = req.getParameter("requestURL"); // 送出修改的來源網頁路徑: 可能為【/emp/listAllEmp.jsp】 或  【/dept/listEmps_ByDeptno.jsp】 或 【 /dept/listAllDept.jsp】 或 【 /emp/listEmps_ByCompositeQuery.jsp】
				System.out.println("requestURL   Test0925"+requestURL);
				
				try {
					/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
					String pacno = req.getParameter("pacno").trim();
					String pacnoReg= "^[P][A][C]000\\d\\d\\d$";
					if (pacno == null || pacno.trim().length() == 0) {
						errorMsgs.add("套裝行程編號: 請勿空白");
					} else if(!pacno.toUpperCase().trim().matches(pacnoReg)) { //以下練習正則(規)表示式(regular-expression)
						errorMsgs.add("套裝行程編號: 只能是加上PAC接六碼數字");
		            }
					
					String empno =req.getParameter("empno");
					String empnoReg= "^[E][M][P]000\\d\\d\\d$";
					if (empno == null || empno.trim().length() == 0) {
						errorMsgs.add("管理員編號: 請勿空白");
					} else if(!empno.toUpperCase().trim().matches(empnoReg)) { //以下練習正則(規)表示式(regular-expression)
						errorMsgs.add("管理員編號: 只能是加上EMP接六碼數字");
		            }
					String pacname = req.getParameter("pacname");
					if(pacname.length() < 120 && pacname.trim().length()>0) {
						
					}else {
						errorMsgs.add("套裝行程名稱: 只能是中、英文字母、數字和_ , 且長度必需在2到120之間??");
					}
					String paccountryReg = "^[(\u4e00-\u9fa5)\\,\\~\\，\\-\\.(a-zA-Z)\\D]{2,120}$";
					String paccountry = req.getParameter("paccountry");
					if (paccountry == null || paccountry.trim().length() == 0) {
						errorMsgs.add("旅遊國家請勿空白");
					}else if(!paccountry.trim().matches(paccountryReg)) { //以下練習正則(規)表示式(regular-expression)
						errorMsgs.add("旅遊國家名稱: 只能是中、英文字母不能有數字 , 且長度必需在2到120之間");
		            }	
					
					String paccityReg = "^[(\u4e00-\u9fa5)+,?\\,\\~\\，\\-\\.(a-zA-Z)\\D]{2,120}$";
					String paccity = req.getParameter("paccity");
					if (paccity == null || paccity.trim().length() == 0) {
						errorMsgs.add("旅遊城市請勿空白");
					}else if(!paccity.trim().matches(paccityReg)) { //以下練習正則(規)表示式(regular-expression)
						errorMsgs.add("旅遊城市名稱: 只能是中、英文字母不能有數字 , 且長度必需在2到120之間");
		            }	
					
					Integer pactotalday = 0;
					try {
						pactotalday = new Integer(req.getParameter("pactotalday"));
					} catch (Exception e) {
						errorMsgs.add("旅遊天數格式不正確");
					}finally {
						if(pactotalday==0) {
							errorMsgs.add("旅遊天數不能為0");	
						}
					}
					
					Integer pacprice = 0;
					try {
						pacprice = new Integer(req.getParameter("pacprice"));
					} catch (Exception e) {
						errorMsgs.add("團費價格不正確");
					}finally {
						if(pactotalday==0) {
							errorMsgs.add("旅遊天數不能為0");	
						}
					}
					
					Integer pacdeposit= 0;
					try {
						pacdeposit = new Integer(req.getParameter("pacdeposit"));
					}catch (Exception e) {
						errorMsgs.add("預繳訂金不正確");
					}finally {
						if(pactotalday==0) {
							errorMsgs.add("旅遊天數不能為0");	
						}
					}
					
					String pacdiv = req.getParameter("pacdiv");
					String pacdivReg = "^[(\u4e00-\u9fa5)+,?\\,\\~\\，\\-\\.(a-zA-Z0-9_)]{2,120}$";
					if (pacdiv == null || pacdiv.trim().length() == 0) {
						errorMsgs.add("特色標籤: 請勿空白");
					} else if(!pacdiv.trim().matches(pacdivReg)) { //以下練習正則(規)表示式(regular-expression)
						errorMsgs.add("特色標籤: 只能是中、英文字母、數字和標點符號、, 且長度必需在2到120之間");
		            }
					
					String paccontent = req.getParameter("paccontent");
									
					Part pactchar1=req.getPart("pactchar1");
					byte[] imgbyte1=new byte[pactchar1.getInputStream().available()];;
//					System.out.println(pactchar1.getSize());測試用
					if(pactchar1.getSize()==0) {
						PacService pacSvc = new PacService();
						PacVO votchar1VO= pacSvc.getOnePac(pacno);
						imgbyte1 = votchar1VO.getPactchar1();
					}else {
						pactchar1.getInputStream().read(imgbyte1);
					}
					Part pactchar2=req.getPart("pactchar2");
					byte[] imgbyte2=new byte[pactchar2.getInputStream().available()];;
					if(pactchar2.getSize()==0) {
						PacService pacSvc = new PacService();
						PacVO pactchar2VO= pacSvc.getOnePac(pacno);
						imgbyte2 = pactchar2VO.getPactchar2();
					}else {
						pactchar2.getInputStream().read(imgbyte2);
					}	
					String pacremark = req.getParameter("pacremark").trim();
					if (pacremark == null || pacremark.trim().length() == 0) {
						errorMsgs.add("注意事項請勿空白");
					}	
					
					Integer pacstatus = null;
					try {
						pacstatus = new Integer(req.getParameter("pacstatus"));
					} catch (Exception e) {
						errorMsgs.add("套裝狀態不合格式");
					}

					PacVO pacVO = new PacVO();
					pacVO.setPacno(pacno);
					pacVO.setEmpno(empno);
					pacVO.setPacname(pacname);
					pacVO.setPaccountry(paccountry);
					pacVO.setPaccity(paccity);
					pacVO.setPactotalday(pactotalday);
					pacVO.setPacprice(pacprice);
					pacVO.setPacdeposit(pacdeposit);
					pacVO.setPacdiv(pacdiv);
					pacVO.setPaccontent(paccontent);
					pacVO.setPactchar1(imgbyte1);
					pacVO.setPactchar2(imgbyte2);
					pacVO.setPacremark(pacremark);
					pacVO.setPacstatus(pacstatus);
				
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("pacVO", pacVO); // 含有輸入格式錯誤的pacVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/pac/update_pac_input.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				/***************************2.開始修改資料*****************************************/
				PacService pacSvc = new PacService();
				pacVO = pacSvc.updatePac(pacno,empno,pacname,paccountry,paccity,pactotalday,pacprice,pacdeposit,pacdiv
						,paccontent,imgbyte1,imgbyte2,pacremark,pacstatus);
				
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				System.out.println(requestURL);
				if(requestURL.equals("/backend/ptp/listPtps_ByPacno.jsp") || requestURL.equals("/backend/ptp/listAllPacX.jsp"))
					req.setAttribute("listPtps_ByPacno",pacSvc.getPtpsByPacno(pacno)); // 資料庫取出的list物件,存入request
				
				String url = requestURL;
				RequestDispatcher successView = req.getRequestDispatcher(url);   // 修改成功後,轉交回送出修改的來源網頁
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/pac/update_pac_input.jsp");
				failureView.forward(req, res);
					
				}
			}

		 
		 
		 
		 
//		 	========================================================
			if ("listPtps_ByPacno_A".equals(action) || "listPtps_ByPacno_B".equals(action)) {

				List<String> errorMsgs = new LinkedList<String>();
				req.setAttribute("errorMsgs", errorMsgs);

				try {
					/*************************** 1.接收請求參數 ****************************************/
					String pacno = req.getParameter("pacno");
					String triname = req.getParameter("triname");

					/*************************** 2.開始查詢資料 ****************************************/
					PacService pacSvc = new PacService();
					Set<PtpVO> set = pacSvc.getPtpsByPacno(pacno);

					/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
					req.setAttribute("listPtps_ByPacno", set);    // 資料庫取出的list物件,存入request
					req.setAttribute("triname", triname);
					req.setAttribute("pacno", pacno);
					
					String url = null;
					if ("listPtps_ByPacno_A".equals(action))
						url = "/backend/ptp/listPtps_ByPacno.jsp";        // 成功轉交 dept/listEmps_ByDeptno.jsp
					else if ("listPtps_ByPacno_B".equals(action))
						url = "/backend/ptp/listAllPacX.jsp";              // 成功轉交 dept/listAllDept.jsp

					RequestDispatcher successView = req.getRequestDispatcher(url);
					successView.forward(req, res);

					/*************************** 其他可能的錯誤處理 ***********************************/
				} catch (Exception e) {
					throw new ServletException(e);
				}
			}
			
			
			if ("delete_Pac".equals(action)) { // 來自/dept/listAllDept.jsp的請求

				List<String> errorMsgs = new LinkedList<String>();
				req.setAttribute("errorMsgs", errorMsgs);
		
				try {
					/***************************1.接收請求參數***************************************/
					String pacno = req.getParameter("pacno");
					
					/***************************2.開始刪除資料***************************************/
					PacService pacSvc = new PacService();
					pacSvc.deletePac(pacno);
					
					/***************************3.刪除完成,準備轉交(Send the Success view)***********/
					String url = "/backend/ptp/listAllPacX.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後, 成功轉交 回到 /dept/listAllDept.jsp
					successView.forward(req, res);
					
					/***************************其他可能的錯誤處理***********************************/
				} catch (Exception e) {
					errorMsgs.add("刪除資料失敗:"+e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/ptp/listAllPacX.jsp");
					failureView.forward(req, res);
				}
			}
			
//			
			if ("delete".equals(action)) { // 來自listAllPac.jsp

				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
		
				try {
					/***************************1.接收請求參數***************************************/
					String pacno =req.getParameter("pacno");
					
					/***************************2.開始刪除資料***************************************/
					PacService pacSvc = new PacService();
					pacSvc.deletePac(pacno);
					
					/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
					String url = "/backend/pac/listAllPac.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
					successView.forward(req, res);
					
					/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
					errorMsgs.add("刪除資料失敗:"+e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/pac/listAllPac.jsp");
					failureView.forward(req, res);
				}
			}
			
			
		}
	}
		
