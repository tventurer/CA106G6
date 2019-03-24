package com.tde.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.spo.model.SpoService;
import com.spo.model.SpoVO;

public class GetClassAjax extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		//1.接收請求參數
		String spoclass = req.getParameter("spoclass");
		String spocity = req.getParameter("spocity");
		
		System.out.println("spoclass:" + spoclass);
		System.out.println("spocity:" + spocity);
		
		//2.呼叫model
		SpoService spoSvc = new SpoService();
		List<SpoVO> spoList = spoSvc.getAllByClassAndCity(spoclass, spocity);
		
		//將圖片設為空值,另外處理(效能問題)
		List<SpoVO> spoListWOPic = new ArrayList<SpoVO>();
		
		for(SpoVO spoVO : spoList) {
			spoVO.setSpopic(null);
			spoListWOPic.add(spoVO);
		}
		
		
		for(int i = 0; i < spoListWOPic.size(); i++) {
			System.out.println("spopic:" + spoListWOPic.get(i).getSpopic());
		}
		
		//3.執行成功,輸出json
		String outstr = new Gson().toJson(spoListWOPic);
		System.out.println(outstr);
		res.setContentType("text/plain");
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		out.write(outstr);
		out.flush();
		out.close();
	}

}
