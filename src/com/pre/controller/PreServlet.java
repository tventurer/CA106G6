package com.pre.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.pur.model.PurService;
import com.pur.model.PurVO;

@MultipartConfig
public class PreServlet extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
			// TODO Auto-generated method stub
			req.setCharacterEncoding("utf-8");
			res.setContentType("image/gif");
			ServletOutputStream out = res.getOutputStream();
		
			String purid =req.getParameter("purid");
			
			PurService purSvc = new PurService();
			PurVO purVO=(PurVO) purSvc.getOnePur(purid);
			System.out.println(purid);
			
			byte[] pic =purVO.getPurpic();
			if(pic !=null) {
				out.write(pic);
			}
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
	}
	
}
