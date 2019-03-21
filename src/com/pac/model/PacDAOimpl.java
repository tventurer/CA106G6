package com.pac.model;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import com.pac.model.PacVO;
import com.ptp.model.PtpVO;

public class PacDAOimpl implements PacDAO_interface{
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "TV";
	String passwd = "123456";
	
	private static final String INSERT_STMT =
		"INSERT INTO PACKAGE (PACNO,EMPNO,PACNAME,PACCOUNTRY,PACCITY,PACTOTALDAY,PACPRICE,PACDEPOSIT,PACDIV,PACCONTENT,PACTCHAR1,PACTCHAR2,PACREMARK,PACSTATUS)"
				+ "VALUES('PAC'||LPAD(TO_CHAR(PAC_SEQ.NEXTVAL),6,'0'),?,?,?,?,?,?,?,?,?,?,?,?,?)";
	private static final String GET_ALL_STMT = 
		"SELECT * FROM PACKAGE ORDER BY PACNO";
		private static final String GET_ONE_STMT = 
			"SELECT PACNO,EMPNO,PACNAME,PACCOUNTRY,PACCITY,PACTOTALDAY,PACPRICE,PACDEPOSIT,PACDIV,PACCONTENT,PACTCHAR1,PACTCHAR2,PACREMARK,PACSTATUS " 
			+"FROM PACKAGE WHERE PACNO= ?";
		private static final String DELETE = 
			"DELETE FROM PACKAGE WHERE PACNO = ?";
		private static final String UPDATE = 
			"UPDATE PACKAGE SET EMPNO=? ,PACNAME=? ,PACCOUNTRY=? ,PACCITY=? ,PACTOTALDAY=? ,PACPRICE=? ,PACDEPOSIT=? ,PACDIV=? ,PACCONTENT=? ,PACTCHAR1=? ,PACTCHAR2=? ,PACREMARK=? ,PACSTATUS=? WHERE PACNO = ?";
		private static final String GET_Ptps_ByPtpno_STMT = "SELECT PTPNO,PACNO, PTPSTART, PTPEND, PTPSIGNDLE, PTPNOTICE, PTPVACANCY, PTPMINMEN, PTPMAXMEN, PTPSTATUS, PTPTIMELOG FROM PACTRIPCONTENT WHERE PACNO = ? ORDER BY PTPNO";
			@Override
			public void insert(PacVO pacVO) {

				Connection con = null;
				PreparedStatement pstmt = null;

				try {

					Class.forName(driver);
					con = DriverManager.getConnection(url, userid, passwd);
					pstmt = con.prepareStatement(INSERT_STMT);

//記得第一個不需要	pstmt.setString(1, pacVO.getPacno());
					pstmt.setString(1, pacVO.getEmpno());
					pstmt.setString(2, pacVO.getPacname());
					pstmt.setString(3, pacVO.getPaccountry());
					pstmt.setString(4, pacVO.getPaccity());
					pstmt.setInt(5, pacVO.getPactotalday());
					pstmt.setInt(6, pacVO.getPacprice());
					pstmt.setInt(7, pacVO.getPacdeposit());
					pstmt.setString(8, pacVO.getPacdiv());
					pstmt.setString(9, pacVO.getPaccontent());
					pstmt.setBytes(10, pacVO.getPactchar1());
					pstmt.setBytes(11, pacVO.getPactchar2());
					pstmt.setString(12, pacVO.getPacremark());
					pstmt.setInt(13, pacVO.getPacstatus());
					
					
					pstmt.executeUpdate();

					// Handle any driver errors
				} catch (ClassNotFoundException e) {
					throw new RuntimeException("Couldn't load database driver. "
							+ e.getMessage());
					// Handle any SQL errors
				} catch (SQLException se) {
					throw new RuntimeException("A database error occured. "
							+ se.getMessage());
					// Clean up JDBC resources
				} finally {
					if (pstmt != null) {
						try {
							pstmt.close();
						} catch (SQLException se) {
							se.printStackTrace(System.err);
						}
					}
					if (con != null) {
						try {
							con.close();
						} catch (Exception e) {
							e.printStackTrace(System.err);
						}
					}
				}

			}

