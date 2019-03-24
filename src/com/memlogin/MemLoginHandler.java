package com.memlogin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mem.model.MemService;
import com.mem.model.MemVO;

import listeners.MemberSessionMapping;
import tools.PwdEncoder;

@WebServlet("/MemLoginHandler")
public class MemLoginHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");
		
		if ("login".equals(action)) {
			String mememail = req.getParameter("mememail").trim().toLowerCase();
			String password = req.getParameter("password").trim();
		
			MemService memSvc = new MemService();
			MemVO vo = memSvc.getEmailForLogin(mememail);			
			
			if (!isUserValid(password, vo)) {
				req.setAttribute("denied", "帳號密碼錯誤");
				RequestDispatcher accessdenied = 
						req.getRequestDispatcher("/memlogin.jsp");
				accessdenied.forward(req, res);
				return;
			}
		
			HttpSession session = req.getSession();
			session.setAttribute("memacc", vo.getMemacc());
			session.setAttribute("memno", vo.getMemno());
			session.setAttribute("memrealname", vo.getMemrealname());
			session.setAttribute("mememail", vo.getMememail());
			session.setAttribute("sessionMSM", new MemberSessionMapping(req));
			
			String location = (String) session.getAttribute("location");
			String fromwhere = (String) session.getAttribute("fromwhere");
			
			System.out.println(fromwhere);
			
			try {
				
				if (location != null) {
					session.removeAttribute("location");
					res.sendRedirect(location);
					return;
				} else {
					res.setHeader("Refresh", "5; URL=" + fromwhere);
					res.sendRedirect(req.getContextPath() + "/memlogin_success.jsp");
				}
			} catch (Exception ignored) {
				res.setHeader("Refresh", "5; URL=" + fromwhere);
				res.sendRedirect(req.getContextPath() + "/memlogin_success.jsp");
			}
		}
		
		if ("logout".equals(action)) {
			HttpSession session = req.getSession();
			session.invalidate();
			res.sendRedirect(req.getContextPath() + "/memlogout.html");
		}
	}
	
	protected boolean isUserValid(String password, MemVO vo) {
		try {
			if (vo.getMempwd() == null) {
				return false;
			}
		} catch (NullPointerException e) {
			return false;
		}
		return password.equals(vo.getMempwd())? true : false;
	}
	
}
