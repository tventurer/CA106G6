package com.pur.controller;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.LinkedList;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.pur.model.PurService;
import com.pur.model.PurVO;

@MultipartConfig
public class PurServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	int count = 0;      
	Timer timer;
	String strDate;
	public void init() {
		  timer = new Timer();
		  Calendar cal = new GregorianCalendar(2011, Calendar.MARCH, 5, 0, 0, 0); 
			
		  TimerTask task = new TimerTask(){
			  public void run(){
				  Calendar calendar2 = Calendar.getInstance();
				  SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
	              calendar2.add(Calendar.DATE, 1);
	              String today = sdf2.format(calendar2.getTime());
	              PurService purSvc = new PurService();
	              String start_time = today +"00:00:00";
	              String end_time = today+"23:59:59";
	              List<String> puridlist = new ArrayList<String>();
	              puridlist = purSvc.getTimeAndDown(start_time, end_time);
				  int countmemid;
				  System.out.println(puridlist);
				  if(puridlist != null) {
					  for(String purid:puridlist) {
						  purSvc.updatePurstatus(2, purid);
						  System.out.println(purid);
					  }
				  }
			  }
		  };
		  
		  GregorianCalendar gc= new GregorianCalendar();
			java.util.Date date =gc.getTime();
			SimpleDateFormat tFormat=new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
			strDate=tFormat.format(date);
			
			//取得當天的日年月日
					String stryear=strDate.substring(0, 4);
					String strmonth=strDate.substring(5, 7);
					String strday=strDate.substring(8, 10);
					
					int year=Integer.parseInt(stryear);
					int month=Integer.parseInt(strmonth);
					int day=Integer.parseInt(strday);
			 
			//取得當天00:00:00的GregorianCalendar物件，getTime()取得date物件
				GregorianCalendar gcToday=new GregorianCalendar(year, month-1, day, 0, 0, 0);
				java.util.Date today=gcToday.getTime();
				
//		        timer.scheduleAtFixedRate(task, today,20*1000); 

	        timer.scheduleAtFixedRate(task, today,1*60*60*1000); 
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
			// TODO Auto-generated method stub
			req.setCharacterEncoding("utf-8");
			res.setContentType("image/gif");
			ServletOutputStream out = res.getOutputStream();
			String purid =req.getParameter("purid");
			
			PurService purSvc = new PurService();
			PurVO purVO=(PurVO) purSvc.getOnePur(purid);
			System.out.println(purid);
			
			byte[] pic =purVO.getPurpic();
			try {
			if(pic !=null) {
				out.write(pic);
			}
			} catch (Exception e) {
				
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
				String str = req.getParameter("purid");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入商品序號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/pur/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				String purid = null;
				try {
					purid = new String(str);
				} catch (Exception e) {
					errorMsgs.add("商品序號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/pur/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				PurService purSvc = new PurService();
				PurVO purVO = purSvc.getOnePur(purid);
				if (purVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/pur/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("purVO", purVO); // 資料庫取出的purVO物件,存入req
				String url = "/frontend/pur/listOnePur.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOnePur.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/pur/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("getOneMem_For_Display".equals(action)) { // 來自select_page.jsp的請求

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
							.getRequestDispatcher("/frontend/pur/select_page.jsp");
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
							.getRequestDispatcher("/frontend/pur/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				
				/***************************2.開始查詢資料****************************************/
				PurService purSvc = new PurService();
				List<PurVO> purVO = purSvc.getMemAll(memno);
				String memnoReg = "MEM+[0-9][0-9][0-9][0-9][0-9][0-9]";
				if(!memno.trim().matches(memnoReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("會員編號：只能是英文字母開頭為MEM、數字，且長度必須是9碼");
	            }
				if (purVO.isEmpty()) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/pur/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("purVO", purVO);         // 資料庫取出的purVO物件,存入req
				String url = "/frontend/pur/listMemAllPur.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 listMemAllPur.jsp.jsp
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/pur/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("getOne_For_Update".equals(action)) { // 來自listAllPur.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				String purid = new String(req.getParameter("purid"));
				
				/***************************2.開始查詢資料****************************************/
				PurService purSvc = new PurService();
				PurVO purVO = purSvc.getOnePur(purid);
				
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("purVO", purVO);         // 資料庫取出的purVO物件,存入req
				String url = "/frontend/pur/updateOnePur.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_pur_input.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/pur/listMemPur.jsp");
				failureView.forward(req, res);
			}
		}
//		
//		
		if ("update".equals(action)) { // 來自update_pur_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				
				
				PurService purSvc = new PurService();
				String purid = new String(req.getParameter("purid").trim());
				
				String memno = req.getParameter("memno");
				String memnoReg = "MEM+[0-9][0-9][0-9][0-9][0-9][0-9]";
				if (memno == null || memno.trim().length() == 0) {
					errorMsgs.add("會員編號：請勿空白");
				} else if(!memno.trim().matches(memnoReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("會員編號：只能是英文字母開頭為MEM、數字，且長度必須是9碼");
	            }
				
				String purname = req.getParameter("purname").trim();
				if (purname == null || purname.trim().length() == 0) {
					errorMsgs.add("代購商品名稱請勿空白");
				}
				
				String purcontent = req.getParameter("purcontent").trim();
				if (purcontent == null) {
					errorMsgs.add("代購商品描述請勿空白");
				}else if(purcontent.trim().length() == 10) {
					errorMsgs.add("代購商品描述至少需填寫10個字");
				}
				
				Integer pursort = new Integer(req.getParameter("pursort").trim());
				
				String pururlReg="^(https?|ftp|file)://[-a-zA-Z0-9+&@#/%?=~_|!:,.;]*[-a-zA-Z0-9+&@#/%=~_|]$";
				String pururl = req.getParameter("pururl").trim();
				if (pururl == null|| pururl.trim().length() == 0) {
					errorMsgs.add("參考網址請勿空白");
				}else if(!pururl.trim().matches(pururlReg)) {
					errorMsgs.add("請輸入正確網址");
				}
				
				String purcountry = req.getParameter("purcountry").trim();
				if (purcountry == null || purcountry.trim().length() == 0) {
					errorMsgs.add("代購商品名稱請勿空白");
				}
				
				String purdelivery = req.getParameter("purdelivery").trim();
				if (purdelivery == null || purdelivery.trim().length() == 0) {
					errorMsgs.add("代購商品名稱請勿空白");
				}
				
				Integer purreprice = 0;
				try {
					purreprice = new Integer(req.getParameter("purreprice").trim());
				} catch (NumberFormatException e) {
					purreprice = 0;
					errorMsgs.add("參考售價請填數字");
				}
				
				Integer pursell = 0;
				try {
					pursell = new Integer(req.getParameter("pursell").trim());
				} catch (NumberFormatException e) {
					pursell = 0;
					errorMsgs.add("庫存量請填數字");
				}
				
				Integer purpricing = 0;
				try {
					purpricing = new Integer(req.getParameter("purpricing").trim());
				} catch (NumberFormatException e) {
					purpricing = 0;
					errorMsgs.add("訂單定價請填數字");
				}
				
				java.sql.Timestamp purobtained = null;
				try {
					purobtained = java.sql.Timestamp.valueOf(req.getParameter("purobtained").trim());
				} catch (IllegalArgumentException e) {
					purobtained=new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				
				Integer purreceipt = new Integer(req.getParameter("purreceipt").trim());
				
				Integer purstatus = new Integer(req.getParameter("purstatus").trim());
				
				
				java.sql.Timestamp purextime = null;
				try {
					purextime = java.sql.Timestamp.valueOf(req.getParameter("purextime").trim());
				} catch (IllegalArgumentException e) {
					purextime=new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				
				
				PurVO purVO1=(PurVO) purSvc.getOnePur(purid);
				System.out.println(purid);
				
				byte[] pic =purVO1.getPurpic();//old
				byte[] purpic;//new
				
				if(pic !=null) {
					purpic=pic;
				}else {
					Part part =null;
					part = req.getPart("purpic");
					System.out.println(part);
					long size = part.getSize();
					System.out.println(size);
					InputStream in = part.getInputStream();
					
					purpic = new byte[in.available()];
					if(in.available()!=0) {
					in.read(purpic); 
					in.close();		
					}else {
						errorMsgs.add("請上傳照片");
					}
				}
				
				
				
				Integer purstock = new Integer(req.getParameter("purstock").trim());
				
				Integer purlimit = new Integer(req.getParameter("purlimit").trim());

				PurVO purVO = new PurVO();
				purVO.setPurid(purid);
				purVO.setMemno(memno);
				purVO.setPurname(purname);
				purVO.setPurcontent(purcontent);
				purVO.setPursort(pursort);
				purVO.setPururl(pururl);
				purVO.setPurcountry(purcountry);
				purVO.setPurdelivery(purdelivery);
				purVO.setPurreprice(purreprice);
				purVO.setPurpricing(purpricing);
				purVO.setPurobtained(purobtained);
				purVO.setPurreceipt(purreceipt);
				purVO.setPurstatus(purstatus);
				purVO.setPurpic(purpic);
				purVO.setPurextime(purextime);
				purVO.setPurstock(purstock);
				purVO.setPursell(pursell);
				purVO.setPurlimit(purlimit);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("purVO", purVO); // 含有輸入格式錯誤的purVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/pur/updateOnePur.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				
				purVO = purSvc.updatePur(memno, purname, purcontent, pursort,pururl,  purcountry, purdelivery, purreprice, purpricing, purobtained, purreceipt, purstatus, purpic, purextime,  purstock, pursell,  purlimit, purid);
				purVO = purSvc.findByPrimaryKey(purid);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("purVO", purVO); // 資料庫update成功後,正確的的purVO物件,存入req
				String url = "/frontend/pur/listMemPur.jsp?memno="+memno;
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/pur/updateOnePur.jsp");
				failureView.forward(req, res);
			}
		}
		
	     if ("insert".equals(action)) { //來自addPur.jsp的請求  
	    	 	PurService purSvc = new PurService();
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);

				try {
					/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
					String memno = req.getParameter("memno");
					String memnoReg = "MEM+[0-9][0-9][0-9][0-9][0-9][0-9]";
					if (memno == null || memno.trim().length() == 0) {
						errorMsgs.add("會員編號：請勿空白");
					} else if(!memno.trim().matches(memnoReg)) { //以下練習正則(規)表示式(regular-expression)
						errorMsgs.add("會員編號：只能是英文字母開頭為MEM、數字，且長度必須是9碼");
		            }
					
					String purname = req.getParameter("purname").trim();
					if (purname == null || purname.trim().length() == 0) {
						errorMsgs.add("代購商品名稱請勿空白");
					}
					
					String purcontent = req.getParameter("purcontent").trim();
					if (purcontent == null) {
						errorMsgs.add("代購商品描述請勿空白");
					}else if(purcontent.trim().length() == 10) {
						errorMsgs.add("代購商品描述至少需填寫10個字");
					}
					
					Integer pursort = new Integer(req.getParameter("pursort").trim());
					
					String pururlReg="^(https?|ftp|file)://[-a-zA-Z0-9+&@#/%?=~_|!:,.;]*[-a-zA-Z0-9+&@#/%=~_|]$";
					String pururl = req.getParameter("pururl").trim();
					if (pururl == null|| pururl.trim().length() == 0) {
						errorMsgs.add("參考網址請勿空白");
					}else if(!pururl.trim().matches(pururlReg)) {
						errorMsgs.add("請輸入正確網址");
					}
					
					String purcountry = req.getParameter("purcountry").trim();
					if (purcountry == null || purcountry.trim().length() == 0) {
						errorMsgs.add("代購商品名稱請勿空白");
					}
					
					String purdelivery = req.getParameter("purdelivery").trim();
					if (purdelivery == null || purdelivery.trim().length() == 0) {
						errorMsgs.add("代購商品名稱請勿空白");
					}
					
					Integer purreprice = 0;
					try {
						purreprice = new Integer(req.getParameter("purreprice").trim());
					} catch (NumberFormatException e) {
						purreprice = 0;
						errorMsgs.add("參考售價請填數字");
					}
					
					Integer pursell = 0;
					try {
						pursell = new Integer(req.getParameter("pursell").trim());
					} catch (NumberFormatException e) {
						pursell = 0;
						errorMsgs.add("賣出數量請填數字");
					}
					
					Integer purpricing = 0;
					try {
						purpricing = new Integer(req.getParameter("purpricing").trim());
					} catch (NumberFormatException e) {
						purpricing = 0;
						errorMsgs.add("訂單定價請填數字");
					}
					
					java.sql.Timestamp purobtained = null;
					try {
						purobtained = java.sql.Timestamp.valueOf(req.getParameter("purobtained").trim());
					} catch (IllegalArgumentException e) {
						purobtained=new java.sql.Timestamp(System.currentTimeMillis());
						errorMsgs.add("請輸入日期!");
					}
					
					Integer purreceipt = new Integer(req.getParameter("purreceipt").trim());
					
					Integer purstatus = new Integer(req.getParameter("purstatus").trim());
					
					
					java.sql.Timestamp purextime = null;
					try {
						purextime = java.sql.Timestamp.valueOf(req.getParameter("purextime").trim());
					} catch (IllegalArgumentException e) {
						purextime=new java.sql.Timestamp(System.currentTimeMillis());
						errorMsgs.add("請輸入日期!");
					}
					
					byte[] purpic;
					Part part =null;
					part = req.getPart("purpic");
					System.out.println(part);
					
					long size = part.getSize();
					System.out.println(size);
					InputStream in = part.getInputStream();
					
					purpic = new byte[in.available()];
					if(in.available()!=0) {
					in.read(purpic); 
					in.close();		
					}else {
						errorMsgs.add("請上傳照片");
						
					}
					
					
					Integer purstock = new Integer(req.getParameter("purstock").trim());
					
					Integer purlimit = new Integer(req.getParameter("purlimit").trim());
					
					PurVO purVO = new PurVO();
					purVO.setMemno(memno);
					purVO.setPurname(purname);
					purVO.setPurcontent(purcontent);
					purVO.setPursort(pursort);
					purVO.setPururl(pururl);
					purVO.setPurcountry(purcountry);
					purVO.setPurdelivery(purdelivery);
					purVO.setPurreprice(purreprice);
					purVO.setPurpricing(purpricing);
					purVO.setPurobtained(purobtained);
					purVO.setPurreceipt(purreceipt);
					purVO.setPurstatus(purstatus);
					purVO.setPurpic(purpic);
					purVO.setPurextime(purextime);
					purVO.setPurstock(purstock);
					purVO.setPursell(pursell);
					purVO.setPurlimit(purlimit);

					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						req.setAttribute("purVO", purVO); // 含有輸入格是錯誤的purVO物件，也存入req
						RequestDispatcher failureView = req
								.getRequestDispatcher("/frontend/pur/addOnePur.jsp");
						failureView.forward(req, res);
						return;
					}
					
					/******************************2.開始新增資料***************************************/
					
					purVO = purSvc.addPur(memno, purname, purcontent, pursort, pururl, purcountry, purdelivery, purreprice, purpricing, purobtained, purreceipt, purstatus, purpic,purextime, purstock, pursell, purlimit);
					
					/***************************3.新增完成，準備轉交(Send the Success view)***********/
					String url = req.getContextPath()+"/frontend/pur/listMemPur.jsp";
					res.sendRedirect(url); 			
					
					/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/pur/addOnePur.jsp");
					failureView.forward(req, res);
				}
			}
	     
	     if ("delete".equals(action)) { // 來自listAllPur.jsp

				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
		
				try {
					/***************************1.接收請求參數***************************************/
					String purid = new String(req.getParameter("purid").trim());
					String where = new String(req.getParameter("allpur").trim());
					String memno = req.getParameter("memno").trim();
					Integer purstatus = new Integer(2);
					
					/***************************2.開始刪除資料***************************************/
					PurService purSvc = new PurService();
					purSvc.deletePur(purid,purstatus);
					
					/***************************3.刪除完成,準備轉交(Send the Success view)***********/
					String url="";
					if(where.equals("allpur")) {
						 url = "/frontend/pur/listMemPur.jsp";	
					}else if(where.equals("memallpur")){
						url ="/frontend/pur/listMemAllPur.jsp?memno="+memno;
					}
					
					RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
					successView.forward(req, res);
					
					/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
					errorMsgs.add("刪除資料失敗:"+e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/pur/listAllPur.jsp");
					failureView.forward(req, res);
				}
			}
	     
	}
}
