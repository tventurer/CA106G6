package com.por.model;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;
import java.util.List;

import com.acr.model.AcrJDBCDAO;
import com.acr.model.AcrVO;

public class TestPorDAO {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		//測試PorJDBCDAO
		PorJDBCDAO dao = new PorJDBCDAO();
				
		//測試PorJNDIDAO
		//PorJNDIDAO dao = new PorJNDIDAO();
		
		//新增
//		PorVO porVO1 = new PorVO();
//		porVO1.setPurid("PUR000002");
//		porVO1.setMemno("MEM000001");
//		porVO1.setPormemname("吳先生");
//		porVO1.setPorprice(700);
//		porVO1.setPoraddress("桃園市中壢資策會");
//		porVO1.setPortel("0970852426");
//		porVO1.setPorstatus(0);
//		porVO1.setPorbuyscore(5);
//		porVO1.setPorbuycontent("優良賣家");
//		porVO1.setPorsellscore(5);
//		porVO1.setPorsellcontent("優良買家");
//		porVO1.setPorsum(3);
//		porVO1.setPorlogistics(2);
//		byte[] pic = getPictureByteArray("WebContent/picForm/帥嗎.jpg");
//		porVO1.setPorqr(pic);
//		dao.insert(porVO1);

		//修改
//		PorVO porVO2 = new PorVO();
//		porVO2.setPurid("PUR000002");
//		porVO2.setMemno("MEM000001");
//		porVO2.setPormemname("吳小姐");
//		porVO2.setPorprice(700);
//		porVO2.setPoraddress("桃園市中壢資策會");
//		porVO2.setPortel("0970852426");
//		porVO2.setPorstatus(0);
//		porVO2.setPorbuyscore(5);
//		porVO2.setPorbuycontent("優良賣家");
//		porVO2.setPorsellscore(5);
//		porVO2.setPorsellcontent("優良買家");
//		porVO2.setPorsum(3);
//		porVO2.setPorlogistics(2);
//		byte[] pic = getPictureByteArray("WebContent/picForm/超帥.jpeg");
//		porVO2.setPorqr(pic);
//		porVO2.setPorid("POR000004");
//		dao.update(porVO2);
		
		//刪除
//		dao.delete("POR000004");
		
		//查詢(單筆)
		PorVO porVO3 = dao.findByPrimaryKey("POR000001");
		System.out.print(porVO3.getPorid() + ",");
		System.out.print(porVO3.getPurid() + ",");
		System.out.print(porVO3.getMemno() + ",");
		System.out.print(porVO3.getPormemname() + ",");
		System.out.print(porVO3.getPorprice() + ",");
		System.out.print(porVO3.getPortime() + ",");
		System.out.print(porVO3.getPoraddress() + ",");
		System.out.print(porVO3.getPortel());
		System.out.print(porVO3.getPorstatus() + ",");
		System.out.print(porVO3.getPorbuyscore() + ",");
		System.out.print(porVO3.getPorbuycontent() + ",");
		System.out.print(porVO3.getPorsellscore() + ",");
		System.out.print(porVO3.getPorsellcontent() + ",");
		System.out.print(porVO3.getPorsum() + ",");
		System.out.println(porVO3.getPorlogistics());
		System.out.println("---------------------");
		
		//查詢(多筆)
//		List<PorVO> list = dao.getAll();
//		for(PorVO aPor : list) {
//			System.out.print(aPor.getPorid() + ",");
//			System.out.print(aPor.getPurid() + ",");
//			System.out.print(aPor.getMemno() + ",");
//	     	System.out.print(aPor.getPormemname() + ",");
//			System.out.print(aPor.getPorprice() + ",");
//			System.out.print(aPor.getPortime() + ",");
//			System.out.print(aPor.getPoraddress() + ",");
//			System.out.print(aPor.getPortel());
//			System.out.print(aPor.getPorstatus() + ",");
//			System.out.print(aPor.getPorbuyscore() + ",");
//			System.out.print(aPor.getPorbuycontent() + ",");
//			System.out.print(aPor.getPorsellscore() + ",");
//			System.out.print(aPor.getPorsellcontent() + ",");
//			System.out.print(aPor.getPorsum() + ",");
//			System.out.println(aPor.getPorlogistics());
//			System.out.println();
//		}
	}
	
	public static byte[] getPictureByteArray(String path) throws IOException {
		File file = new File(path);
		FileInputStream fis = new FileInputStream(file);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] buffer = new byte[8192];
		int i;
		while ((i = fis.read(buffer)) != -1) {
			baos.write(buffer, 0, i);
		}
		baos.close();
		fis.close();

		return baos.toByteArray();
	}
}
