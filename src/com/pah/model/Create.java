package com.pah.model;

import java.io.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Create")
public class Create extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		
		for(int f=0; f<=14; f++) {
			File pahitem = new File(getServletContext().getRealPath("./frontend/pah/myItem/pah"+ f +"/info.txt"));
			BufferedReader bir = new BufferedReader(new FileReader(pahitem));
			String allContent="";
			String pahinfo[] = null;
			String line = "";
			while((line = bir.readLine()) != null) {
				allContent+=line;
			}
			pahinfo = allContent.split("@");
			for(int i=0; i<pahinfo.length; i++) {
				System.out.println(pahinfo[i]);
			}
			bir.close();
			
			byte pc0[] = null;
			byte pc1[] = null;
			byte pc2[] = null;
			byte pc3[] = null;
			byte pc4[] = null;
			for(int i=0; i<5; i++) {
				File pahpc = new File(getServletContext().getRealPath("./frontend/pah/myItem/pah"+ f +"/"+i+".jpg"));
				BufferedInputStream bif = new BufferedInputStream(new FileInputStream(pahpc));
				ByteArrayOutputStream bao = new ByteArrayOutputStream();
				int len;
				byte[] b = new byte[8192];
				switch(i) {
				case 0:
					while((len = bif.read(b)) != -1) {
						bao.write(b);
					}
					pc0 = bao.toByteArray();
					break;
				case 1:
					while((len = bif.read(b)) != -1) {
						bao.write(b);
					}
					pc1 = bao.toByteArray();
					break;
				case 2:
					while((len = bif.read(b)) != -1) {
						bao.write(b);
					}
					pc2 = bao.toByteArray();
					break;
				case 3:
					while((len = bif.read(b)) != -1) {
						bao.write(b);
					}
					pc3 = bao.toByteArray();
					break;
				case 4:
					while((len = bif.read(b)) != -1) {
						bao.write(b);
					}
					pc4 = bao.toByteArray();
					break;			
				}
			}
			
			PahService pas = new PahService();
			pas.addPah(pahinfo[0], pahinfo[1], pahinfo[2], Integer.parseInt(pahinfo[3]), 
					pahinfo[4], Integer.parseInt(pahinfo[5]), java.sql.Date.valueOf(pahinfo[6]), 
					java.sql.Date.valueOf(pahinfo[7]), java.sql.Timestamp.valueOf(pahinfo[8]), 
					Integer.parseInt(pahinfo[9]), pc0, pc1, pc2, pc3, pc4, pahinfo[10]);
			
			
		}
		
		
	}


}
