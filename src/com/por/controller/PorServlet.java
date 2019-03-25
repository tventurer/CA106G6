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
import com.mem.model.MemService;
import com.mem.model.MemVO;
import com.mpm.model.MpmService;
import com.por.model.PorService;
import com.por.model.PorVO;
import com.pur.model.PurService;
import com.pur.model.PurVO;

 
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
		
		 if ("show_One_Pur_ListPor".equals(action)) { //來自listSellPor.jsp的請求  
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);

				try {
					/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
					String purid = req.getParameter("purid");
					if (!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req
								.getRequestDispatcher("/frontend/por/listSellPor.jsp");
						failureView.forward(req, res);
						return;//程式中斷
					}
					/******************************2.開始新增資料***************************************/
					
					PorService porSvc = new PorService();
					List<PorVO> porVO = porSvc.getPurAll(purid);
					
					/***************************3.新增完成，準備轉交(Send the Success view)***********/
					RequestDispatcher successView = req.getRequestDispatcher("/frontend/por/listOneSellPur.jsp");
					successView.forward(req, res);	
					
					/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
					errorMsgs.add(e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/por/listSellPor.jsp");
					failureView.forward(req, res);
				}
			}

		 
		 if ("go_sellgivescore".equals(action)) { // 來自listOneSellPur.jsp的請求

				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
				
				try {
					/***************************1.接收請求參數****************************************/
					String porid = new String(req.getParameter("porid"));
					String purid = new String(req.getParameter("purid"));
					
					String porsellcontent = req.getParameter("porsellcontent").trim();
					if (porsellcontent == null || porsellcontent.trim().length() == 0) {
						errorMsgs.add("評價內容請勿空白");
					}
					
					Integer porsellscore = 0;
					Integer porsellscore2 = 0;
					
					try {
						porsellscore = new Integer(req.getParameter("porsellscore"));
					} catch (NumberFormatException e) {
						porsellscore2 = new Integer(req.getParameter("porsellscore2"));
						porsellscore = porsellscore2;
						if(porsellscore == 0) {
							errorMsgs.add("評分不得為零");
						}
					}

					/***************************2.開始查詢資料****************************************/
					PorService porSvc = new PorService();
					PorVO porVO = porSvc.updatePorSellTime(porsellscore, porsellcontent, porid);
					
					/***************************3.查詢完成,準備轉交(Send the Success view)************/
					String url = "/frontend/por/listOneSellPur.jsp?purid="+purid;
					RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 listOneSellPur.jsp
					successView.forward(req, res);

					/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
					errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/por/listOneSellPur.jsp");
					failureView.forward(req, res);
				}
			}		 
		 if ("go_buygivescore".equals(action)) { // 來自listBuyPor.jsp的請求

				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
				
				try {
					/***************************1.接收請求參數****************************************/
					String porid = new String(req.getParameter("porid"));
					
					String porbuycontent = req.getParameter("porbuycontent").trim();
					if (porbuycontent == null || porbuycontent.trim().length() == 0) {
						errorMsgs.add("評價內容請勿空白");
					}
					
					Integer porbuyscore = 0;
					Integer porbuyscore2 = 0;
					
					try {
						porbuyscore = new Integer(req.getParameter("porbuyscore"));
					} catch (NumberFormatException e) {
						porbuyscore2 = new Integer(req.getParameter("porbuyscore2"));
						porbuyscore = porbuyscore2;
						if(porbuyscore == 0) {
							errorMsgs.add("評分不得為零");
						}
					}

					/***************************2.開始查詢資料****************************************/
					PorService porSvc = new PorService();
					PorVO porVO = porSvc.updatePorBuyTime(porbuyscore, porbuycontent, porid);
					
					/***************************3.查詢完成,準備轉交(Send the Success view)************/
					String url = "/frontend/por/listBuyPor.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 listBuyPor.jsp
					successView.forward(req, res);

					/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
					errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/por/listBuyPor.jsp");
					failureView.forward(req, res);
				}
			}	
		 if ("updata_porlogistics_rs".equals(action)) { // 來自listOneSellPur.jsp的請求

				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);

//				try {
					/***************************1.接收請求參數****************************************/
					String porid = new String(req.getParameter("porid").trim());
