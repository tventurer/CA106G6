package com.emp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.emp.model.*;

public class EmpServletPic extends HttpServlet {


	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("image/gif");
		ServletOutputStream out = res.getOutputStream();
		
		String empno = req.getParameter("empno");
		
		EmpService empSvc = new EmpService();
		com.emp.model.EmpVO empVO = empSvc.getOneEmp(empno);
		
		byte[] pic = empVO.getEmppic();
		if(pic != null) {
			out.write(pic);
		}
	}

}