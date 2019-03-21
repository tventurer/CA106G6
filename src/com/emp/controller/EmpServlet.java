package com.emp.controller;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.emp.model.EmpService;
import com.emp.model.EmpVO;
@MultipartConfig(fileSizeThreshold=1024*1024, maxFileSize=5*1024*1024, maxRequestSize=5*5*1024*1024)
public class EmpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//登入比對
	protected String allowUser(String account, String password) {
		EmpService empSvc = new EmpService();
		String ans = null;
		try {
		EmpVO empVO = empSvc.checkIn(account);
			if(empVO.getEmpmail().equals(account) && (!empVO.getEmppwd().equals(password))){
				ans="errorpwd";
			}else{ 
				ans="bingo";
			}
		} catch (Exception e) {
			ans="noemail";
		}
	     return ans;
	  }

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//頁面顯示
		req.setCharacterEncoding("UTF-8");
		res.setContentType("image/gif");
		res.setContentType("image/jpeg");
		ServletOutputStream outpic = res.getOutputStream();
		
		try {
			String empno = req.getParameter("empno");
			EmpService empSvc = new EmpService();
			com.emp.model.EmpVO empVO = empSvc.getOneEmp(empno);
	
			byte[] pic = empVO.getEmppic();
			outpic.write(pic);
		}catch (Exception e) {
			InputStream in = getServletContext().getResourceAsStream("/NoData/null2.jpg");
			byte[] pic = new byte[in.available()];
			in.read(pic);
			outpic.write(pic);
			in.close();
		}
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		//登入比對account
		if("account".equals(action)) {
			res.setContentType("text/html; charset=UTF-8");

		    // 【取得使用者 帳號(account) 密碼(password)】
		    String account = req.getParameter("email");
		    String password = req.getParameter("password");
		    
		    List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

		    // 【檢查該帳號 , 密碼是否有效】
		    if (allowUser(account, password).equals("errorpwd")) {          //【帳號 , 密碼無效時】
		    	RequestDispatcher failureView = req.getRequestDispatcher("/empLogin.jsp");
		    	errorMsgs.add("errorpwd");
				failureView.forward(req, res);
				return;
		     
		    }else if(allowUser(account, password).equals("noemail")){
		    	RequestDispatcher failureView = req.getRequestDispatcher("/empLogin.jsp");
		    	errorMsgs.add("noemail");
				failureView.forward(req, res);
				return;
		    }else{                                       //【帳號 , 密碼有效時, 才做以下工作】
		      HttpSession session = req.getSession();
		      EmpService empSvc = new EmpService();
			  EmpVO empVO = empSvc.checkIn(account);
		      session.setAttribute("account", account);   //*工作1: 才在session內做已經登入過的標識
		      String empno = new String(empVO.getEmpno());
		      session.setAttribute("empno", empno);
		      try {                                                        
		         String location = (String) session.getAttribute("location");
		         if (location != null) {
		           session.removeAttribute("location");   //*工作2: 看看有無來源網頁 (-->如有來源網頁:則重導至來源網頁)
		           res.sendRedirect(location);            
		           return;
		         }
		       }catch (Exception ignored) { }

		      res.sendRedirect(req.getContextPath()+"/backend/emp/empIndex.jsp");  //*工作3: (-->如無來源網頁:則重導至empIndex.jsp)
		    }
		}
		    
		
		if("getOne_For_Display".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>(); //錯誤判斷塞訊息是每個if一直跑，用ArrayList塞錯誤訊息應該會比較快，為何使用LinkedList
			req.setAttribute("errorMsgs", errorMsgs); //為什麼errorMsgs物件可以先塞，後面if才用add方法加?是因為errorMsgs物件還沒真的跑完servlet動作就還未放到request內嗎?
			
			try {
				//1.請求參數錯誤處理
				String empno = req.getParameter("empno");
				String empnoReg = "^[E][M][P][0-9]{6}$";
				if(empno == null || (empno.trim()).length() == 0) {
					errorMsgs.add("管理員編號: 請勿空白");
				}else if(!(empno.trim()).matches(empnoReg)) {
					errorMsgs.add("管理員前三碼需為EMP，後六碼為數字。");
				}
				
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/emp/select_page.jsp");
					failureView.forward(req, res);
					return;
				}
				//2.查詢資料
				EmpService empSvc = new EmpService();
				EmpVO empVO = empSvc.getOneEmp(empno);
				
				if(empVO == null) {
					errorMsgs.add("查無資料");
				}
				if(!errorMsgs.isEmpty()){
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/emp/select_page.jsp");
					failureView.forward(req, res);
					return;
				}
				//3.轉交資料
				req.setAttribute("empVO", empVO);
				RequestDispatcher successView = req.getRequestDispatcher("/backend/emp/listOneEmp.jsp");
				successView.forward(req, res);
			}catch(Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/emp/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		if("getOne_For_Update".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				//1.接收參數
				String empno = req.getParameter("empno");
				//2.查詢資料
				EmpService empSvc = new EmpService();
				EmpVO empVO = empSvc.getOneEmp(empno);
				//3.查詢轉交
				req.setAttribute("empVO", empVO);
				RequestDispatcher successView = req.getRequestDispatcher("/backend/emp/update_emp_input.jsp");
				successView.forward(req, res);
				//錯誤處理
			}catch(Exception e) {
				errorMsgs.add("無法取得要修改的資料" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/emp/listAllEmp.jsp");
				failureView.forward(req, res);
			}
			
		}
		
		if ("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				//1.接收參數
				//管理員編號
				String empno = req.getParameter("empno");
				//管理員姓名
				String empname = req.getParameter("empname");
				String empnameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$"; //^$開始結束 //\u4e00-\u9fa5這是中文字範圍另外a-zA-Z0-9_也可 //{2,10}2到10位
				if (empname == null || empname.trim().length() == 0) { //null判斷是加分，其實不用，因為表單沒東西是傳空字串
					errorMsgs.add("管理員姓名: 請勿空白");
				} else if(!empname.trim().matches(empnameReg)) { //以下練習正則(規)表示式(regular-expression) //matches是比regex
					errorMsgs.add("管理員姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
	            }
				//管理員密碼
				String emppwd = req.getParameter("emppwd");
				String emppwdReg = "^[(a-zA-Z0-9)]{1,10}$";
				if (emppwd == null || emppwd.trim().length() == 0) {
					errorMsgs.add("管理員密碼: 請勿空白");
				} else if(!emppwd.trim().matches(emppwdReg)) {
					errorMsgs.add("管理員密碼: 只能是數字與英文字母 , 長度必需在1到10之間");
	            }
				//管理員性別
				Integer empgen = new Integer(req.getParameter("empgen"));

				//管理員電話
				String empphone = req.getParameter("empphone");
				String empphoneReg = "^[0-9]{2}-[0-9]{1,8}$";
				if (empphone == null || empphone.trim().length() == 0) {
					errorMsgs.add("管理員電話: 請勿空白");
				} else if(!empphone.trim().matches(empphoneReg)) {
					errorMsgs.add("管理員電話: 只能是數字，區碼與電話號碼間請用橫線區隔");
	            }
				//管理員手機
				String empcell = req.getParameter("empcell");
				String empcellReg = "^[0][9][0-9]{8}$";
				if (empcell == null || empcell.trim().length() == 0) {
					errorMsgs.add("管理員手機: 請勿空白");
				} else if(!empcell.trim().matches(empcellReg)) {
					errorMsgs.add("管理員手機: 只能是為數字10碼");
	            }
				//管理員email
				String empmail = req.getParameter("empmail");
				String empmailReg = "^.*@.*\\..*$";
				if (empmail == null || empmail.trim().length() == 0) {
					errorMsgs.add("管理員email: 請勿空白");
				} else if(!empmail.trim().matches(empmailReg)) {
					errorMsgs.add("管理員email: 請輸入正確email");
	            }
				//管理員部門
				String empdept = req.getParameter("empdept");

				//管理員職務
				String empposi = req.getParameter("empposi").trim();
				if (empposi == null || empposi.trim().length() == 0) {
					errorMsgs.add("職位請勿空白");
				}
				//管理員薪資
				Integer empsal = null;
				try {
					String empsalStr = req.getParameter("empsal");
					if(empsalStr == null || empsalStr.trim().length() == 0) {
						errorMsgs.add("薪資請勿空白");
						empsalStr="0";
					}
					empsal = new Integer(empsalStr.trim());
				} catch (NumberFormatException e) {
					empsal = 0;
					errorMsgs.add("薪水請填數字."); 
				}
				//管理員到職日
				java.sql.Date empdoe = null;
				try {
					empdoe = java.sql.Date.valueOf(req.getParameter("empdoe").trim());
				} catch (IllegalArgumentException e) {
					empdoe=new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				//管理員照片
				byte[] emppic = null;
				Part part = req.getPart("emppic");
				if(part.getSize() != 0) {
					InputStream in = part.getInputStream();
					emppic = new byte[in.available()];
					in.read(emppic);
					in.close();
				}else {
					EmpService empSvc = new EmpService();
					EmpVO empVO = empSvc.getOneEmp(empno);
					emppic = empVO.getEmppic();
				}
				
				EmpVO empVO = new EmpVO();
				empVO.setEmpno(empno);
				empVO.setEmpname(empname);
				empVO.setEmppwd(emppwd);
				empVO.setEmpgen(empgen);
				empVO.setEmpphone(empphone);
				empVO.setEmpcell(empcell);
				empVO.setEmpmail(empmail);
				empVO.setEmpdept(empdept);
				empVO.setEmpposi(empposi);
				empVO.setEmpsal(empsal);
				empVO.setEmpdoe(empdoe);
				empVO.setEmppic(emppic);
				
				if(!errorMsgs.isEmpty()) {
					req.setAttribute("empVO", empVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/emp/update_emp_input.jsp");
					failureView.forward(req, res);
					return;
				}
				
				//2.更新資料
				EmpService empSvc = new EmpService();
				empSvc.updateEmp(empno, empname, emppwd, empgen, empphone, empcell, empmail, empdept, empposi, empsal, empdoe, emppic);
				//3.更新後轉交
				req.setAttribute("empVO", empVO);
				RequestDispatcher successView = req.getRequestDispatcher("/backend/emp/listOneEmp.jsp");
				successView.forward(req, res);
				
				//其他錯誤
			}
			catch(Exception e){
				errorMsgs.add("資料修改失敗" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/emp/emp");
				failureView.forward(req, res);
			}
		}
		
		if ("insert".equals(action)) { // 來自addEmp.jsp的請求  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				//管理員姓名
				String empname = req.getParameter("empname");
				String empnameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$"; //^$開始結束 //\u4e00-\u9fa5這是中文字範圍另外a-zA-Z0-9_也可 //{2,10}2到10位
				if (empname == null || empname.trim().length() == 0) { //null判斷是加分，其實不用，因為表單沒東西是傳空字串
					errorMsgs.add("管理員姓名: 請勿空白");
				} else if(!empname.trim().matches(empnameReg)) { //以下練習正則(規)表示式(regular-expression) //matches是比regex
					errorMsgs.add("管理員姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
	            }
				//管理員密碼
				String emppwd = req.getParameter("emppwd");
				String emppwdReg = "^[(a-zA-Z0-9)]{1,10}$";
				if (emppwd == null || emppwd.trim().length() == 0) {
					errorMsgs.add("管理員密碼: 請勿空白");
				} else if(!emppwd.trim().matches(emppwdReg)) {
					errorMsgs.add("管理員密碼: 只能是數字與英文字母 , 長度必需在1到10之間");
	            }
				//管理員性別
				Integer empgen = new Integer(req.getParameter("empgen"));

				//管理員電話
				String empphone = req.getParameter("empphone");
				String empphoneReg = "^[0-9]{2}-[0-9]{1,8}$";
				if (empphone == null || empphone.trim().length() == 0) {
					errorMsgs.add("管理員電話: 請勿空白");
				} else if(!empphone.trim().matches(empphoneReg)) {
					errorMsgs.add("管理員電話: 只能是數字，區碼與電話號碼間請用橫線區隔");
	            }
				//管理員手機
				String empcell = req.getParameter("empcell");
				String empcellReg = "^[0][9][0-9]{8}$";
				if (empcell == null || empcell.trim().length() == 0) {
					errorMsgs.add("管理員手機: 請勿空白");
				} else if(!empcell.trim().matches(empcellReg)) {
					errorMsgs.add("管理員手機: 只能是為數字10碼");
	            }
				//管理員email
				String empmail = req.getParameter("empmail");
				String empmailReg = "^.*@.*\\..*$";
				if (empmail == null || empmail.trim().length() == 0) {
					errorMsgs.add("管理員email: 請勿空白");
				} else if(!empmail.trim().matches(empmailReg)) {
					errorMsgs.add("管理員email: 請輸入正確email");
	            }
				//管理員部門
				String empdept = req.getParameter("empdept");

				//管理員職務
				String empposi = req.getParameter("empposi").trim();
				if (empposi == null || empposi.trim().length() == 0) {
					errorMsgs.add("職位請勿空白");
				}
				//管理員薪資
				Integer empsal = null;
				try {
					String empsalStr = req.getParameter("empsal");
					String empsalStrReg = "^[0-9]{1,10}$";
					if(empsalStr == null || empsalStr.trim().length() == 0) {
						errorMsgs.add("薪資請勿空白");
					}
					empsal = new Integer(empsalStr.trim());
				} catch (NumberFormatException e) {
					empsal = 0;
					errorMsgs.add("薪水請填數字."); 
				}
				//管理員到職日
				java.sql.Date empdoe = null;
				try {
					empdoe = java.sql.Date.valueOf(req.getParameter("empdoe").trim());
				} catch (IllegalArgumentException e) {
					empdoe=new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				//管理員照片
				Part part = req.getPart("emppic"); //用傳過來的參數取得想要的照片的part
				InputStream in = part.getInputStream();
				byte[] emppic = new byte[in.available()];
				in.read(emppic);
				in.close();

				EmpVO empVO = new EmpVO();
				empVO.setEmpname(empname);
				empVO.setEmppwd(emppwd);
				empVO.setEmpgen(empgen);
				empVO.setEmpphone(empphone);
				empVO.setEmpcell(empcell);
				empVO.setEmpmail(empmail);
				empVO.setEmpdept(empdept);
				empVO.setEmpposi(empposi);
				empVO.setEmpsal(empsal);
				empVO.setEmpdoe(empdoe);
				empVO.setEmppic(emppic);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("empVO", empVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/emp/addEmp.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				EmpService empSvc = new EmpService();
				empVO = empSvc.addEmp(empname, emppwd, empgen, empphone, empcell, empmail, empdept, empposi, empsal, empdoe, emppic);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/backend/emp/listAllEmp.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("資料新增失敗" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/emp/addEmp.jsp");
				failureView.forward(req, res);
			}
		}
		
		if("delete".equals(action)) {
			List<String> errorMsgs = new LinkedList<>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				String empno = req.getParameter("empno");
				
				EmpService empSvc = new EmpService();
				empSvc.deleteEmp(empno);
				
				RequestDispatcher successView = req.getRequestDispatcher("/backend/emp/listAllEmp.jsp");
				successView.forward(req, res);
			}catch(Exception e) {
				errorMsgs.add("資料刪除失敗" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/emp/listAllEmp.jsp");
				failureView.forward(req,  res);
			}
			
			
		}
		
		
	}

}
