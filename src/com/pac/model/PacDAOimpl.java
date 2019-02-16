package com.pac.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
//
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
			"UPDATE PACKAGE SET PACNAME=?, PACCITY=?, PACPRICE=?, PACSTATUS=? WHERE PACNO = ?";

	
		
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
//					原版
//					pstmt.setString(1, pacVO.getPacno());
//					pstmt.setString(2, pacVO.getEmpno());
//					pstmt.setString(3, pacVO.getPacname());
//					pstmt.setString(4, pacVO.getPaccountry());
//					pstmt.setString(5, pacVO.getPaccity());
//					pstmt.setInt(6, pacVO.getPactotalday());
//					pstmt.setInt(7, pacVO.getPacprice());
//					pstmt.setInt(8, pacVO.getPacdeposit());
//					pstmt.setString(9, pacVO.getPacdiv());
//					pstmt.setString(10, pacVO.getPaccontent());
//					pstmt.setBytes(11, pacVO.getPactchar1());
//					pstmt.setBytes(12, pacVO.getPactchar2());
//					pstmt.setString(13, pacVO.getPacremark());
//					pstmt.setInt(14, pacVO.getPacstatus());
					//"UPDATE PACKAGE SET PACNAME=?, PACCITY=?, PACPRICE=?, PACSTATUS=? WHERE PACNO = ?";
					pstmt.setString(1, pacVO.getPacname());
					pstmt.setString(2, pacVO.getPaccity());
					pstmt.setInt(3, pacVO.getPacprice());
					pstmt.setInt(4, pacVO.getPacstatus());
					pstmt.setString(5, pacVO.getPacno());
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
				PacVO pacVO1 = new PacVO();
				
//				pacVO1.setPacno("PAC000007");
				pacVO1.setEmpno("EMP000002");
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
				dao.insert(pacVO1);		
				System.out.println("新增一筆"+ pacVO1.getPacno());
//				
//				
//				
////
//				// 修改
				PacVO pacVO2 = new PacVO();
		/*		所有原來的
		 *  	pacVO2.setPacno("PAC000009");
				pacVO2.setEmpno("EMP000003");
				pacVO2.setPacname("東京熱");
				pacVO2.setPaccountry("日本XXX");
				pacVO2.setPaccity("東京花街");
				pacVO2.setPactotalday(5);
				pacVO2.setPacprice(28800);
				pacVO2.setPacdeposit(5000);
				pacVO2.setPacdiv("溫泉、城市");
				pacVO2.setPaccontent("櫻花、溫泉，城市風光");
				pacVO2.setPactchar1(null);
				pacVO2.setPactchar2(null);
				pacVO2.setPacremark("");
				pacVO2.setPacstatus(2);
		 * */		
				pacVO2.setPacname("東京熱");
				pacVO2.setPaccity("東京花街");
				pacVO2.setPacprice(28800);
				pacVO2.setPacstatus(2);
				pacVO2.setPacno("PAC000007");
				dao.update(pacVO2);

//
//
////				// 刪除
//				dao.delete("PAC000006");

				// 查詢
				PacVO pacVO3 = dao.findByPrimaryKey("PAC000002");
				System.out.print(pacVO3.getPacname() + ",");
				System.out.print(pacVO3.getPaccountry() + ",");
				System.out.print(pacVO3.getPactotalday() + ",");
				System.out.print(pacVO3.getPacprice() + ",");
				System.out.print(pacVO3.getPacdeposit() + ",");
				System.out.print(pacVO3.getPaccontent() + ",");
				System.out.print(pacVO3.getPacremark()+ ",");
				System.out.println(pacVO3.getPacstatus() + " ---");
				System.out.println("---------------------");

				// 查詢
				List<PacVO> list = dao.getAll();
				for (PacVO aEmp : list) {
					System.out.print(aEmp.getPacno() + ",");
					System.out.print(aEmp.getEmpno() + ",");
					System.out.print(aEmp.getPacname() + ",");
					System.out.print(aEmp.getPaccountry() + ",");
					System.out.print(aEmp.getPaccity() + ",");
					System.out.print(aEmp.getPactotalday() + ",");
					System.out.print(aEmp.getPacprice());
					System.out.print(aEmp.getPacdeposit() + ",");
					System.out.print(aEmp.getPacdiv() + ",");
					System.out.print(aEmp.getPaccontent() + ",");
					System.out.print(aEmp.getPactchar1() + ",");
					System.out.print(aEmp.getPactchar2() + ",");
					System.out.print(aEmp.getPacremark() + ",");
					System.out.print(aEmp.getPacstatus() + "  ---");
					System.out.println();
				}
			}
		}
	
	
	


