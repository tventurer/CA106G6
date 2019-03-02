package com.pac.controller;

import java.io.*;
import java.sql.*;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.DataSource;

import com.pac.model.PacService;
import com.pac.model.PacVO;

public class DBGifReader extends HttpServlet {


	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		res.setContentType("image/gif");
		ServletOutputStream out = res.getOutputStream();

		try {
			String pacno = req.getParameter("pacno");
			PacService pacSvc = new PacService();
			PacVO pacVO = pacSvc.getOnePac(pacno);
			byte[] pactchar;
			if(Integer.parseInt(req.getParameter("photo")) == 1) {
				pactchar= pacVO.getPactchar1();
			}else {
				pactchar= pacVO.getPactchar2();
			}
			out.write(pactchar);
				
		} catch (Exception e) {
			//System.out.println(e);
			InputStream in = getServletContext().getResourceAsStream("/NoData/null2.jpg");
			byte[] buf = new byte[in.available()];
			in.read(buf);
			out.write(buf);
			in.close();
		}
	}


}