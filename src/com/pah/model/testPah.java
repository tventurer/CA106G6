package com.pah.model;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import java.io.File;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/testPah")
public class testPah extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PahService pah = new PahService();
		PahVO pahvo = new PahVO();
		pah.updateStatus(1, "PAH000004");
//		File fi = new File("C:/testpicture/test(1).jpeg");
//		BufferedInputStream bis1 = new BufferedInputStream(new FileInputStream(fi));
//		ByteArrayOutputStream bao1 = new ByteArrayOutputStream();
//		int i1;
//		byte b[] = new byte[8192];
//		while((i1=bis1.read(b)) != -1) {
//			bao1.write(b);
//			bao1.flush();
//		}
//		pahvo = pah.addPah("憟賡", "慦賢銋云�鈭�", "������������",  10, 9999, "FRENCE", 5, Date.valueOf("2020-1-3"),Timestamp.valueOf("2010-05-04 12:34:23") ,1 , bao1.toByteArray(), bao1.toByteArray(), bao1.toByteArray(), bao1.toByteArray(), bao1.toByteArray(), "EMP000002");
////		pahvo = pah.addPah("憟賡", "慦賢銋云�鈭�", "������������",  10, 9999.0, "FRENCE", 5, Date.valueOf("2020-12-30"),Timestamp.valueOf("2010-05-04 13:50:23") ,2 , null, null, null, null, null, "EMP000002");
////		pahvo = pah.addPah("憟賡", "慦賢銋云�鈭�", "������������",  10, 9999.0, "FRENCE", 5, Date.valueOf("2020-2-5"),Timestamp.valueOf("2010-05-04 12:34:23") ,1 , null, null, null, null, null, "EMP000002");
//		bis1.close();
//		bao1.close();
//		System.out.println(pahvo.getPahno());
//		System.out.println(pahvo.getPahname());
//		System.out.println(pahvo.getPahintro());
//		System.out.println(pahvo.getPahcontent());
//		System.out.println(pahvo.getPahpeople());
//		System.out.println(pahvo.getPahprice());
//		System.out.println(pahvo.getPahcountry());
//		System.out.println(pahvo.getPahnum());
//		System.out.println(pahvo.getPahstdate());
//		System.out.println(pahvo.getPahdown());
//		System.out.println(pahvo.getPahstatus());
//		System.out.println(pahvo.getPahpc1());
//		System.out.println(pahvo.getPahpc2());
//		System.out.println(pahvo.getPahpc3());
//		System.out.println(pahvo.getPahpc4());
//		System.out.println(pahvo.getPahpc5());
//		System.out.println(pahvo.getEmpno());
//		
//		System.out.println("1===============================================");
//		
//		pahvo = pah.updatePah("憟賜", "���������", "������������������",  20, 9989.0, "���", 5, Date.valueOf("2020-1-3"),Timestamp.valueOf("2010-05-04 12:34:23") ,1 , bao1.toByteArray(), bao1.toByteArray(), bao1.toByteArray(), bao1.toByteArray(), bao1.toByteArray(), "EMP000001", "PAH000003");
//		pahvo = pah.updatePah("憟賜", "���������", "������������������",  20, 9989.0, "���", 5, Date.valueOf("2020-1-3"),Timestamp.valueOf("2010-05-04 12:34:23") ,1 , bao1.toByteArray(), bao1.toByteArray(), bao1.toByteArray(), bao1.toByteArray(), bao1.toByteArray(), "EMP000001", "PAH000003");
//		pahvo = pah.updatePah("憟賜", "���������", "������������������",  20, 9989.0, "���", 5, Date.valueOf("2020-1-3"),Timestamp.valueOf("2010-05-04 12:34:23") ,1 , bao1.toByteArray(), bao1.toByteArray(), bao1.toByteArray(), bao1.toByteArray(), bao1.toByteArray(), "EMP000001", "PAH000003");
//		
//		System.out.println(pahvo.getPahno());
//		System.out.println(pahvo.getPahname());
//		System.out.println(pahvo.getPahintro());
//		System.out.println(pahvo.getPahcontent());
//		System.out.println(pahvo.getPahpeople());
//		System.out.println(pahvo.getPahprice());
//		System.out.println(pahvo.getPahcountry());
//		System.out.println(pahvo.getPahnum());
//		System.out.println(pahvo.getPahstdate());
//		System.out.println(pahvo.getPahdown());
//		System.out.println(pahvo.getPahstatus());
//		System.out.println(pahvo.getPahpc1());
//		System.out.println(pahvo.getPahpc2());
//		System.out.println(pahvo.getPahpc3());
//		System.out.println(pahvo.getPahpc4());
//		System.out.println(pahvo.getPahpc5());
//		System.out.println(pahvo.getEmpno());
//	
//		System.out.println("2===============================================");
//	
//		int c=1;
//		List<PahVO> pahlist = pah.findByCountry("FRENCE");
//		for(PahVO p:pahlist) {
//			System.out.println("蝚�"+c+"蝑�");
//			System.out.println(p.getPahno());
//			System.out.println(p.getPahname());
//			System.out.println(p.getPahintro());
//			System.out.println(p.getPahcontent());
//			System.out.println(p.getPahpeople());
//			System.out.println(p.getPahprice());
//			System.out.println(p.getPahcountry());
//			System.out.println(p.getPahnum());
//			System.out.println(p.getPahstdate());
//			System.out.println(p.getPahdown());
//			System.out.println(p.getPahstatus());
//			System.out.println(p.getPahpc1());
//			System.out.println(p.getPahpc2());
//			System.out.println(p.getPahpc3());
//			System.out.println(p.getPahpc4());
//			System.out.println(p.getPahpc5());
//			System.out.println(p.getEmpno());
//			c+=1;
//		}
//		c=1;
//		
//		System.out.println("3===============================================");
//		
//		List<PahVO> pahlist2 = pah.findByDate(Date.valueOf("2020-01-20"), Date.valueOf("2020-12-20"));
//		for(PahVO p:pahlist2) {
//			System.out.println("蝚�"+c+"蝑�");
//			System.out.println(p.getPahno());
//			System.out.println(p.getPahname());
//			System.out.println(p.getPahintro());
//			System.out.println(p.getPahcontent());
//			System.out.println(p.getPahpeople());
//			System.out.println(p.getPahprice());
//			System.out.println(p.getPahcountry());
//			System.out.println(p.getPahnum());
//			System.out.println(p.getPahstdate());
//			System.out.println(p.getPahdown());
//			System.out.println(p.getPahstatus());
//			System.out.println(p.getPahpc1());
//			System.out.println(p.getPahpc2());
//			System.out.println(p.getPahpc3());
//			System.out.println(p.getPahpc4());
//			System.out.println(p.getPahpc5());
//			System.out.println(p.getEmpno());
//			c+=1;
//		}
//		c=1;
//		
//		System.out.println("4===============================================");
//		
//		List<PahVO> pahlist3 = pah.findByPrice(1, 30000);
//		for(PahVO p:pahlist3) {
//			System.out.println("蝚�"+c+"蝑�");
//			System.out.println(p.getPahno());
//			System.out.println(p.getPahname());
//			System.out.println(p.getPahintro());
//			System.out.println(p.getPahcontent());
//			System.out.println(p.getPahpeople());
//			System.out.println(p.getPahprice());
//			System.out.println(p.getPahcountry());
//			System.out.println(p.getPahnum());
//			System.out.println(p.getPahstdate());
//			System.out.println(p.getPahdown());
//			System.out.println(p.getPahstatus());
//			System.out.println(p.getPahpc1());
//			System.out.println(p.getPahpc2());
//			System.out.println(p.getPahpc3());
//			System.out.println(p.getPahpc4());
//			System.out.println(p.getPahpc5());
//			System.out.println(p.getEmpno());
//			c+=1;
//		}
//		c=1;
//		
		System.out.println("5===============================================");
		
//		pah.delete("PAH000024");
	
//		System.out.println("6===============================================");
//		
//		PahVO pahvo22 = pah.findByPk("PAH000043");
////		System.out.println("蝚�"+c+"蝑�");
//		System.out.println(pahvo22.getPahno());
//		System.out.println(pahvo22.getPahname());
//		System.out.println(pahvo22.getPahintro());
//		System.out.println(pahvo22.getPahcontent());
//		System.out.println(pahvo22.getPahprice());
//		System.out.println(pahvo22.getPahcountry());
//		System.out.println(pahvo22.getPahnum());
//		System.out.println(pahvo22.getPahstdate());
//		System.out.println(pahvo22.getPahenddate());
//		System.out.println(pahvo22.getPahdown());
//		System.out.println(pahvo22.getPahstatus());
//		System.out.println(pahvo22.getPahpc1());
//		System.out.println(pahvo22.getPahpc2());
//		System.out.println(pahvo22.getPahpc3());
//		System.out.println(pahvo22.getPahpc4());
//		System.out.println(pahvo22.getPahpc5());
//		System.out.println(pahvo22.getEmpno());
		
//		List<String> country = pah.getCountry();
//		for(String a:country) {
//			System.out.println(a);
//		}
//		
	}

}
