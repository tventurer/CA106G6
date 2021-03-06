package android.com.tri.controller;

import java.io.BufferedReader;
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
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.phd.model.PhdService;
import com.phd.model.PhdVO;
import com.tri.model.TriVO;
import com.pho.model.PhoPahVO;
import com.pho.model.PhoService;
import com.pho.model.PhoVO;
import com.tri.model.TriService;

import android.com.pah.model.PahAnService;
import android.com.pah.model.PahAnVO;

public class TriAnServlet extends HttpServlet {
       
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
		while((line = br.readLine()) != null ) {
			sb.append(line);
		}
		String jsonIn = sb.toString();
		
		JsonObject jsonObject = gson.fromJson(jsonIn, JsonObject.class);
		
		String action = jsonObject.get("action").getAsString();
		String memno = jsonObject.get("memno").getAsString();
System.out.println("jsonIn = " + jsonIn);
		
		if ("getAll".equals(action) && memno != null) {
			TriService triSvc = new TriService();
			List<TriVO> triList = triSvc.getAll();
			if (triList != null && !triList.isEmpty()) {
				writeText(res, gson.toJson(triList));
			}
		}else {
			writeText(res, gson.toJson(""));
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
