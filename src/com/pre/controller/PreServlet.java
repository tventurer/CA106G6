package com.pre.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.acr.model.AcrService;
import com.por.model.PorService;
import com.por.model.PorVO;
import com.pre.model.PreService;
import com.pre.model.PreVO;
import com.pur.model.PurService;
import com.pur.model.PurVO;

@MultipartConfig
public class PreServlet extends HttpServlet{
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
			if(pic !=null) {
				out.write(pic);
			}
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		 if ("insert".equals(action)) { //來自addPor.jsp的請求  
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);

				try {
					/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
					String memno = req.getParameter("memno").trim();
					String empno = req.getParameter("empno").trim();
					String purid = req.getParameter("purid").trim();
					Integer prelabel = new Integer(req.getParameter("prelabel"));
					
					String precause = req.getParameter("precause").trim();
					if (precause == null || precause.trim().length() == 0) {
						errorMsgs.add("檢舉原因不得為空白");
					}
					PreVO preVO = new PreVO();
 					preVO.setMemno(memno);
					preVO.setEmpno(empno);
					preVO.setPrelabel(prelabel);
					preVO.setPrecause(precause);
					preVO.setPurid(purid);

					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						req.setAttribute("preVO", preVO); // 含有輸入格是錯誤的PorVO物件，也存入req
						RequestDispatcher failureView = req
								.getRequestDispatcher("/frontend/pur/purListOne.jsp?purid="+purid);
						failureView.forward(req, res);
						return;
					}
					
					/******************************2.開始新增資料***************************************/
					
					PreService preSvc = new PreService();
					preVO = preSvc.addPre(memno, purid, empno, precause, 0, prelabel, 0);					
					
					/***************************3.新增完成，準備轉交(Send the Success view)***********/
					String url = req.getContextPath()+"/frontend/pur/purListOne.jsp?purid="+purid;
					res.sendRedirect(url); 
					/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
					errorMsgs.add(e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/pur/purListOne.jsp");
					failureView.forward(req, res);
				}
			}
		 if ("up_preresult".equals(action)) { // 來自listOneSellPur.jsp的請求

				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
				
//				try {
					/***************************1.接收請求參數****************************************/
					String preid = new String(req.getParameter("preid").trim());
					
					Integer preresult = new Integer(req.getParameter("preresult"));

					/***************************2.開始查詢資料****************************************/
					PreService preSvc = new PreService();
					PreVO preVO = preSvc.updatePreresult(preresult, preid);
					
					/***************************3.查詢完成,準備轉交(Send the Success view)************/
					String url = "/backend/pre/listAllPre.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 listAllPre.jsp
					successView.forward(req, res);

					/***************************其他可能的錯誤處理**********************************/
//				} catch (Exception e) {
//					errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/backend/pre/listAllPre.jsp");
//					failureView.forward(req, res);
//				}
			}
	}
	
}
