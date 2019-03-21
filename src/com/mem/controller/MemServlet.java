package com.mem.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import tools.IdValidator;
import tools.PwdEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mem.model.MemService;
import com.mem.model.MemVO;

import javax.servlet.annotation.WebServlet;
@WebServlet("/backend/mem/mem")
public class MemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemServlet() {
        super();
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");
		
		if ("signup".equals(action)) {
			Map<String,String> errorMsgs = new HashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				MemService memSvc = new MemService();
				List<MemVO> list = memSvc.getAll();
				
				String memacc = req.getParameter("memacc");
				String memaccReg = "[a-zA-Z0-9]+";
				if (memacc == null || memacc.trim().length() == 0) {
					errorMsgs.put("memacc", "會員帳號: 請勿空白");
				} else if (!memacc.trim().matches(memaccReg)) {
					errorMsgs.put("memacc", "會員帳號: 只能使用英文與阿拉伯數字(a-z, A-Z, 0-9)");
				}
				
				boolean isAccDupe = list.stream()
										.anyMatch(vo -> vo.getMemacc().toLowerCase().equals(memacc.toLowerCase()));
				
				if (isAccDupe) {
					errorMsgs.put("memacc", memacc + "已被使用，換個帳號再來吧");
				}
				
				String mempwd = req.getParameter("mempwd");
				String mempwdReg = "[a-zA-Z0-9]+";
				if (mempwd == null || mempwd.trim().length() == 0) {
					errorMsgs.put("mempwd", "會員密碼: 請勿空白");
				} else if (mempwd.trim().length() < 4 || mempwd.trim().length() > 20) {
					errorMsgs.put("mempwd", "會員密碼: 密碼長度必須是4-20個字元");
				} 
				if (!mempwd.trim().matches(mempwdReg)) {
					String condition = errorMsgs.get("mempwd") == null? "" : errorMsgs.get("mempwd"); 
					errorMsgs.put("mempwd", condition + "會員密碼: 只能使用英文與阿拉伯數字(a-z, A-Z, 0-9)");
				}
				
				String mememail = req.getParameter("mememail").toLowerCase();
				String mememailReg = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$";
				if (mememail == null || mememail.trim().length() == 0) {
					errorMsgs.put("mememail", "會員信箱: 請勿空白");
				} else if (!mememail.trim().matches(mememailReg)) {
					errorMsgs.put("mememail", "會員信箱: 請輸入正確的email");
				}
				
				boolean isEmailDupe = list.stream()
						.anyMatch(vo -> vo.getMememail().toLowerCase().equals(mememail.toLowerCase()));

				if (isEmailDupe) {
					errorMsgs.put("mememail", "該信箱已被註冊，換個信箱再來吧");
				}
				
				String memrealname = req.getParameter("memrealname");
				if (memrealname == null || memrealname.trim().length() == 0) {
					errorMsgs.put("memrealname", "會員姓名: 請輸入姓名");
				}
				
				String memengname = req.getParameter("memengname");
				String memengnameReg = "[a-zA-Z ]+";
				if (memengname.trim().length() != 0 && !memengname.trim().matches(memengnameReg)) {
					errorMsgs.put("memengname", "英文姓名: 請輸入正確的英文姓名");
				}
				
				String memphone = req.getParameter("memphone");
				String memphoneReg = "^09[0-9]{8}";
				if (memphone.trim().length() != 0 && !memphone.trim().matches(memphoneReg)) {
					errorMsgs.put("memphone", "電話號碼: 請輸入正確的電話號碼(不需要加-, 例如:0912345678)");
				}
				
				java.sql.Date membirth = null;
				try {
					membirth = java.sql.Date.valueOf(req.getParameter("membirth").trim());
				} catch (Exception e) {
					errorMsgs.put("membirth", "日期格式錯誤");
				}
				
				String memaddr = req.getParameter("memaddr").trim();
				
				String memidno = req.getParameter("memidno");
				if (memidno != null && memidno.trim().length() != 0) {
					if (!IdValidator.isIdValid(memidno.trim())) {
						errorMsgs.put("memidno", "身分證號碼: 格式不正確");
					}
				}
				
				String membankacc = req.getParameter("membankacc").trim();
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = 
							req.getRequestDispatcher("/frontend/mem/memsignup.jsp");
					failureView.forward(req, res);
					return;
				}
				
				MemVO vo = memSvc.addMem(memacc, PwdEncoder.encode(mempwd), mememail, 0, memrealname, memengname, memphone, membirth, memaddr, memidno, membankacc);
				
				HttpSession session = req.getSession();
				session.setAttribute("memacc", vo.getMemacc());
				session.setAttribute("memno", vo.getMemno());
				session.setAttribute("memrealname", vo.getMemrealname());
				session.setAttribute("mememail", vo.getMememail());
				
