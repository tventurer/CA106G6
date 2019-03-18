package android.com.tde.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.tde.model.TdeService;

import android.com.spo.model.SpoAnService;
import android.com.spo.model.SpoAnVO;

public class TdeAnServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		out.write("Get Works");
		out.close();
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		BufferedReader br = req.getReader();
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = br.readLine()) != null){
			sb.append(line);
		}
		String jsonIn = sb.toString();
		
		JsonObject jsonObject = gson.fromJson(jsonIn,  JsonObject.class);
		String action = jsonObject.get("action").getAsString();
		String trino = jsonObject.get("trino").getAsString();
		System.out.println("jsonIn = " + jsonIn);
		
		if("getDays".equals(action) && trino != null) {
			TdeService tdeSvc = new TdeService();
			List<String> daysList = tdeSvc.getDays(trino);
			writeText(res, gson.toJson(daysList));
		}
		else {
			writeText(res, "");
		}
		
	}
	
	private void writeText(HttpServletResponse res, String output) throws IOException{
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		out.write(output);
		out.close();
     	System.out.println("output = " + output);
	}
}
