package com.bpc.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bpc.model.BpcService;

@WebServlet("/frontend/bpc/bpc")
public class BpcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BpcServlet() {
        super();
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");
		
		if ("insert".equals(action)) {
			Map<String,String> errorMsgs = new HashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);
			String posno = req.getParameter("posno");
			String url = req.getContextPath() + "/frontend/pos/listOnePos.jsp?posno=" + posno;
			
			try {
				String memno = (String) req.getSession().getAttribute("memno");
				if (memno == null) {
					errorMsgs.put("notlogin", "請先登入");
				}
				
				String bpccontent = req.getParameter("bpccontent");
				if (bpccontent == null || bpccontent.trim().length() == 0) {
					errorMsgs.put("bpccontent", "請輸入留言內容");
				}
				
				if (!errorMsgs.isEmpty()) {
					req.getSession().setAttribute("errorMsgs", errorMsgs);					
					res.sendRedirect(url);
					return;
				}
				
				BpcService bpcSvc = new BpcService();
				bpcSvc.addBpc(memno, posno, bpccontent);
				
				res.sendRedirect(url);
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.put("Exception", e.getMessage());
				res.sendRedirect(url);
			}
		}
		
		if ("delete".equals(action)) {
			String bpcno = req.getParameter("bpcno");
			BpcService bpcSvc = new BpcService();
			
			bpcSvc.deleteBpc(bpcno);
			String url = req.getContextPath() + "/frontend/pos/listOnePos.jsp?posno=" + req.getParameter("posno");
			res.sendRedirect(url);
		}
	}

}
