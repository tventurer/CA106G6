package com.tde.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.spo.controller.AddrToLatLong;
import com.spo.model.SpoService;

public class ChangeCityAjax extends HttpServlet {
	
	Map<String,double[]> cityLatlng = new HashMap<String,double[]>();
	
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
			
			//將城市緯經度存入map減少多次呼叫使用google 金鑰
			cityLatlng.put("基隆市",new double[]{25.1276033, 121.7391833});	//基隆市
			cityLatlng.put("台北市",new double[]{25.0329694, 121.5654177}); //台北市
			cityLatlng.put("新北市",new double[]{25.0169826, 121.4627868}); //新北市
			cityLatlng.put("桃園市",new double[]{24.9936281, 121.3009798}); //桃園市
			cityLatlng.put("台中市",new double[]{24.1477358, 120.6736482}); //台中市
			cityLatlng.put("嘉義市",new double[]{23.4800751, 120.4491113}); //嘉義市
			cityLatlng.put("新竹市",new double[]{24.8138287, 120.9674798}); //新竹市
			cityLatlng.put("宜蘭縣",new double[]{24.7021073, 121.7377502}); //宜蘭縣
			cityLatlng.put("嘉義縣",new double[]{23.4518428, 120.2554615}); //嘉義縣
			cityLatlng.put("花蓮縣",new double[]{23.9871589, 121.6015714}); //花蓮縣
			cityLatlng.put("彰化縣",new double[]{24.0517963, 120.5161352}); //彰化縣
			cityLatlng.put("新竹縣",new double[]{24.8387226, 121.0177246}); //新竹縣
			cityLatlng.put("苗栗縣",new double[]{24.560159, 120.8214265}); //苗栗縣
			cityLatlng.put("南投縣",new double[]{23.9609981, 120.9718638}); //南投縣
			cityLatlng.put("台南市",new double[]{22.9997281, 120.2270277}); //台南市
			cityLatlng.put("台東縣",new double[]{22.7972447, 121.0713702}); //台東縣
			cityLatlng.put("雲林縣",new double[]{23.7092033, 120.4313373}); //雲林縣
			cityLatlng.put("高雄市",new double[]{22.6272784, 120.3014353}); //高雄市
			cityLatlng.put("屏東縣",new double[]{22.5519759, 120.5487597}); //屏東縣
			cityLatlng.put("金門縣",new double[]{24.3487792, 118.3285644}); //金門縣
			cityLatlng.put("連江縣",new double[]{26.160243, 119.9516652}); //連江縣
			cityLatlng.put("澎湖縣",new double[]{23.571486, 119.579161}); //澎湖縣
			
			//2.呼叫map
			double[] latlng = null;
			
			latlng = cityLatlng.get(city);
			
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
