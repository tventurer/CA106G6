package com.mpm.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mpm.model.MpmService;
import com.mpm.model.MpmVO;
import tools.HtmlTagRemover;

@WebServlet("/backend/mpm/mpm")
public class MpmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");
		
		if ("send_pm".equals(action)) {
			Map<String, String> errorMsgs = new HashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				String sender = (String) req.getSession().getAttribute("memno");
				String receiver = req.getParameter("receiver");
			
				String mpmtitle = req.getParameter("mpmtitle").trim();
				if (mpmtitle == null || mpmtitle.length() == 0) {
					errorMsgs.put("mpmtitle", "私人訊息標題請勿空白");
				}
				
				String mpmcontent = HtmlTagRemover.remove(req.getParameter("mpmcontent"));
				if (mpmcontent == null || mpmcontent.length() == 0) {
					errorMsgs.put("mpmcontent", "請輸入訊息內容");
				}
				
				if (!errorMsgs.isEmpty()) {
					String url = "/backend/mpm/NewPM.jsp";
					RequestDispatcher failureView = req.getRequestDispatcher(url);
					failureView.forward(req, res);
					return;
				}
				
				MpmService mpmSvc = new MpmService();
				mpmSvc.addMpm(sender, receiver, mpmtitle, mpmcontent);
				String url = "/backend/mpm/PMsent.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.put("Exception", e.getMessage());
				String url = "/backend/mpm/NewPM.jsp";
				RequestDispatcher failureView = req.getRequestDispatcher(url);
				failureView.forward(req, res);
			}
		}
		
		if ("list_my_pm".equals(action)) {
			Map<String, String> errorMsgs = new HashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);
			MpmService mpmSvc = new MpmService();
			String memno = (String) req.getSession().getAttribute("memno");
			List<MpmVO> list = mpmSvc.getAll().stream()
									.filter(vo -> vo.getMpmsender().equals(memno) || vo.getMpmreceiver().equals(memno))
									.collect(Collectors.toList());
			
			if (list.size() == 0) {
				errorMsgs.put("mpmisempty", "你沒有任何訊息哦");
			}
			
			req.setAttribute("list", list);
			String url = "/backend/mpm/AllMyPM.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}
	}

}
