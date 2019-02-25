package com.emp.model;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

//測試insert
public class TestEmpDAO {
	public static void main(String[] args) {
		EmpVO empVO = new EmpVO();
		EmpDAO empDAO = new EmpDAO();
		byte[] buff = null;
		InputStream in = null;
		//生成sql date
		java.util.Date date = new java.util.Date();
		Long longDate = date.getTime();
		java.sql.Date sqlDate = new java.sql.Date(longDate);
		
		//生成照片的inputStream並轉成byte[]
		try {
			File file = new File("D:\\derp.jpg");
			in = new FileInputStream(file); //FileNotFoundException
			int len = in.available(); //IOException
			buff = new byte[len];
			in.read(buff); //IOException
		}catch(FileNotFoundException fnfe) {
			fnfe.getMessage();
		}catch(IOException ioe) {
			ioe.printStackTrace();
		}finally {
			try {
				in.close(); //IOException
			}catch(IOException ioe) {
				ioe.printStackTrace();
			}
		}
		
		empVO.setEmpname("Oracle");
		empVO.setEmppwd("123");
		empVO.setEmpgen(1);
		empVO.setEmpphone("02123456789");
		empVO.setEmpcell("0912345678");
		empVO.setEmpmail("oracle@oracle.com");
		empVO.setEmpdept("abc");
		empVO.setEmpposi("asdf");
		empVO.setEmpsal(1000);
		empVO.setEmpdoe(sqlDate);
		empVO.setEmppic(buff); //可為null，試塞null狀況ok
		
		empDAO.insert(empVO);
	}
}
////測試update
//public class TestEmpDAO {
//public static void main(String[] args) {
//	EmpVO empVO = new EmpVO();
//	EmpDAO empDAO = new EmpDAO();
//	InputStream in = null;
//	byte[] buff = null;
//	
//	//生成sql date
//	java.util.Date date = new java.util.Date();
//	long longDate = date.getTime();
//	java.sql.Date sqlDate = new java.sql.Date(longDate);
//	//生成照片的inputStream並轉成byte[]
//	try {
//		File file = new File("D:\\derp.jpg");
//		in = new FileInputStream(file); //FileNotFoundException
//		int len = in.available(); //IOException
//		buff = new byte[len];
//		in.read(buff); //IOException
//		}catch(FileNotFoundException fnfe) {
//			fnfe.getMessage();
//		}catch(IOException ioe) {
//			ioe.printStackTrace();
//		}finally {
//			try {
//				in.close(); //IOException
//			}catch(IOException ioe) {
//			ioe.printStackTrace();
//			}
//		}		
//
//	empVO.setEmpno("EMP000010");
//	empVO.setEmpname("Oracle");
//	empVO.setEmppwd("123");
//	empVO.setEmpgen(1);
//	empVO.setEmpphone("02123456789");
//	empVO.setEmpcell("0912345678");
//	empVO.setEmpmail("oracle@oracle.com");
//	empVO.setEmpdept("abc");
//	empVO.setEmpposi("asdf");
//	empVO.setEmpsal(1000);
//	empVO.setEmpdoe(sqlDate);
//	empVO.setEmppic(buff); //可塞null
//	
//	empDAO.update(empVO);
//}
//}
//測試delete
//public class TestEmpDAO {
//	public static void main(String[] args) {
//
//		EmpDAO empDAO = new EmpDAO();
//
//		empDAO.delete("EMP000011");
//	}
//}
////測試findByPrimaryKey
//public class TestEmpDAO {
//	public static void main(String[] args) {
//		EmpVO empVO = new EmpVO();
//		EmpDAO empDAO = new EmpDAO();
//	
//		empVO = empDAO.findByPrimaryKey("EMP000011");
//		
//		System.out.println(empVO.getEmpno());
//		System.out.println(empVO.getEmpname());
//		System.out.println(empVO.getEmppwd());
//		System.out.println(empVO.getEmpgen());
//		System.out.println(empVO.getEmpphone());
//		System.out.println(empVO.getEmpcell());
//		System.out.println(empVO.getEmpmail());
//		System.out.println(empVO.getEmpdept());
//		System.out.println(empVO.getEmpposi());
//		System.out.println(empVO.getEmpsal());
//		System.out.println(empVO.getEmpdoe());
//		byte[] buff = empVO.getEmppic(); //小心沒照片取出是null這樣下面fos.write(buff)用到就會出錯 //應該是DAO不改，但取出後controller看要不要判斷null的情況。
//		
//		try {
//			String filename = "derp.jpg";
//			File file = new File("D:\\xxx");
//					if(!file.exists()) {
//						file.mkdirs();
//					}
//			File file2 = new File(file, filename);		
//			FileOutputStream fos = new FileOutputStream(file2);
//			fos.write(buff);
//			fos.flush();
//			fos.close();
//		}catch(FileNotFoundException fnfe) {
//			fnfe.printStackTrace();
//		}catch(IOException ioe) {
//			ioe.printStackTrace();
//		}
//	}
//}
////測試getAll
//public class TestEmpDAO {
//	public static void main(String[] args) {
//		EmpDAO empDAO = new EmpDAO();
//		List<EmpVO> list = new ArrayList<EmpVO>();
//		list = empDAO.getAll();
//		byte[] buff = null;
//		
//		for(EmpVO e : list) {
//			System.out.println(e.toString()); //這行只是看看物件的記憶體編碼，可以刪掉
//			System.out.println(e.getEmpno());
//			System.out.println(e.getEmpname());
//			System.out.println(e.getEmppwd());
//			System.out.println(e.getEmpgen());
//			System.out.println(e.getEmpphone());
//			System.out.println(e.getEmpcell());
//			System.out.println(e.getEmpmail());
//			System.out.println(e.getEmpdept());
//			System.out.println(e.getEmpposi());
//			System.out.println(e.getEmpsal());
//			System.out.println(e.getEmpdoe());
//			buff = e.getEmppic(); //小心沒照片取出是null這樣下面fos.write(buff)用到就會出錯 //應該是DAO不改，但取出後controller看要不要判斷null的情況。
//			if(buff == null)
//				System.out.println(buff+"(No picture)");
//			else{
//				System.out.println("Picture exists");
//				try {
//					FileOutputStream fos = new FileOutputStream("E:\\xxx\\derp.jpg");
//					fos.write(buff);
//					fos.flush();
//					fos.close();
//				}catch(FileNotFoundException fnfe) {
//					fnfe.printStackTrace();
//				}catch(IOException ioe) {
//					ioe.printStackTrace();
//				}
//			}
//			System.out.println("======================================");
//		}
//
//	}
//}
