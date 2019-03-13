package com.pur.model;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import com.por.model.PorVO;

public class TestPurDAO {

	public static void main(String[] args) throws ParseException, IOException {
		// TODO Auto-generated method stub
		//測試PorJDBCDAO
		PurJDBCDAO dao = new PurJDBCDAO();
						
		//測試PurJNDIDAO
		//PurJNDIDAO dao = new PurJNDIDAO();
		
		//新增
		PurVO purVO1 = new PurVO();
		purVO1.setMemno("MEM000002");
		purVO1.setPurname("亞太限定樂高");
		purVO1.setPurcontent("僅限中國和部分亞太國家限定發售的合組「LEGO 80102 舞龍」(Dragon Dance)日本太回火熱搶購中");
		purVO1.setPursort(2);
		purVO1.setPururl("https://api.dropbuy.global/deeplink/recommendationdetail/8189");
		purVO1.setPurcountry("日本");
		purVO1.setPurdelivery("臺灣");
		purVO1.setPurreprice(2885);
		purVO1.setPurpricing(3000);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY-MM-DD HH:mm");
		purVO1.setPurobtained(new Timestamp(simpleDateFormat.parse("2019-02-24 18:00").getTime()));
		purVO1.setPurreceipt(0);
		purVO1.setPurstatus(0);
		byte[] pic = getPictureByteArray("WebContent/picForm/帥嗎.jpg");
		purVO1.setPurpic(pic);
		SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("YYYY-MM-DD HH:mm");
		purVO1.setPurextime(new Timestamp(simpleDateFormat1.parse("2019-02-24 18:00").getTime()));
		purVO1.setPurstock(10);
		purVO1.setPursell(2);
		purVO1.setPurlimit(3);
		dao.insert(purVO1);
		
		//修改
//		PurVO purVO1 = new PurVO();
//		purVO1.setMemno("MEM000003");
//		purVO1.setPurname("亞太限定樂高");
//		purVO1.setPurcontent("僅限中國和部分亞太國家限定發售的合組「LEGO 80102 舞龍」(Dragon Dance)日本太回火熱搶購中");
//		purVO1.setPursort(2);
//		purVO1.setPururl("https://api.dropbuy.global/deeplink/recommendationdetail/8189");
//		purVO1.setPurcountry("日本");
//		purVO1.setPurdelivery("臺灣");
//		purVO1.setPurreprice(2885);
//		purVO1.setPurpricing(3000);
//		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY-MM-DD HH:mm");
//		purVO1.setPurobtained(new Timestamp(simpleDateFormat.parse("2019-02-24 18:00").getTime()));
//		purVO1.setPurreceipt(0);
//		purVO1.setPurstatus(0);
//		byte[] pic = getPictureByteArray("WebContent/picForm/超帥.jpeg");
//		purVO1.setPurpic(pic);
//		SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("YYYY-MM-DD HH:mm");
//		purVO1.setPurextime(new Timestamp(simpleDateFormat1.parse("2019-02-24 18:00").getTime()));
//		purVO1.setPurstock(10);
//		purVO1.setPurlimit(3);
//		purVO1.setPurid("PUR000005");
//		dao.update(purVO1);
		
		//刪除
//		dao.delete("PUR000004");
		
		//查詢(單筆)
//		PurVO purVO3 = dao.findByPrimaryKey("PUR000001");
//		System.out.print(purVO3.getPurid() + ",");
//		System.out.print(purVO3.getMemno() + ",");
//		System.out.print(purVO3.getPurname() + ",");
//		System.out.print(purVO3.getPurcontent() + ",");
//		System.out.print(purVO3.getPursort() + ",");
//		System.out.print(purVO3.getPururl() + ",");
//		System.out.print(purVO3.getPurcountry());
//		System.out.print(purVO3.getPurdelivery() + ",");
//		System.out.print(purVO3.getPurreprice() + ",");
//		System.out.print(purVO3.getPurpricing() + ",");
//		System.out.print(purVO3.getPurobtained() + ",");
//		System.out.print(purVO3.getPurtime() + ",");
//		System.out.print(purVO3.getPurreceipt() + ",");
//		System.out.print(purVO3.getPurstatus()+ ",");
//		System.out.print(purVO3.getPurextime()+ ",");
//		System.out.print(purVO3.getPurstock()+ ",");
//		System.out.print(purVO3.getPurlimit()+ ",");
//		System.out.println(purVO3.getPursavetime());
//		System.out.println("---------------------");
		
		//查詢(多筆)
//		List<PurVO> list = dao.getAll();
//		for(PurVO aPur : list) {
//			System.out.print(aPur.getPurid() + ",");
//			System.out.print(aPur.getMemno() + ",");
//			System.out.print(aPur.getPurname() + ",");
//			System.out.print(aPur.getPurcontent() + ",");
//			System.out.print(aPur.getPursort() + ",");
//			System.out.print(aPur.getPururl() + ",");
//			System.out.print(aPur.getPurcountry());
//			System.out.print(aPur.getPurdelivery() + ",");
//			System.out.print(aPur.getPurreprice() + ",");
//			System.out.print(aPur.getPurpricing() + ",");
//			System.out.print(aPur.getPurobtained() + ",");
//			System.out.print(aPur.getPurtime() + ",");
//			System.out.print(aPur.getPurreceipt() + ",");
//			System.out.print(aPur.getPurstatus()+ ",");
//			System.out.print(aPur.getPurextime()+ ",");
//			System.out.print(aPur.getPurstock()+ ",");
//			System.out.print(aPur.getPurlimit()+ ",");
//			System.out.println(aPur.getPursavetime());
//			System.out.println("---------------------");
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
