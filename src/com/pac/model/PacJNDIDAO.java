package com.pac.model;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


/**
 * Servlet implementation class Test
 */
public class PacJNDIDAO extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int count;
    public PacJNDIDAO(){
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

       
        out.println("<HTML>");
        out.println("<BODY>");
        out.println("Hello, 你好: " + (1000+count++) +"次了喔喔喔");
        out.println("</BODY></HTML>");
	
		
		
		PacDAOimpl pacJDAO =new PacDAOimpl();
		PacVO pacVO1 = new PacVO();
		pacVO1.setPacno("PAC000004");
		pacVO1.setEmpno("EMP000003");
		pacVO1.setPacname("東京春爛漫~");
		pacVO1.setPaccountry("日本");
		pacVO1.setPaccity("東京");
		pacVO1.setPactotalday(5);
		pacVO1.setPacprice(28800);
		pacVO1.setPacdeposit(5000);
		pacVO1.setPacdiv("溫泉、城市");
		pacVO1.setPaccontent("櫻花、溫泉，城市風光");
		pacVO1.setPactchar1(null);
		pacVO1.setPactchar2(null);
		pacVO1.setPacremark("");
		pacVO1.setPacstatus(2);
		pacJDAO.insert(pacVO1);	
		
	
	
	}

	

}