			@Override
			public void update(PacVO pacVO) {

				Connection con = null;
				PreparedStatement pstmt = null;

				try {

					Class.forName(driver);
					con = DriverManager.getConnection(url, userid, passwd);
					
					pstmt = con.prepareStatement(UPDATE);
					pstmt.setString(1, pacVO.getEmpno());
					pstmt.setString(2, pacVO.getPacname());
					pstmt.setString(3, pacVO.getPaccountry());
					pstmt.setString(4, pacVO.getPaccity());
					pstmt.setInt(5, pacVO.getPactotalday());
					pstmt.setInt(6, pacVO.getPacprice());
					pstmt.setInt(7, pacVO.getPacdeposit());
					pstmt.setString(8, pacVO.getPacdiv());
					pstmt.setString(9, pacVO.getPaccontent());
					pstmt.setBytes(10, pacVO.getPactchar1());
					pstmt.setBytes(11, pacVO.getPactchar2());
					pstmt.setString(12, pacVO.getPacremark());
					pstmt.setInt(13, pacVO.getPacstatus());
					pstmt.setString(14, pacVO.getPacno());
					pstmt.executeUpdate();

					// Handle any driver errors
				} catch (ClassNotFoundException e) {
					throw new RuntimeException("Couldn't load database driver. "
							+ e.getMessage());
					// Handle any SQL errors
				} catch (SQLException se) {
					throw new RuntimeException("A database error occured. "
							+ se.getMessage());
					// Clean up JDBC resources
				} finally {
					if (pstmt != null) {
						try {
							pstmt.close();
						} catch (SQLException se) {
							se.printStackTrace(System.err);
						}
					}
					if (con != null) {
						try {
							con.close();
						} catch (Exception e) {
							e.printStackTrace(System.err);
						}
					}
				}

			}

			@Override
			public void delete(String pacno) {

				Connection con = null;
				PreparedStatement pstmt = null;

				try {

					Class.forName(driver);
					con = DriverManager.getConnection(url, userid, passwd);
					pstmt = con.prepareStatement(DELETE);

					pstmt.setString(1, pacno);

					pstmt.executeUpdate();

					// Handle any driver errors
				} catch (ClassNotFoundException e) {
					throw new RuntimeException("Couldn't load database driver. "
							+ e.getMessage());
					// Handle any SQL errors
				} catch (SQLException se) {
					throw new RuntimeException("A database error occured. "
							+ se.getMessage());
					// Clean up JDBC resources
				} finally {
					if (pstmt != null) {
						try {
							pstmt.close();
						} catch (SQLException se) {
							se.printStackTrace(System.err);
						}
					}
					if (con != null) {
						try {
							con.close();
						} catch (Exception e) {
							e.printStackTrace(System.err);
						}
					}
				}

			}

			@Override
			public PacVO findByPrimaryKey(String pacno) {

				PacVO pacVO = null;
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;

				try {

					Class.forName(driver);
					con = DriverManager.getConnection(url, userid, passwd);
					pstmt = con.prepareStatement(GET_ONE_STMT);

					pstmt.setString(1, pacno);

					rs = pstmt.executeQuery();

					while (rs.next()) {
						// PacVO 也稱為 Domain objects
						pacVO = new PacVO();
						pacVO.setPacno(rs.getString("pacno"));
						pacVO.setEmpno(rs.getString("empno"));
						pacVO.setPacname(rs.getString("pacname"));
						pacVO.setPaccountry(rs.getString("paccountry"));
						pacVO.setPaccity(rs.getString("paccity"));
						pacVO.setPactotalday(rs.getInt("pactotalday"));
						pacVO.setPacprice(rs.getInt("pacprice"));
						pacVO.setPacdeposit(rs.getInt("pacdeposit"));
						pacVO.setPacdiv(rs.getString("pacdiv"));
						pacVO.setPaccontent(rs.getString("paccontent"));
						pacVO.setPactchar1(rs.getBytes("pactchar1"));
						pacVO.setPactchar2(rs.getBytes("pactchar2"));
						pacVO.setPacremark(rs.getString("pacremark"));
						pacVO.setPacstatus(rs.getInt("pacstatus"));
											
					}

					// Handle any driver errors
				} catch (ClassNotFoundException e) {
					throw new RuntimeException("Couldn't load database driver. "
							+ e.getMessage());
					// Handle any SQL errors
				} catch (SQLException se) {
					se.printStackTrace();
					throw new RuntimeException("A database error occured. "
							+ se.getMessage());
					// Clean up JDBC resources
				} finally {
					if (rs != null) {
						try {
							rs.close();
						} catch (SQLException se) {
							se.printStackTrace(System.err);
						}
					}
					if (pstmt != null) {
						try {
							pstmt.close();
						} catch (SQLException se) {
							se.printStackTrace(System.err);
						}
					}
					if (con != null) {
						try {
							con.close();
						} catch (Exception e) {
							e.printStackTrace(System.err);
						}
					}
				}
				return pacVO;
			}
			
