package com.mem.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mem.model.MemService;
import com.mem.model.MemVO;

import tools.MailService;

@WebServlet("/EmailValidator/*")
public class EmailValidator extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Map<String, String> pendingList = Collections.synchronizedMap(new HashMap<String, String>());

    public EmailValidator() {
        super();
    }

	@Override
	public void init(ServletConfig cfg) throws ServletException {
		super.init(cfg);
		
		ServletContext ctx = cfg.getServletContext();
		ctx.setAttribute("pendingList", pendingList);
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");
		
		if ("ask_validation_email".equals(action)) {
			String memno = (String) req.getSession().getAttribute("memno");
			MemVO memvo = new MemService().getOneMem(memno);

			String charpool = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
			StringBuilder sb = new StringBuilder("/");			

			for (int i = 0; i < 20; i++) {
				int rnd = (int) (Math.random() * 62);
				sb.append(charpool.charAt(rnd));
			}
			
			String url = sb.toString();
			
			if (pendingList.containsKey(memno)) {
				pendingList.remove(memno);
			}
			pendingList.put(memno, url);
			
			MailService mailSvc = new MailService();
			String to = memvo.getMememail();
			String subject = memvo.getMemrealname() + "你好: 這是您的信箱驗證信";
			String link = req.getRequestURL() + url;
			String messageText = "請到" + link + "驗證您的信箱";
			mailSvc.sendMail(to, subject, messageText);
			
			RequestDispatcher successView = req.getRequestDispatcher( 
					"/backend/mem/ValidationMailSent.jsp");
			successView.forward(req, res);
			return;
		}

		String validationLink = req.getPathInfo();
		if (!pendingList.containsValue(validationLink)) {
			req.setAttribute("errorMsg", "連結無效!!!");
			RequestDispatcher failureView = req.getRequestDispatcher("/frontend/mem/ValidationFailed.jsp");
			failureView.forward(req, res);
			return;
		}
		
		String memno = (String) req.getSession().getAttribute("memno");
		if (memno == null) {
			req.setAttribute("errorMsg", "請先登入會員再點連結");
			RequestDispatcher failureView = req.getRequestDispatcher("/frontend/mem/ValidationFailed.jsp");
			failureView.forward(req, res);
			return;
		}
		
		if (pendingList.get(memno).equals(validationLink)) {
			MemService memSvc = new MemService();
			MemVO memvo = memSvc.getOneMem(memno);
			memvo.setMememailvalid(1);
			memSvc.updateMem(memvo);
			RequestDispatcher successView = req.getRequestDispatcher("/frontend/mem/ValidationSuccess.jsp");
			successView.forward(req, res);
		} else {
			req.setAttribute("errorMsg", "連結不對喔 請不要亂登別人的帳號");
			RequestDispatcher failureView = req.getRequestDispatcher("/frontend/mem/ValidationFailed.jsp");
			failureView.forward(req, res);
		}
	}
}
