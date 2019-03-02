package com.pac.model;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Test
 */

public class PacJNDIDAO extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PacDAOimpl pacJDAO =new PacDAOimpl();
		PacVO pacVO1 = new PacVO();
		
		byte[] b = null;
		try {
			File file = new File("C:\\Users\\Java\\Desktop\\images\\002.jpg");
			InputStream in = new FileInputStream(file);
			b = new byte[in.available()];
			System.out.println(b.length);
			in.read(b);
			in.close();
		}catch(FileNotFoundException e) {
			e.printStackTrace();
		}catch(IOException ioe) {
			ioe.printStackTrace();
		}
		
//		pacVO1.setPacno("PAC000004");
		pacVO1.setEmpno("EMP000003");
		pacVO1.setPacname("東京春爛漫~");
		pacVO1.setPaccountry("日本");
		pacVO1.setPaccity("東京");
		pacVO1.setPactotalday(5);
		pacVO1.setPacprice(88800);
		pacVO1.setPacdeposit(85000);
		pacVO1.setPacdiv("溫泉、城市");
		pacVO1.setPaccontent("櫻花、溫泉，城市風光");
		pacVO1.setPactchar1(null);
		pacVO1.setPactchar2(b);
		pacVO1.setPacremark("");
		pacVO1.setPacstatus(2);
		pacJDAO.insert(pacVO1);			
	
	
	}

	

}
