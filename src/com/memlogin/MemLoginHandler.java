package com.memlogin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.mem.model.MemService;
import com.mem.model.MemVO;

import listeners.MemberSessionMapping;

@WebServlet("/MemLoginHandler")
public class MemLoginHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");
		
		if ("login".equals(action)) {
			JSONObject json = new JSONObject();
			PrintWriter out = res.getWriter();
			String mememail = req.getParameter("mememail").trim().toLowerCase();
			String password = req.getParameter("password").trim();
		
			MemService memSvc = new MemService();
			MemVO vo = memSvc.getEmailForLogin(mememail);			
			
			
			if (!isUserValid(password, vo)) {
				out.print("{}");
				return;
			}
		
			HttpSession session = req.getSession();
			session.setAttribute("memacc", vo.getMemacc());
			session.setAttribute("memno", vo.getMemno());
			session.setAttribute("memrealname", vo.getMemrealname());
			session.setAttribute("mememail", vo.getMememail());
			session.setAttribute("sessionMSM", new MemberSessionMapping(req));
			
			json.accumulate("access", "true");
			out.print(json.toString());
			out.flush();
			out.close();
			return;
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
