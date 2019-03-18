package com.pah.model;

import java.io.IOException;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ScheduleUnloadPah extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//       
//	Timer timer;
//	int i=0;
//	
//	public void init() {
//		TimerTask timertask = new TimerTask() {
//			@Override
//			public void run() {
//				PahService pas = new PahService();
//				List<PahVO> pahList = pas.();
//				long curTime = new java.util.Date().getTime();
//				for(PahVO pahVO:pahList) {
//					long pahDown = pahVO.getPahdown().getTime();
//					if(curTime < pahDown) {
//						pas.updateStatus(1, pahVO.getPahno());
//						System.out.println(pahVO.getPahno());
//					}
//				}
//			}
//		};
//		timer = new Timer();
//		Calendar cal = new GregorianCalendar(2019, Calendar.MARCH, 1, 0, 0, 0);
//		timer.scheduleAtFixedRate(timertask, cal.getTime(), 1*1*100*1000);
//	    System.out.println("已建立排成");       
//	}
//	
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	}
//	
//	public void destroy() {
//		timer.cancel();
//        System.out.println("已移除排程!");
//	}


}
