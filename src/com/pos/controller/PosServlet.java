package com.pos.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pos.model.PosService;
import com.pos.model.PosVO;

import java.util.*;

//import javax.servlet.annotation.WebServlet;
//@WebServlet("/backend/pos/pos")
public class PosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PosServlet() {
        super();
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");
		
		
		if ("mem_newpost".equals(action)) {
			HttpSession session = req.getSession();
			Map<String, String> errorMsgs = new HashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);
			String memno = (String) session.getAttribute("memno");
			String poscontent = req.getParameter("poscontent");
			
			try {
				if (memno == null) {
					session.setAttribute("location", req.getContextPath() + "/frontend/pos/NewPost.jsp");
					session.setAttribute("poscontent", poscontent);
					res.sendRedirect(req.getContextPath() + "/memlogin.jsp");
					return;
				}
				
				String tagno = req.getParameter("tagno");
				String postitle = req.getParameter("postitle").trim();
				if (postitle == null || postitle.length() == 0) {
					errorMsgs.put("postitle", "請輸入文章標題");
				}
				
				if (poscontent.replaceAll("<[^>]*>","").replaceAll("&nbsp","").trim().length() <= 30) {
					errorMsgs.put("poscontent", "文章內容不得低於30字");
				}
				
				PosVO posVO = new PosVO();
				posVO.setMemno(memno);
				posVO.setTagno(tagno);
				posVO.setPostitle(postitle);
				posVO.setPoscontent(poscontent);
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView =
							req.getRequestDispatcher("/frontend/pos/NewPost.jsp");
					failureView.forward(req, res);
					return;
				}
				PosService posSvc = new PosService();
				posVO = posSvc.addPos(memno, tagno, postitle, poscontent);
				
				
				String url = req.getContextPath() + "/frontend/pos/listOnePos.jsp?posno=" + posVO.getPosno();
				res.sendRedirect(url);
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.put("Exception", e.getMessage());
				RequestDispatcher failureView = 
						req.getRequestDispatcher("/frontend/pos/NewPost.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("insert".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				String memno = req.getParameter("memno").toUpperCase();
				String memnoReg = "^MEM\\d{6}$";
				if (memno == null || memno.trim().length() == 0) {
					errorMsgs.add("會員編號: 請勿空白");
				} else if (!memno.trim().matches(memnoReg)) {
					errorMsgs.add("會員編號: 格式錯誤(必須為MEM開頭後接6位數字)");
				}
				
				String tagno = req.getParameter("tagno");
				String tagnoReg = "^[^a-zA-Z]$";
				if (tagno == null || tagno.trim().length() == 0) {
					errorMsgs.add("文章標籤編號: 請勿空白");
				} else if (!tagno.trim().matches(tagnoReg)) {
					errorMsgs.add("文章標籤編號: 格式錯誤(只能輸入數字)");
				}
				
				String postitle = req.getParameter("postitle");
				if (postitle == null || postitle.trim().length() == 0) {
					errorMsgs.add("請輸入文章標題");
				} 
				
				String poscontent = req.getParameter("poscontent");
				if (poscontent == null || poscontent.trim().length() == 0) {
					errorMsgs.add("請輸入文章內容");
				}
				
				PosVO posVO = new PosVO();
				posVO.setMemno(memno);
				posVO.setTagno(tagno);
				posVO.setPostitle(postitle);
				posVO.setPoscontent(poscontent);
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("posVO", posVO);
					RequestDispatcher failureView =
							req.getRequestDispatcher("/backend/pos/addPos.jsp");
					failureView.forward(req, res);
					return;
				}
				
				PosService posSvc = new PosService();
				posVO = posSvc.addPos(memno, tagno, postitle, poscontent);
				
				String url = "/backend/pos/listAllPos.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = 
						req.getRequestDispatcher("/backend/pos/addPos.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("delete".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			String url = req.getParameter("url");
			
			try {
				String posno = req.getParameter("posno").toUpperCase();
				
				
				PosService posSvc = new PosService();
				posSvc.deletePos(posno);
				
				res.sendRedirect(url);
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗: " + e.getMessage());
				res.sendRedirect(url);
			}
		}
		
		if ("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				String posno = req.getParameter("posno");
				String memno = req.getParameter("memno");
				String postime = req.getParameter("postime");
				
				String tagno = req.getParameter("tagno");
				String tagnoReg = "^[^a-zA-Z]$";
				if (tagno == null || tagno.trim().length() == 0) {
					errorMsgs.add("文章標籤編號: 請勿空白");
				} else if (!tagno.trim().matches(tagnoReg)) {
					errorMsgs.add("文章標籤編號: 格式錯誤(只能輸入數字)");
				}
				
				String postitle = req.getParameter("postitle");
				if (postitle == null || postitle.trim().length() == 0) {
					errorMsgs.add("請輸入文章標題");
				} 
				
				String poscontent = req.getParameter("poscontent");
				if (poscontent == null || poscontent.trim().length() == 0) {
					errorMsgs.add("請輸入文章內容");
				}
				
				PosVO posVO = new PosVO();
				posVO.setTagno(tagno);
				posVO.setPostitle(postitle);
				posVO.setPoscontent(poscontent);
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("posVO", posVO);
					RequestDispatcher failureView = 
							req.getRequestDispatcher("/backend/pos/update_pos_input.jsp");
					failureView.forward(req, res);
					return;
				}
				
				PosService posSvc = new PosService();
				posVO = posSvc.updatePos(posno, memno, tagno, postitle, poscontent, postime);
				
				req.setAttribute("posVO", posVO);
				String url = "/backend/pos/listOnePos.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = 
						req.getRequestDispatcher("/backend/pos/update_pos_input.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("getOne_For_Display".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				String posno = req.getParameter("posno");
				String posnoReg = "^POS\\d{6}$";
				if (posno == null || posno.trim().length() == 0) {
					errorMsgs.add("請輸入文章編號");
				} else if (!posno.trim().matches(posnoReg)) {
					errorMsgs.add("文章編號: 格式錯誤(必須為POS開頭後接6位數字)");
				}
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView =
							req.getRequestDispatcher("/backend/pos/select_page.jsp");
					failureView.forward(req, res);
					return;
				}
				
				PosService posSvc = new PosService();
				PosVO posVO = posSvc.getOnePos(posno);
				
				if (posVO == null) {
					errorMsgs.add("查無資料");
				}
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView =
							req.getRequestDispatcher("/backend/pos/select_page.jsp");
					failureView.forward(req, res);
					return;
				}
				
				req.setAttribute("posVO", posVO);
				String url = "/backend/pos/listOnePos.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
			} catch (Exception e) {
				errorMsgs.add("無法取得資料: " + e.getMessage());
				RequestDispatcher failureView = 
						req.getRequestDispatcher("/backend/pos/update_pos_input.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("getOne_For_Update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				String posno = req.getParameter("posno");
				
				PosService posSvc = new PosService();
				PosVO posVO = posSvc.getOnePos(posno);
				
				req.setAttribute("posVO", posVO);
				String url = "/backend/pos/update_pos_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料: " + e.getMessage());
				RequestDispatcher failureView = 
						req.getRequestDispatcher("/backend/pos/listAllPos.jsp");
				failureView.forward(req, res);
			}
		}
	}

}
