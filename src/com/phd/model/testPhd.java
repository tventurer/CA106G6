package com.phd.model;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/testPhd")
public class testPhd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PhdService phs = new PhdService();
		PhdVO pdv = new PhdVO();
		
//		phs.addPhd("PAH000006", "PHO000006",3);
//		pdv = phs.addPhd("PAH000007", "PHO000007",3);
//		System.out.println(pdv.getPahno());
//		System.out.println(pdv.getPhono());
//		System.out.println(pdv.getPhdnum());
//		
		System.out.println("1=========================================================");
		
		phs.deletePhd("PAH000006", "PHO000006");
		
		System.out.println("1=========================================================");
//		
//		List<PhdVO> list1 = phs.getall();
//		for(PhdVO p:list1) {
//			System.out.println(p.getPahno());
//			System.out.println(p.getPhono());
//		}
//		
//		System.out.println("1=========================================================");
//		
//		List<PhdVO> list2 = phs.getbypahno("PAH000006");
//		for(PhdVO p:list2) {
//			System.out.println(p.getPahno());
//			System.out.println(p.getPhono());
//			System.out.println(p.getPhdnum());
//		}
//		
//		System.out.println("1=========================================================");
//		
//		List<PhdVO> list3 = phs.getbyphono("PHO000007");
//		for(PhdVO p:list3) {
//			System.out.println(p.getPahno());
//			System.out.println(p.getPhono());
//			System.out.println(p.getPhdnum());
//		}
////		
		
		
		
	}
}
