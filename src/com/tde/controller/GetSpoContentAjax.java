package com.tde.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.spo.model.SpoService;
import com.spo.model.SpoVO;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

public class GetSpoContentAjax extends HttpServlet {
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		//1.接收請求參數
		String sponame = req.getParameter("sponame");
		
		System.out.println("sponame:" + sponame);
		
		//2.呼叫model
		SpoService spoSvc = new SpoService();
		SpoVO spoVO = spoSvc.getAllByName(sponame);
		
		//清空圖片byte[]改以base64傳送
		byte[] b = spoVO.getSpopic();
	  	String encodeImg = null;
	  	if(b != null){
	  		encodeImg = Base64.encode(b);
	  	}
		spoVO.setSpopic(null);
		
		//3.執行成功,輸出json
		String outstr = new Gson().toJson(spoVO);
		System.out.println(outstr);
		String[] outstrWithBase64 = { outstr, encodeImg };
		String finalStr = new Gson().toJson(outstrWithBase64);
		res.setContentType("text/plain");
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		out.write(finalStr);
		out.flush();
		out.close();
		
	}

}
