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

@WebServlet("/frontend/mpm/mpm")
public class MpmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");
		
		if ("list_my_pm".equals(action)) {
			Map<String, String> errorMsgs = new HashMap<String, String>();
			MpmService mpmSvc = new MpmService();
			String memno = (String) req.getSession().getAttribute("memno");
			List<MpmVO> list = mpmSvc.getAll().stream()
									.filter(vo -> vo.getMpmsender().equals(memno) || vo.getMpmreceiver().equals(memno))
									.collect(Collectors.toList());
			if (list.size() == 0) {
				errorMsgs.put("mpmisempty", "你沒有任何訊息哦");
			}
			
			req.setAttribute("list", list);
			String url = "/frontend/mpm/AllMyPM.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}
	}

}
