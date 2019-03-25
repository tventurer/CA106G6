package com.not.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.not.model.NotService;
import com.not.model.NotVO;

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
			
			NotService notSvc = new NotService();
			notSvc.addNot(memno, notcontent);
		}
		
		if ("read".equals(action)) {
			PrintWriter out = res.getWriter();
			NotService notSvc = new NotService();
			String notno = req.getParameter("notno");
			NotVO notVO = notSvc.getOneNot(notno);
			JSONObject json = new JSONObject();
			if (notVO.getNotreaded() == 0) {
				json.accumulate("readed", "false");
				out.print(json.toString());
				out.flush();
				out.close();
			}
			
			notVO.setNotreaded(1);
			notSvc.update(notVO);
		}
	}

}
