package com.pho.model;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/testPho")
public class testPho extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PhoService pho = new PhoService();
		PhoVO phovo = new PhoVO();
		
//		phovo = pho.addPho("ㄏㄏㄏ", "0987878858", "dindin@yahoo.com.tw", "1234-5678-4567-4568",90000 , "MEM000002");
//		phovo = pho.addPho("ㄎㄎㄎ", "0911111118", "bin@yahoo.com.tw", "1234-5678-4567-4568",90000 , "MEM000002");
//		System.out.println(phovo.getPhono());
//		System.out.println(phovo.getPhoowner());
//		System.out.println(phovo.getPhophone());
//		System.out.println(phovo.getPhomail());
//		System.out.println(phovo.getPhostdate());
//		System.out.println(phovo.getPhostatus());
//		System.out.println(phovo.getPhomark());
//		System.out.println(phovo.getPhovisa());
//		System.out.println(phovo.getPhototal());
//		System.out.println(phovo.getMemno());
		
//		System.out.println("1================================================");
//		
//		phovo = pho.updatePho("", "0911111118", "bin@yahoo.com.tw", Date.valueOf("2018-05-03"), 0, "", "5555-5555-5555-5555", 1234568, "MEM000002", "PHO000004");
//		System.out.println(phovo.getPhono());
//		System.out.println(phovo.getPhoowner());
//		System.out.println(phovo.getPhophone());
//		System.out.println(phovo.getPhomail());
//		System.out.println(phovo.getPhostdate());
//		System.out.println(phovo.getPhostatus());
//		System.out.println(phovo.getPhomark());
//		System.out.println(phovo.getPhovisa());
//		System.out.println(phovo.getPhototal());
//		System.out.println(phovo.getMemno());
//		
//		System.out.println("2================================================");
//		
//		phovo = pho.getOnePho("PHO000004");
//		System.out.println(phovo.getPhono());
//		System.out.println(phovo.getPhoowner());
//		System.out.println(phovo.getPhophone());
//		System.out.println(phovo.getPhomail());
//		System.out.println(phovo.getPhostdate());
//		System.out.println(phovo.getPhostatus());
//		System.out.println(phovo.getPhomark());
//		System.out.println(phovo.getPhovisa());
//		System.out.println(phovo.getPhototal());
//		System.out.println(phovo.getMemno());
//		
//		System.out.println("3================================================");
//		
//		int c=1;
//		List<PhoVO> pholist = pho.getall();
//		for(PhoVO p:pholist) {
//			System.out.println(""+c+"");
//			System.out.println(p.getPhono());
//			System.out.println(p.getPhoowner());
//			System.out.println(p.getPhophone());
//			System.out.println(p.getPhomail());
//			System.out.println(p.getPhostdate());
//			System.out.println(p.getPhostatus());
//			System.out.println(p.getPhomark());
//			System.out.println(p.getPhovisa());
//			System.out.println(p.getPhototal());
//			System.out.println(p.getMemno());
//			c+=1;
//		}
//		c=0;
//		
//		System.out.println("4================================================");
//	
//		pho.deletePho("PHO000004");
//	
		
		
		int c=1;
		List<PhoVO> pholist = pho.getmeorder("MEM000001");
		for(PhoVO p:pholist) {
			System.out.println(""+c+"");
			System.out.println(p.getPhono());
			System.out.println(p.getPhoowner());
			System.out.println(p.getPhophone());
			System.out.println(p.getPhomail());
			System.out.println(p.getPhostdate());
			System.out.println(p.getPhostatus());
			System.out.println(p.getPhomark());
			System.out.println(p.getPhovisa());
			System.out.println(p.getPhototal());
			System.out.println(p.getMemno());
			c+=1;
		}
		c=0;
		
	}


}
