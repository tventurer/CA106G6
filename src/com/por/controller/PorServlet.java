package com.por.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.acr.model.AcrService;
import com.acr.model.AcrVO;
import com.por.model.PorService;
import com.por.model.PorVO;


public class PorServlet extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
			// TODO Auto-generated method stub
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

//				try {
					/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
					String memno = req.getParameter("memno");
					String memnoReg = "MEM+[0-9][0-9][0-9][0-9][0-9][0-9]";
					if (memno == null || memno.trim().length() == 0) {
						errorMsgs.add("會員編號：請勿空白");
					} else if(!memno.trim().matches(memnoReg)) { //以下練習正則(規)表示式(regular-expression)
						errorMsgs.add("會員編號：只能是英文字母開頭為MEM、數字，且長度必須是9碼");
		            }
					
					String purid =req.getParameter("purid");
					System.out.println(purid);
					
					Integer porsum = 0;
					porsum = new Integer(req.getParameter("porsum").trim());
					if (porsum == 0) {
						errorMsgs.add("此商品已無存貨，請重新選擇");
					}
					
					Integer porprice = new Integer(req.getParameter("porprice").trim());
					
					String poraddress = req.getParameter("poraddress").trim();
					if (poraddress == null || poraddress.trim().length() == 0) {
						errorMsgs.add("收貨地址請勿空白");
					}
					
					String portel = req.getParameter("portel");
					String portelReg = "09+[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]";
					if (portel == null || portel.trim().length() == 0) {
						errorMsgs.add("連絡電話：請勿空白");
					} else if(!portel.trim().matches(portelReg)) { //以下練習正則(規)表示式(regular-expression)
						errorMsgs.add("連絡電話：只能是開頭為09，且長度必須共10碼");
		            }
					
					String pormemname = req.getParameter("pormemname").trim();
					if (pormemname == null || pormemname.trim().length() == 0) {
						errorMsgs.add("收件者請勿空白");
					}
					
					Integer porstatus = new Integer(req.getParameter("porstatus").trim());
					
					Integer porlogistics = new Integer(req.getParameter("porlogistics").trim());

					Integer porbuyscore = 0;
					String porbuycontent = null;
					Integer porsellscore = 0;
					String porsellcontent = null;
					byte[] porqr = null;
					
					String purname = req.getParameter("purname").trim();
					String acrend = "購買代購商品："+purname;
					
					Integer acrtotal = 0;
					acrtotal = new Integer(req.getParameter("acrtotal").trim());
					if (acrtotal == 0 || acrtotal == null) {
						acrtotal=0;
						errorMsgs.add("無您的存款數字");
					}
					
					acrtotal=acrtotal-porprice;
					if(acrtotal<0) {
						errorMsgs.add("請儲值");
						
					}
						
					PorVO porVO = new PorVO();
					
					porVO.setPurid(purid);
					porVO.setMemno(memno);
					porVO.setPormemname(pormemname);
					porVO.setPorsum(porsum);
					porVO.setPorprice(porprice);
					porVO.setPoraddress(poraddress);
					porVO.setPortel(portel);
					porVO.setPorstatus(porstatus);
					porVO.setPorlogistics(porlogistics);
					
					porVO.setPorbuyscore(porbuyscore);
					porVO.setPorbuycontent(porbuycontent);
					porVO.setPorsellscore(porsellscore);
					porVO.setPorsellcontent(porsellcontent);
					porVO.setPorqr(porqr);

					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						req.setAttribute("porVO", porVO); // 含有輸入格是錯誤的PorVO物件，也存入req
						RequestDispatcher failureView = req
								.getRequestDispatcher("/frontend/por/addOnePor.jsp");
						failureView.forward(req, res);
						return;
					}
					
					/******************************2.開始新增資料***************************************/
					
					PorService porSvc = new PorService();
					porVO = porSvc.addPor(purid, memno, pormemname,porprice, poraddress, portel, porstatus, porbuyscore, porbuycontent, porsellscore, porsellcontent, porsum, porlogistics, porqr);
					
					AcrService acrSvc = new AcrService();
					AcrVO acrVO = acrSvc.addAcr(memno, (-porprice), 0 , acrend, acrtotal);
					
					/***************************3.新增完成，準備轉交(Send the Success view)***********/
					String url = "/frontend/por/successPor.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllPor.jsp
					successView.forward(req, res);				
					
					/***************************其他可能的錯誤處理**********************************/
//				} catch (Exception e) {
//					errorMsgs.add(e.getMessage());
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/frontend/por/addOnePor.jsp");
//					failureView.forward(req, res);
//				}
			}
	
	
	}
}