				String fromwhere = (String) session.getAttribute("fromwhere");
				
				if (fromwhere != null) {
					res.addHeader("Refresh", "5; URL=" + fromwhere);
				} else {
					res.addHeader("Refresh", "5; URL=" + req.getContextPath() + "/index.jsp");
					session.setAttribute("fromwhere", req.getContextPath() + "/index.jsp");
				}
				
				
				String url = "/backend/mem/signup_success.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.put("Exception", e.getMessage());
				RequestDispatcher failureView = 
						req.getRequestDispatcher("/frontend/mem/memsignup.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("insert".equals(action)) {
			Map<String,String> errorMsgs = new HashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				String memacc = req.getParameter("memacc");
				String memaccReg = "[a-zA-Z0-9]+";
				if (memacc == null || memacc.trim().length() == 0) {
					errorMsgs.put("memacc", "會員帳號: 請勿空白");
				} else if (!memacc.trim().matches(memaccReg)) {
					errorMsgs.put("memacc", "會員帳號: 只能使用英文與阿拉伯數字(a-z, A-Z, 0-9)");
				}
				
				String mempwd = req.getParameter("mempwd");
				String mempwdReg = "[a-zA-Z0-9]+";
				if (mempwd == null || mempwd.trim().length() == 0) {
					errorMsgs.put("mempwd", "會員密碼: 請勿空白");
				} else if (mempwd.trim().length() < 4 || mempwd.trim().length() > 20) {
					errorMsgs.put("mempwd", "會員密碼: 密碼長度必須是4-20個字元");
				} 
				if (!mempwd.trim().matches(mempwdReg)) {
					String condition = errorMsgs.get("mempwd") == null? "" : errorMsgs.get("mempwd"); 
					errorMsgs.put("mempwd", condition + "會員密碼: 只能使用英文與阿拉伯數字(a-z, A-Z, 0-9)");
				}
				
				String mememail = req.getParameter("mememail");
				String mememailReg = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$";
				if (mememail == null || mememail.trim().length() == 0) {
					errorMsgs.put("mememail", "會員信箱: 請勿空白");
				} else if (!mememail.trim().matches(mememailReg)) {
					errorMsgs.put("mememail", "會員信箱: 請輸入正確的email");
				}
				
				String memrealname = req.getParameter("memrealname");
				if (memrealname == null || memrealname.trim().length() == 0) {
					errorMsgs.put("memrealname", "會員姓名: 請輸入姓名");
				}
				
				String memengname = req.getParameter("memengname");
				String memengnameReg = "[a-zA-Z ]+";
				if (!memengname.trim().matches(memengnameReg)) {
					errorMsgs.put("memengname", "英文姓名: 請輸入正確的英文姓名");
				}
				
				String memphone = req.getParameter("memphone");
				String memphoneReg = "^09[0-9]{8}";
				if (!memphone.trim().matches(memphoneReg)) {
					errorMsgs.put("memphone", "電話號碼: 請輸入正確的電話號碼(不需要加-, 例如:0912345678)");
				}
				
				java.sql.Date membirth = null;
				try {
					membirth = java.sql.Date.valueOf(req.getParameter("membirth").trim());
				} catch (Exception e) {
					errorMsgs.put("membirth", "日期格式錯誤");
				}
				
				String memaddr = req.getParameter("memaddr").trim();
				
				String memidno = req.getParameter("memidno");
				if (memidno != null && memidno.trim().length() != 0) {
					if (!IdValidator.isIdValid(memidno.trim())) {
						errorMsgs.put("memidno", "身分證號碼: 格式不正確");
					}
				}
				
				String membankacc = req.getParameter("membankacc").trim();
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = 
							req.getRequestDispatcher("/backend/mem/addMem.jsp");
					failureView.forward(req, res);
					return;
				}
				
				MemService memSvc = new MemService();
				memSvc.addMem(memacc, PwdEncoder.encode(mempwd), mememail, 0, memrealname, memengname, memphone, membirth, memaddr, memidno, membankacc);
				
				String url = "/frontend/mem/listAllMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.put("Exception", e.getMessage());
				RequestDispatcher failureView = 
						req.getRequestDispatcher("/backend/mem/addMem.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("update".equals(action)) {
			Map<String, String> errorMsgs = new HashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);
			String requestURL = req.getParameter("requestURL");
			String forwardURL = req.getParameter("forwardURL");
			
