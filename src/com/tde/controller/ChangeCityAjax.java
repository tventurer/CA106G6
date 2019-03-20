package com.tde.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.spo.controller.AddrToLatLong;
import com.spo.model.SpoService;

public class ChangeCityAjax extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if("getContent".equals(action)) {
			//1.接收請求參數
			String content = req.getParameter("content");
			System.out.println("content:" + content);
			String content_clean = URLDecoder.decode(content, "UTF-8");
			System.out.println("content_clean:" + content_clean);
			//2.呼叫model
			SpoService spoSvc = new SpoService();
			List<String> citys = spoSvc.getCitys(content_clean);
			
			//3.執行成功,輸出json
			String outstr = new Gson().toJson(citys);
			res.setContentType("text/plain");
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			out.println(outstr);
			out.flush();
			out.close();
		}
		
		if("getLatLong".equals(action)) {
			
			//1.接收請求參數
			String city = req.getParameter("city");
			System.out.println("city:" + city);
			
			//2.呼叫地址轉經緯度
			double[] latlng = null;
			try {
				latlng = AddrToLatLong.getLatLong(city);
			} catch (Exception e) {
				throw new RuntimeException("地址轉經緯度失敗:" + e.getMessage());
			}
			String outstr = String.valueOf(latlng[0]) + "/" + String.valueOf(latlng[1]);
			System.out.println("outstr:" + outstr);
			res.setContentType("text/plain");
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			out.println(outstr);
			out.flush();
			out.close();
		}
	}

}