//					String purid = new String(req.getParameter("purid").trim());
					Integer porlogistics = new Integer(req.getParameter("porlogistics"));

					Integer porstatus = new Integer(req.getParameter("porstatus"));

					PorService porSvc = new PorService();
					PorVO porVO = porSvc.getOnePor(porid);
					String purid = porVO.getPurid();
					Integer checklogistics = porVO.getPorlogistics();
					String buymemno = porVO.getMemno();
					String memno = new String(req.getParameter("memno").trim());

					if(checklogistics != porlogistics) {

								porSvc.updatePorStatusTime(porstatus, porid);



					/***************************2.開始查詢資料****************************************/
					porSvc.updatePorlogistics(porlogistics, porid);

					/***************************3.查詢完成,準備轉交(Send the Success view)************/
					if(memno.equals(buymemno)) {//是買家
						String url = req.getContextPath()+"/frontend/por/listBuyPor.jsp?memno="+memno;
						res.sendRedirect(url);// 成功轉交 listBuyPor.jsp
					}else if(!memno.equals(buymemno)){
						String url = req.getContextPath()+"/frontend/por/listOneSellPur.jsp?purid="+purid+"&memno="+memno;
						res.sendRedirect(url);// 成功轉交 listOneSellPur.jsp
					}else {
						String url = req.getContextPath()+"/frontend/por/listOneSellPur.jsp?purid="+purid+"&memno="+memno;
						res.sendRedirect(url);// 成功轉交 listOneSellPur.jsp
					}

					}
					/***************************其他可能的錯誤處理**********************************/