			@Override
			public Set<PtpVO> getPtpsByPacno(String pacno) {
				
				Set<PtpVO> set = new LinkedHashSet<PtpVO>();
				PtpVO ptpVO = null;
			
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
			
				try {
					con = DriverManager.getConnection(url, userid, passwd);
					pstmt = con.prepareStatement(GET_Ptps_ByPtpno_STMT);
					
					pstmt.setString(1, pacno);
					rs = pstmt.executeQuery();
			
					while (rs.next()) {
						ptpVO = new PtpVO();
						ptpVO.setPtpno(rs.getString("ptpno"));
						ptpVO.setPacno(rs.getString("pacno"));
						ptpVO.setPtpstart(rs.getTimestamp("ptpstart"));
						ptpVO.setPtpend(rs.getDate("ptpend"));
						ptpVO.setPtpsigndle(rs.getDate("ptpsigndle"));
						ptpVO.setPtpnotice(rs.getString("ptpnotice"));
						ptpVO.setPtpvacancy(rs.getInt("ptpvacancy"));
						ptpVO.setPtpminmen(rs.getInt("ptpminmen"));
						ptpVO.setPtpmaxmen(rs.getInt("ptpmaxmen"));
						ptpVO.setPtpstatus(rs.getInt("ptpstatus"));
						ptpVO.setPtptimelog(rs.getTimestamp("ptptimelog"));
						set.add(ptpVO); // Store the row in the vector
					}
			
					// Handle any SQL errors
				} catch (SQLException se) {
					throw new RuntimeException("A database error occured. "
							+ se.getMessage());
				} finally {
					if (rs != null) {
						try {
							rs.close();
						} catch (SQLException se) {
							se.printStackTrace(System.err);
						}
					}
					if (pstmt != null) {
						try {
							pstmt.close();
						} catch (SQLException se) {
							se.printStackTrace(System.err);
						}
					}
					if (con != null) {
						try {
							con.close();
						} catch (Exception e) {
							e.printStackTrace(System.err);
						}
					}
				}
				return set;
			}
			
			@Override
			public List<PacVO> getAll() {
				List<PacVO> list = new ArrayList<PacVO>();
				PacVO pacVO = null;

				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;

				try {

					Class.forName(driver);
					con = DriverManager.getConnection(url, userid, passwd);
					pstmt = con.prepareStatement(GET_ALL_STMT);
					rs = pstmt.executeQuery();

					while (rs.next()) {
						// PacVO 也稱為 Domain objects
						pacVO = new PacVO();
						pacVO.setPacno(rs.getString("pacno"));
						pacVO.setEmpno(rs.getString("empno"));
						pacVO.setPacname(rs.getString("pacname"));
						pacVO.setPaccountry(rs.getString("paccountry"));
						pacVO.setPaccity(rs.getString("paccity"));
						pacVO.setPactotalday(rs.getInt("pactotalday"));
						pacVO.setPacprice(rs.getInt("pacprice"));
						pacVO.setPacdeposit(rs.getInt("pacdeposit"));
						pacVO.setPacdiv(rs.getString("pacdiv"));
						pacVO.setPaccontent(rs.getString("paccontent"));
						pacVO.setPactchar1(rs.getBytes("pactchar1"));
						pacVO.setPactchar2(rs.getBytes("pactchar2"));
						pacVO.setPacremark(rs.getString("pacremark"));
						pacVO.setPacstatus(rs.getInt("pacstatus"));
										
						list.add(pacVO); // Store the row in the list
					}

					// Handle any driver errors
				} catch (ClassNotFoundException e) {
					throw new RuntimeException("Couldn't load database driver. "
							+ e.getMessage());
					// Handle any SQL errors
				} catch (SQLException se) {
					throw new RuntimeException("A database error occured. "
							+ se.getMessage());
					// Clean up JDBC resources
				} finally {
					if (rs != null) {
						try {
							rs.close();
						} catch (SQLException se) {
							se.printStackTrace(System.err);
						}
					}
					if (pstmt != null) {
						try {
							pstmt.close();
						} catch (SQLException se) {
							se.printStackTrace(System.err);
						}
					}
					if (con != null) {
						try {
							con.close();
						} catch (Exception e) {
							e.printStackTrace(System.err);
						}
					}
				}
				return list;
			}