			try {
				String memno = req.getParameter("memno");
				String memacc = req.getParameter("memacc");
				
				String mempwd = req.getParameter("mempwd");
				String mempwdReg = "[a-zA-Z0-9]+";
				if (mempwd == null || mempwd.trim().length() == 0) {
					errorMsgs.put("mempwd", "會員密碼: 請勿空白");
				} else if (mempwd.trim().length() < 4 || mempwd.trim().length() > 20) {
					errorMsgs.put("mempwd", "會員密碼: 密碼長度必須是4-20個字元");
				} 
				if (!mempwd.trim().matches(mempwdReg)) {
					String condition = errorMsgs.get("mempwd") == null? "" : errorMsgs.get("mempwd"); 
					errorMsgs.put("mempwd", condition + "會員密碼: 只能使用英文與阿拉伯數字(a-z, A-Z, 0-9)");
				}
				
				String mememail = req.getParameter("mememail");
				String mememailReg = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$";
				if (mememail == null || mememail.trim().length() == 0) {
					errorMsgs.put("mememail", "會員信箱: 請勿空白");
				} else if (!mememail.trim().matches(mememailReg)) {
					errorMsgs.put("mememail", "會員信箱: 請輸入正確的email");
				}
				
				Integer mememailvalid = Integer.parseInt(req.getParameter("mememailvalid").trim());
				
				String memrealname = req.getParameter("memrealname");
				if (memrealname == null || memrealname.trim().length() == 0) {
					errorMsgs.put("memrealname", "會員姓名: 請輸入姓名");
				}
				
				String memengname = req.getParameter("memengname");
				String memengnameReg = "[a-zA-Z ]+";
				if (!memengname.trim().matches(memengnameReg)) {
					errorMsgs.put("memengname", "英文姓名: 請輸入正確的英文姓名");
				}
				
				String memphone = req.getParameter("memphone");
				String memphoneReg = "^09[0-9]{8}";
				if (!memphone.trim().matches(memphoneReg)) {
					errorMsgs.put("memphone", "電話號碼: 請輸入正確的電話號碼(不需要加-, 例如:0912345678)");
				}
				
				java.sql.Date membirth = null;
				try {
					membirth = java.sql.Date.valueOf(req.getParameter("membirth").trim());
				} catch (Exception e) {
					errorMsgs.put("membirth", "日期格式錯誤");
				}
				
				String memaddr = req.getParameter("memaddr").trim();
				
				String memidno = req.getParameter("memidno");
				if (memidno != null && memidno.trim().length() != 0) {
					if (!IdValidator.isIdValid(memidno.trim())) {
						errorMsgs.put("memidno", "身分證號碼: 格式不正確");
					}
				}
				
				String membankacc = req.getParameter("membankacc").trim();
				
				MemVO memVO = new MemVO();
				memVO.setMemno(memno);
				memVO.setMemacc(memacc);
				memVO.setMempwd(mempwd);
				memVO.setMememail(mememail);
				memVO.setMememailvalid(mememailvalid);
				memVO.setMemrealname(memrealname);
				memVO.setMemengname(memengname);
				memVO.setMemphone(memphone);
				memVO.setMembirth(membirth);
				memVO.setMemaddr(memaddr);
				memVO.setMemidno(memidno);
				memVO.setMembankacc(membankacc);
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("memVO", memVO);
					RequestDispatcher failureView = 
							req.getRequestDispatcher(forwardURL);
					failureView.forward(req, res);
					return;
				}
				
				MemService memSvc = new MemService();
				memVO = memSvc.updateMem(memno, memacc, PwdEncoder.encode(mempwd), mememail, mememailvalid, memrealname, memengname, memphone, membirth, memaddr, memidno, membankacc);
				
				RequestDispatcher successView = req.getRequestDispatcher(requestURL);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.put("Exception", e.getMessage());
				RequestDispatcher failureView = 
						req.getRequestDispatcher(forwardURL);
				failureView.forward(req, res);
			}
		}
		
		if ("getOne_For_Display".equals(action)) {
			Map<String, String> errorMsgs = new HashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);
			String requestURL = req.getParameter("requestURL");
			
			try {
				String memno = req.getParameter("memno").trim().toUpperCase();
				String memnoReg = "^MEM\\d{6}$";
				if (memno == null || memno.length() == 0) {
					errorMsgs.put("queryByMemno", "請輸入會員編號");
				} else if (!memno.matches(memnoReg)) {
					errorMsgs.put("queryByMemno", "會員編號: 格式錯誤(必須為MEM開頭後接6位數字)");
				}
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
					failureView.forward(req, res);
				}
			} catch (Exception e) {
				errorMsgs.put("Exception", e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}
		
		if ("getOne_For_Update".equals(action)) {
			Map<String, String> errorMsgs = new HashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);
			String requestURL = req.getParameter("requestURL");
			
			try {
				String memno = req.getParameter("memno");
				MemService memSvc = new MemService();
				MemVO memVO = memSvc.getOneMem(memno);
				req.setAttribute("memVO", memVO);
				
				String url = "/backend/mem/update_mem_input.jsp";
				req.setAttribute("forwardURL", url);
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.put("Exception", "無法取得資料: " + e.getMessage());
				RequestDispatcher failureView = 
						req.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}
	}

}
