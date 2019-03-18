package android.com.pah.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import android.com.pah.model.PahCountry;
import android.com.pah.model.PahCountry.PahCountryVO;

public class PahDDLAnServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		doPost(req, res);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String outStr = "";
		String action = "";
		
		//取得action決定要取出何種資料		
		action = req.getParameter("action");
		
		System.out.println("action = " + action);
		if("getCountry".equals(action)) {
			PahCountry pahCountry = new PahCountry();
			List<PahCountryVO> list = pahCountry.getAll();
			Gson gson = new Gson();
			outStr = gson.toJson(list);
		}
		
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		System.out.println("outStr = " + outStr);
		out.write(outStr);
		out.close();
	}

}
