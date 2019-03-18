package android.com.mem.controller;

import java.io.*;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import com.mem.model.*;

public class MemAnServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		out.println("\"Get\" Works");
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		
		StringBuilder sb = new StringBuilder();
		//從request取得reader物件把android傳過來的資料轉成字串
		BufferedReader br = req.getReader();
		String str = null;
		while((str=br.readLine()) != null) {
			sb.append(str);
		}
		String jsonStr = sb.toString();
		//利用Gson物件把傳過來的字串轉成JsonObject並取出帳號密碼
		Gson gson = new Gson();
		JsonObject jsonOb = gson.fromJson(jsonStr, JsonObject.class);
		String mememail = jsonOb.get("mememail").getAsString();
		String mempwd = jsonOb.get("mempwd").getAsString();
		//去資料庫撈會員帳號密碼並比對
		MemService memSvc = new MemService();
		List<MemVO> list = memSvc.getAll();
		Iterator<MemVO> ite = list.iterator();
		String correct = "false";
		String memacc = "";
		String memno = "";
		while(ite.hasNext()) {
			MemVO memVO = (MemVO)ite.next();
			if(memVO.getMememail().equals(mememail) && memVO.getMempwd().equals(mempwd)) {
				correct = "true";
				memacc = memVO.getMemacc();
				memno = memVO.getMemno();
				break;
			}
		}
		//判斷帳號是否正確的boolean值加回原JsonObject轉成字串送回Android
		jsonOb.addProperty("correct", correct);
		jsonOb.addProperty("memacc", memacc);
		jsonOb.addProperty("memno", memno);
		String outStr = jsonOb.toString();
		PrintWriter out = res.getWriter();
		out.println(outStr);
		System.out.println("output: " + outStr);

	}

}