			public static void main(String[] args) {

				PacDAOimpl dao = new PacDAOimpl();

				// 新增
//				PacVO pacVO1 = new PacVO();
				
//				pacVO1.setPacno("PAC000007");
//				pacVO1.setEmpno("EMP000002");
//				pacVO1.setPacname("東京春爛漫~");
//				pacVO1.setPaccountry("日本");
//				pacVO1.setPaccity("東京");
//				pacVO1.setPactotalday(5);
//				pacVO1.setPacprice(28800);
//				pacVO1.setPacdeposit(5000);
//				pacVO1.setPacdiv("溫泉、城市");
//				pacVO1.setPaccontent("櫻花、溫泉，城市風光");
//				pacVO1.setPactchar1(null);
//				pacVO1.setPactchar2(null);
//				pacVO1.setPacremark("");
//				pacVO1.setPacstatus(2);
//				dao.insert(pacVO1);		
//				System.out.println("新增成功"+ pacVO1.getPacno());
				
				
//				System.out.println("============================");
//				// 修改
//				PacVO pacVO2 = new PacVO();
//		
//				
//				byte[] b = null;
//				try {
//					File file = new File("D:\\001.jpg");
//					InputStream in = new FileInputStream(file);
//					b = new byte[in.available()];
//					System.out.println(b.length);
//					in.read(b);
//					in.close();
//				}catch(FileNotFoundException e) {
//					e.printStackTrace();
//				}catch(IOException ioe) {
//					ioe.printStackTrace();
//				}
//				
//				pacVO2.setEmpno("EMP000003");
//				pacVO2.setPacname("東京熱123");
//				pacVO2.setPaccountry("日本XXX");
//				pacVO2.setPaccity("東京花街");
//				pacVO2.setPactotalday(5);
//				pacVO2.setPacprice(28800);
//				pacVO2.setPacdeposit(5000);
//				pacVO2.setPacdiv("溫泉、城市");
//				pacVO2.setPaccontent("櫻花、溫泉，城市風光");
//				pacVO2.setPactchar1(b);
//				pacVO2.setPactchar2(null);
//				pacVO2.setPacremark("注意事項");
//				pacVO2.setPacstatus(2);
//				pacVO2.setPacno("PAC000007");
		 		
//				pacVO2.setPacname("東京熱");
//				pacVO2.setPaccity("東京花街");
//				pacVO2.setPacprice(28800);
//				pacVO2.setPacstatus(2);
////				pacVO2.setPacno("PAC000007");
//				dao.update(pacVO2);

				
				
				PacVO pacVO10 = new PacVO();
				
				byte[] c = null;
				try {
					File file = new File("D:\\pacImg\\pac01\\0004.jpg");
					InputStream in = new FileInputStream(file);
					c = new byte[in.available()];
					System.out.println(c.length);
					in.read(c);
					in.close();
				}catch(FileNotFoundException e) {
					e.printStackTrace();
				}catch(IOException ioe) {
					ioe.printStackTrace();
				}
				byte[] d = null;
				try {
					File file = new File("D:\\pacImg\\pac01\\0005.jpg");
					InputStream in = new FileInputStream(file);
					d = new byte[in.available()];
					System.out.println(d.length);
					in.read(d);
					in.close();
				}catch(FileNotFoundException e) {
					e.printStackTrace();
				}catch(IOException ioe) {
					ioe.printStackTrace();
				}
				byte[] e = null;
				try {
					File file = new File("D:\\pacImg\\pac02\\0018.jpg");
					InputStream in = new FileInputStream(file);
					e = new byte[in.available()];
					System.out.println(e.length);
					in.read(e);
					in.close();
				}catch(FileNotFoundException fe) {
					fe.printStackTrace();
				}catch(IOException ioe) {
					ioe.printStackTrace();
				}
				byte[] f = null;
				try {
					File file = new File("D:\\pacImg\\pac02\\0019.jpg");
					InputStream in = new FileInputStream(file);
					f = new byte[in.available()];
					System.out.println(f.length);
					in.read(f);
					in.close();
				}catch(FileNotFoundException fe) {
					fe.printStackTrace();
				}catch(IOException ioe) {
					ioe.printStackTrace();
				}
				byte[] g = null;
				try {
					File file = new File("D:\\pacImg\\pac08\\019.jpg");
					InputStream in = new FileInputStream(file);
					g = new byte[in.available()];
					System.out.println(f.length);
					in.read(g);
					in.close();
				}catch(FileNotFoundException fe) {
					fe.printStackTrace();
				}catch(IOException ioe) {
					ioe.printStackTrace();
				}
				byte[] h = null;
				try {
					File file = new File("D:\\pacImg\\pac08\\020.jfif");
					InputStream in = new FileInputStream(file);
					h = new byte[in.available()];
					System.out.println(f.length);
					in.read(h);
					in.close();
				}catch(FileNotFoundException fe) {
					fe.printStackTrace();
				}catch(IOException ioe) {
					ioe.printStackTrace();
				}
				byte[] i = null;
				try {
					File file = new File("D:\\pacImg\\pac09\\0021.jpg");
					InputStream in = new FileInputStream(file);
					i = new byte[in.available()];
					System.out.println(i.length);
					in.read(i);
					in.close();
				}catch(FileNotFoundException fe) {
					fe.printStackTrace();
				}catch(IOException ioe) {
					ioe.printStackTrace();
				}
				byte[] j = null;
				try {
					File file = new File("D:\\pacImg\\pac09\\0022.jpg");
					InputStream in = new FileInputStream(file);
					j = new byte[in.available()];
					System.out.println(j.length);
					in.read(j);
					in.close();
				}catch(FileNotFoundException fe) {
					fe.printStackTrace();
				}catch(IOException ioe) {
					ioe.printStackTrace();
				}
				
				
				
				
						
				
				
//				
//				PacVO pacVO11 = new PacVO();
//				PacVO pacVO12 = new PacVO();
//				PacVO pacVO13 = new PacVO();
//				PacVO pacVO14 = new PacVO();
//				PacVO pacVO15 = new PacVO();
//				PacVO pacVO16 = new PacVO();
//				PacVO pacVO17 = new PacVO();
//				PacVO pacVO18 = new PacVO();
//				PacVO pacVO19 = new PacVO();
//				PacVO pacVO20 = new PacVO();
//				PacVO pacVO21 = new PacVO();
//				
//				pacVO2.setPacno("PAC000007");
//				
				
				
				
				
				
				
				
				
				
				
////				// 刪除
//				dao.delete("PAC000006");

				// 查詢
//				PacVO pacVO3 = dao.findByPrimaryKey("PAC000002");
//				System.out.print(pacVO3.getPacname() + ",");
//				System.out.print(pacVO3.getPaccountry() + ",");
//				System.out.print(pacVO3.getPactotalday() + ",");
//				System.out.print(pacVO3.getPacprice() + ",");
//				System.out.print(pacVO3.getPacdeposit() + ",");
//				System.out.print(pacVO3.getPaccontent() + ",");
//				System.out.print(pacVO3.getPacremark()+ ",");
//				System.out.println(pacVO3.getPacstatus() + " ---");
//				System.out.println("---------------------");
//
//				// 查詢
//				List<PacVO> list = dao.getAll();
//				for (PacVO aEmp : list) {
//					System.out.print(aEmp.getPacno() + ",");
//					System.out.print(aEmp.getEmpno() + ",");
//					System.out.print(aEmp.getPacname() + ",");
//					System.out.print(aEmp.getPaccountry() + ",");
//					System.out.print(aEmp.getPaccity() + ",");
//					System.out.print(aEmp.getPactotalday() + ",");
//					System.out.print(aEmp.getPacprice());
//					System.out.print(aEmp.getPacdeposit() + ",");
//					System.out.print(aEmp.getPacdiv() + ",");
//					System.out.print(aEmp.getPaccontent() + ",");
//					System.out.print(aEmp.getPactchar1() + ",");
//					System.out.print(aEmp.getPactchar2() + ",");
//					System.out.print(aEmp.getPacremark() + ",");
//					System.out.print(aEmp.getPacstatus() + "  ---");
//					System.out.println();
//				}
				Set<PtpVO> set= dao.getPtpsByPacno("PAC000002");
				
//				Iterator<PtpVO> objs=set.iterator();
				System.out.print(set + ",");
				for(PtpVO ptpVO : set) {
				System.out.print(ptpVO.getPtpnotice() + ",");
				}
//				System.out.print(ptpVO.getPacname() + ",");
//				System.out.print(ptpVO.getPaccountry() + ",");
//				System.out.print(ptpVO.getPaccity() + ",");
//				System.out.print(ptpVO.getPactotalday() + ",");
//				System.out.print(ptpVO.getPacprice());
//				System.out.print(ptpVO.getPacdeposit() + ",");
//				System.out.print(ptpVO.getPacdiv() + ",");
//				System.out.print(ptpVO.getPaccontent() + ",");
//				System.out.print(ptpVO.getPactchar1() + ",");
//				System.out.print(ptpVO.getPactchar2() + ",");
//				System.out.print(ptpVO.getPacremark() + ",");
//				System.out.print(ptpVO.getPacstatus() + "  ---");
//					System.out.println(objs.next());
				
				
				
				}
			
			
			}
		

				
				
				
				
				
			
	
	
	


