package com.not.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/backend/not/not")
public class NotServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");
		
		if ("insert".equals(action)) {
			String notcontent = req.getParameter("notcontent");
			String memno = req.getParameter("receiver");
			
			Map<String, HttpSession> map = (Map<String, HttpSession>) req.getServletContext().getAttribute("ctxMSM");
			HttpSession session = map.get(memno);
			
			session.setAttribute("notification", notcontent);
		}
	}

}