//				} catch (Exception e) {
//					errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/frontend/por/listOneSellPur.jsp");
//					failureView.forward(req, res);
//				}
					}
		 
		 if ("updata_porstatus".equals(action)) { // 來自listBuyPor.jsp的請求 

				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
				PorService porSvc = new PorService();
				PurService purSvc = new PurService();
				MpmService mpmSvc = new MpmService();
				MemService memSvc = new MemService();


//				try {
					/***************************1.接收請求參數****************************************/
					String porid = new String(req.getParameter("porid"));
					Integer porstatus = new Integer(req.getParameter("porstatus"));
					PorVO porVO = porSvc.getOnePor(porid);
					Integer checkstatus = porVO.getPorstatus();
					if(checkstatus != porstatus) {
					String purid=porVO.getPurid();//此商品編號
					PurVO purVO = purSvc.getOnePur(purid);//找到賣家帳號
					String sellmemno = purVO.getMemno();//賣家帳號
					String buymemno = porVO.getMemno();//買家帳號
					
					if(porstatus == 1) {//買家確認商品沒問題，錢將轉給賣家
						
						Integer momeny = porVO.getPorprice();//這筆訂單的價格
						String acrend = "訂單編號為："+purid+"，交易完成已將金額轉入您的儲值。";
						
						
						
						AcrService acrSvc = new AcrService();
						Integer acrtotal = acrSvc.getMemacrtotal(sellmemno);
						acrtotal = acrtotal + momeny;
						acrSvc.addAcr(sellmemno, momeny, 1, acrend, acrtotal);
						
						porSvc.updatePorStatusTime(porstatus, porid);
						
						String url = req.getContextPath()+"/frontend/por/listBuyPor.jsp?memno="+buymemno;
						res.sendRedirect(url); 
						return;//交易完成，在此結束
					}
					
					if(porstatus == 4 || porstatus == 7 ) {//賣家不給予退換貨，錢將轉給賣家

						Integer momeny = porVO.getPorprice();//這筆訂單的價格
						String acrend = "訂單編號為："+purid+"，交易完成已將金額轉入您的儲值。";



						AcrService acrSvc = new AcrService();
						Integer acrtotal = acrSvc.getMemacrtotal(sellmemno);
						acrtotal = acrtotal + momeny;
						acrSvc.addAcr(sellmemno, momeny, 1, acrend, acrtotal);

						porSvc.updatePorStatusTime(1, porid);

						String url = req.getContextPath()+"/frontend/por/listOneSellPur.jsp?memno="+sellmemno+"&purid="+purid;
						res.sendRedirect(url); 
						return;//交易完成，在此結束
					}
					
					if(porstatus == 9) {//退貨成功，錢將轉給買家
						
						Integer momeny = porVO.getPorprice();//這筆訂單的價格
						String acrend = "訂單編號為："+purid+"，退貨完成已將金額轉入您的儲值。";
						
						
						
						AcrService acrSvc = new AcrService();
						Integer acrtotal = acrSvc.getMemacrtotal(buymemno);
						acrtotal = acrtotal + momeny;
						acrSvc.addAcr(buymemno, momeny, 1, acrend, acrtotal);
						porSvc.updatePorlogistics(8, porid);
						porSvc.updatePorStatusTime(porstatus, porid);
						
						String url = req.getContextPath()+"/frontend/por/listOneSellPur.jsp?memno="+sellmemno+"&purid="+purid;
						res.sendRedirect(url); 
						return;//交易完成，在此結束
					}
					if(porstatus==5) {
						String sor = new String(req.getParameter("changebuy").trim());
						if(sor==null||sor.trim().length()==0) {
							errorMsgs.add("換貨原因請勿空白");
						}

						if (!errorMsgs.isEmpty()) {
							RequestDispatcher failureView = req
									.getRequestDispatcher("/frontend/por/listBuyPor.jsp?memno="+buymemno);
							failureView.forward(req, res);
							return;
						}
						MemVO memVO =memSvc.getOneMem(buymemno);
						String memname = memVO.getMemrealname();
						String mpmtitle = "有來自會員"+memname+"的換貨要求";
						String sorString = "換貨原因："+sor+"<br>"+"<a href='"+req.getContextPath()+"/frontend/por/listOneSellPur.jsp?memno="+sellmemno+"&purid="+purid+"'>訂單連結</a>";
						mpmSvc.addMpm(buymemno, sellmemno, mpmtitle, sorString);

						porSvc.updatePorStatusTime(porstatus, porid);
						String url = req.getContextPath()+"/frontend/por/listBuyPor.jsp?memno="+buymemno;
						res.sendRedirect(url);;// 成功轉交 listBuyPor.jsp
						return;
					}

					if(porstatus==2) {
						String sor = new String(req.getParameter("backbuy").trim());
						if(sor==null||sor.trim().length()==0) {
							errorMsgs.add("退貨原因請勿空白");
						}

						if (!errorMsgs.isEmpty()) {
							RequestDispatcher failureView = req
									.getRequestDispatcher("/frontend/por/listBuyPor.jsp?memno="+buymemno);
							failureView.forward(req, res);
							return;
						}
						MemVO memVO =memSvc.getOneMem(buymemno);
						String memname = memVO.getMemrealname();
						String mpmtitle = "有來自會員"+memname+"的退貨要求";
						String sorString = "退貨原因："+sor+"<br>"+"<a href='"+req.getContextPath()+"/frontend/por/listOneSellPur.jsp?memno="+sellmemno+"&purid="+purid+"'>訂單連結</a>";
						mpmSvc.addMpm(buymemno, sellmemno, mpmtitle, sorString);
						porSvc.updatePorStatusTime(porstatus, porid);
						String url = req.getContextPath()+"/frontend/por/listBuyPor.jsp?memno="+buymemno;
						res.sendRedirect(url);;// 成功轉交 listBuyPor.jsp
						return;
					}
					
					
					if(porstatus==6) {
						porSvc.updatePorlogistics(3, porid);
					}
					if(porstatus==3) {
						porSvc.updatePorlogistics(3, porid);
					}
					/***************************2.開始查詢資料****************************************/
					
					porSvc.updatePorStatusTime(porstatus, porid);
					/***************************3.查詢完成,準備轉交(Send the Success view)************/
					if(porstatus == 3 || porstatus == 4 || porstatus == 6 || porstatus == 7) {
						String url = req.getContextPath()+"/frontend/por/listOneSellPur.jsp?memno="+sellmemno+"&purid="+purid;
						res.sendRedirect(url);// 成功轉交 listOneSellPur.jsp
					}else {
						String url = req.getContextPath()+"/frontend/por/listBuyPor.jsp?memno="+buymemno;
						res.sendRedirect(url);;// 成功轉交 listBuyPor.jsp
					}
					}

					/***************************其他可能的錯誤處理**********************************/
//				} catch (Exception e) {
//					errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/frontend/por/listBuyPor.jsp");
//					failureView.forward(req, res);
//				}
			}
		 if ("updata_porlogistics".equals(action)) { // 來自listOneSellPur.jsp的請求

				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
				
//				try {
					/***************************1.接收請求參數****************************************/
					String porid = new String(req.getParameter("porid").trim());
//					String purid = new String(req.getParameter("purid").trim());
					Integer porlogistics = new Integer(req.getParameter("porlogistics"));
					PorService porSvc = new PorService();
					PorVO porVO = porSvc.getOnePor(porid);
					String purid = porVO.getPurid();
					Integer checklogistics = porVO.getPorlogistics();
					String buymemno = porVO.getMemno();
					String memno = new String(req.getParameter("memno").trim());
					
					if(checklogistics != porlogistics) {
						
					
					/***************************2.開始查詢資料****************************************/
					porSvc.updatePorlogistics(porlogistics, porid);
					
					/***************************3.查詢完成,準備轉交(Send the Success view)************/
					if(memno.equals(buymemno)) {//是買家
						String url = req.getContextPath()+"/frontend/por/listBuyPor.jsp?memno="+memno;
						res.sendRedirect(url);// 成功轉交 listBuyPor.jsp
					}else if(!memno.equals(buymemno)){
						String url = req.getContextPath()+"/frontend/por/listOneSellPur.jsp?purid="+purid+"&memno="+memno;
						res.sendRedirect(url);// 成功轉交 listOneSellPur.jsp
					}else {
						String url = req.getContextPath()+"/frontend/por/listOneSellPur.jsp?purid="+purid+"&memno="+memno;
						res.sendRedirect(url);// 成功轉交 listOneSellPur.jsp
					}
					
					}
					/***************************其他可能的錯誤處理**********************************/
//				} catch (Exception e) {
//					errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/frontend/por/listOneSellPur.jsp");
//					failureView.forward(req, res);
//				}
			}
		 
		 if ("updata_porlogistics_buy".equals(action)) { // 來自listBuyPur.jsp的請求

				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
				
				try {
					/***************************1.接收請求參數****************************************/
					String porid = new String(req.getParameter("porid"));
					Integer porlogistics = new Integer(req.getParameter("porlogistics"));
					String memno = new String(req.getParameter("memno"));
					PorService porSvc = new PorService();
					PorVO porVO = porSvc.getOnePor(porid);
					Integer checklogistics = porVO.getPorlogistics();
					
					if(checklogistics != porlogistics) {
					/***************************2.開始查詢資料****************************************/
					
					porSvc.updatePorlogistics(porlogistics, porid);
					
					/***************************3.查詢完成,準備轉交(Send the Success view)************/
					String url = req.getContextPath()+"/frontend/por/listBuyPor.jsp?memno="+memno;
					res.sendRedirect(url);// 成功轉交 listBuyPor.jsp
					}
					/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
					errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/por/listBuyPor.jsp");
					failureView.forward(req, res);
				}
			}

		 if ("insert".equals(action)) { //來自addPor.jsp的請求  
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);

				try {
					/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
					String memno = req.getParameter("memno").trim();
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
					
					PurService purSvc = new PurService();
					PurVO purVO = purSvc.findByPrimaryKey(purid);
					Integer pursell = purVO.getPursell();
					Integer purstock = purVO.getPurstock();
					pursell += porsum;
					if(purstock == pursell) {
						purSvc.updatePurstatus(2, purid);
						purSvc.updatePurSell(pursell, purid);
					}else if(purstock < pursell){
						errorMsgs.add("Hello~!你超賣了，這裡有蟲，請盡速處理");
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
					
					purSvc.updatePurSell(pursell, purid);
					
					AcrService acrSvc = new AcrService();
					acrSvc.addAcr(memno, (-porprice), 0 , acrend, acrtotal);
					
					/***************************3.新增完成，準備轉交(Send the Success view)***********/
					String url = req.getContextPath()+"/frontend/por/successPor.jsp?memno="+memno;
					res.sendRedirect(url); 
					/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
					errorMsgs.add(e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/por/addOnePor.jsp");
					failureView.forward(req, res);
				}
			}
	
	
	}
}
