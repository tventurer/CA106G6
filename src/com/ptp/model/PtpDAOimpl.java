package com.ptp.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Timestamp;

public class PtpDAOimpl implements PtpDAO_interface{
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "TV";
	String passwd = "123456";
	
	private static final String INSERT_STMT =
		"INSERT INTO PACTRIPCONTENT (PTPNO, PACNO, PTPSTART, PTPEND, PTPSIGNDLE, PTPNOTICE, PTPVACANCY, PTPMINMEN, PTPMAXMEN, PTPSTATUS, PTPTIMELOG)"
				+ "VALUES('PTP'||LPAD(TO_CHAR(PTP_SEQ.NEXTVAL),6,'0'),?,?,?,?,?,?,?,?,?,?)";
	//ptpno, pacno, ptpstart, ptpend, ptpsigndle, ptpnotice, ptpvacancy, ptpminmen, ptpmaxmen, ptpstatus, ptptimelog
	private static final String GET_ALL_STMT = 
		"SELECT * FROM PACTRIPCONTENT ORDER BY PTPNO";
	private static final String GET_ONE_STMT = 
		"SELECT PTPNO,PACNO, PTPSTART, PTPEND, PTPSIGNDLE, PTPNOTICE, PTPVACANCY, PTPMINMEN, PTPMAXMEN, PTPSTATUS, PTPTIMELOG " 
				+" FROM PACTRIPCONTENT WHERE PTPNO= ?";
	private static final String DELETE = 
		"DELETE FROM PACTRIPCONTENT WHERE PTPNO = ?";
	private static final String UPDATE = 
		"UPDATE PACTRIPCONTENT SET PACNO=? ,PTPSTART=? ,PTPEND=? ,PTPSIGNDLE=? ,PTPNOTICE=? ,PTPVACANCY=? ,PTPMINMEN=? ,PTPMAXMEN=? ,PTPSTATUS=? ,PTPTIMELOG=? WHERE PTPNO = ?";
	private static final String GET_START_PTP = "SELECT * FROM PACTRIPCONTENT ORDER BY PTPSTART";
	
		
			@Override
			public void insert(PtpVO ptpVO) {

				Connection con = null;
				PreparedStatement pstmt = null;
				
				try {

					Class.forName(driver);
					con = DriverManager.getConnection(url, userid, passwd);
					pstmt = con.prepareStatement(INSERT_STMT);
					//自增主鍵不需要擺進去
					pstmt.setString(1, ptpVO.getPacno());
					pstmt.setTimestamp(2, ptpVO.getPtpstart());
					pstmt.setDate(3, ptpVO.getPtpend());
					pstmt.setDate(4, ptpVO.getPtpsigndle());
					pstmt.setString(5, ptpVO.getPtpnotice());
					pstmt.setInt(6, ptpVO.getPtpvacancy());
					pstmt.setInt(7, ptpVO.getPtpminmen());
					pstmt.setInt(8, ptpVO.getPtpmaxmen());
					pstmt.setInt(9, ptpVO.getPtpstatus());
					pstmt.setTimestamp(10, ptpVO.getPtptimelog());
					
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
			public void update(PtpVO ptpVO) {

				Connection con = null;
				PreparedStatement pstmt = null;

				try {

					Class.forName(driver);
					con = DriverManager.getConnection(url, userid, passwd);
					pstmt = con.prepareStatement(UPDATE);

					pstmt.setString(1, ptpVO.getPacno());
					pstmt.setTimestamp(2, ptpVO.getPtpstart());
					pstmt.setDate(3, ptpVO.getPtpend());
					pstmt.setDate(4, ptpVO.getPtpsigndle());
					pstmt.setString(5, ptpVO.getPtpnotice());
					pstmt.setInt(6, ptpVO.getPtpvacancy());
					pstmt.setInt(7, ptpVO.getPtpminmen());
					pstmt.setInt(8, ptpVO.getPtpmaxmen());
					pstmt.setInt(9, ptpVO.getPtpstatus());
					pstmt.setTimestamp(10, ptpVO.getPtptimelog());
					pstmt.setString(11, ptpVO.getPtpno());
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
			public void delete(String ptpno) {

				Connection con = null;
				PreparedStatement pstmt = null;

				try {

					Class.forName(driver);
					con = DriverManager.getConnection(url, userid, passwd);
					pstmt = con.prepareStatement(DELETE);

					pstmt.setString(1, ptpno);
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
			public PtpVO findByPrimaryKey(String ptpno) {

				PtpVO ptpVO = null;
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;

				try {

					Class.forName(driver);
					con = DriverManager.getConnection(url, userid, passwd);
					pstmt = con.prepareStatement(GET_ONE_STMT);

					pstmt.setString(1, ptpno);

					rs = pstmt.executeQuery();

					while (rs.next()) {
						// PtpVO 也稱為 Domain objects
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
				return ptpVO;
			}

			@Override
			public List<PtpVO> getAll() {
				List<PtpVO> list = new ArrayList<PtpVO>();
				PtpVO ptpVO = null;

				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;

				try {

					Class.forName(driver);
					con = DriverManager.getConnection(url, userid, passwd);
					pstmt = con.prepareStatement(GET_ALL_STMT);
					rs = pstmt.executeQuery();

					while (rs.next()) {
						// PtpVO 也稱為 Domain objects
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
										
						list.add(ptpVO); // Store the row in the list
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
		
			@Override
			public List<PtpVO> get_start_ptp() {
				List<PtpVO> listStart = new ArrayList<PtpVO>();
				PtpVO ptpVO = null;

				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;

				try {

					Class.forName(driver);
					con = DriverManager.getConnection(url, userid, passwd);
					pstmt = con.prepareStatement(GET_START_PTP);
					rs = pstmt.executeQuery();

					while (rs.next()) {
						// PtpVO 也稱為 Domain objects
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
										
						listStart.add(ptpVO); // Store the row in the list
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
				return listStart;
			}
			
			public static void main(String[] args) {

				PtpDAOimpl dao = new PtpDAOimpl();

				// 新增
//				ptpVO1.setPtpno(ptp_seq.nextval);
//				PtpVO ptpVO1 = new PtpVO();
//				
//
//				ptpVO1.setPtpno("PTP000009");
//				
//				ptpVO1.setPacno("PAC000001");
//				ptpVO1.setPtpstart(java.sql.Timestamp.valueOf("2019-01-01 15:30:00"));
//				ptpVO1.setPtpend(java.sql.Date.valueOf("2019-01-05"));
//				ptpVO1.setPtpsigndle(java.sql.Date.valueOf("2018-12-10"));
//				ptpVO1.setPtpnotice("第五天加吃到飽餐");
//				ptpVO1.setPtpvacancy(10);
//				ptpVO1.setPtpminmen(18);
//				ptpVO1.setPtpmaxmen(32);
//				ptpVO1.setPtpstatus(9);
//				ptpVO1.setPtptimelog(java.sql.Timestamp.valueOf("2018-12-01 11:11:11"));
//				dao.insert(ptpVO1);		
//				System.out.println("2222");
//				System.out.println("新增一筆"+ ptpVO1.getPtpno());

				// 修改
//				PtpVO ptpVO2 = new PtpVO();
//	PACNO=? PTPSTART=? ,PTPEND=? ,PTPSIGNDLE=? ,PTPNOTICE=? ,PTPVACANCY=? ,PTPMINMEN=? ,PTPMAXMEN=? ,PTPSTATUS=? ,PTPTIMELOG=? ,WHERE PTPNO = ?			
//				ptpVO2.setPacno("PAC000002");
//				ptpVO2.setPtpstart(java.sql.Timestamp.valueOf("2020-01-01 20:20:00"));
//				ptpVO2.setPtpend(java.sql.Date.valueOf("2020-01-06"));
//				ptpVO2.setPtpsigndle(java.sql.Date.valueOf("2020-01-06"));
//				ptpVO2.setPtpnotice("注意事項捏換了");
//				ptpVO2.setPtpvacancy(99);
//				ptpVO2.setPtpminmen(18);
//				ptpVO2.setPtpmaxmen(19);
//				ptpVO2.setPtpstatus(0);
//				
//				ptpVO2.setPtptimelog(java.sql.Timestamp.valueOf("2020-01-01 11:11:11"));
//				System.out.println("9999999");
//				ptpVO2.setPtpno("PTP000001");
//				dao.update(ptpVO2);
//				System.out.println("修改"+ptpVO2.getPtpno() +"成功");

				// 刪除
//				dao.delete("PTP000011");
//				if() {
//					System.out.println("刪除成功");
//				}else {
//					System.out.println("查無資料或已經刪除")
//				}
				
				System.out.println("=======================================================");
				
				
				
				// 單一查詢
//				PtpVO ptpVO3 = dao.findByPrimaryKey("PTP000001");
//				System.out.println("===================查詢的這筆是:"+ptpVO3.getPtpno()+"===================");
//				System.out.print(ptpVO3.getPacno() + ",");
//				System.out.print(ptpVO3.getPtpstart() + ",");
//				System.out.print(ptpVO3.getPtpend() + ",");
//				System.out.print(ptpVO3.getPtpsigndle() + ",");
//				System.out.print(ptpVO3.getPtpnotice() + ",");
//				System.out.print(ptpVO3.getPtpvacancy() + ",");
//				System.out.print(ptpVO3.getPtpmaxmen()+ ",");
//				System.out.print(ptpVO3.getPtpstatus() + ",");
//				System.out.println(ptpVO3.getPtptimelog() + " ---");
//				System.out.println("---------------------");
//				
				// 全體查詢
//				List<PtpVO> list = dao.getAll();
//				for (PtpVO ptpBody : list) {
//						System.out.print(ptpBody.getPtpno() + ",");
//						System.out.print(ptpBody.getPacno() + ",");
//						System.out.print(ptpBody.getPtpstart() + ",");
//						System.out.print(ptpBody.getPtpend() + ",");
//						System.out.print(ptpBody.getPtpsigndle() + ",");
//						System.out.print(ptpBody.getPtpnotice() + ",");
//						System.out.print(ptpBody.getPtpvacancy() + ",");
//						System.out.print(ptpBody.getPtpminmen() + ",");
//						System.out.print(ptpBody.getPtpmaxmen() + ",");
//						System.out.print(ptpBody.getPtpstatus() + ",");
//						System.out.print(ptpBody.getPtptimelog() + ",");
//						System.out.println();
//						
						List<PtpVO> listStart = dao.get_start_ptp();
						for (PtpVO ptpBody : listStart) {
								System.out.print(ptpBody.getPtpno() + ",");
								System.out.print(ptpBody.getPacno() + ",");
								System.out.print(ptpBody.getPtpstart() + ",");
								System.out.print(ptpBody.getPtpend() + ",");
								System.out.print(ptpBody.getPtpsigndle() + ",");
								System.out.print(ptpBody.getPtpnotice() + ",");
								System.out.print(ptpBody.getPtpvacancy() + ",");
								System.out.print(ptpBody.getPtpminmen() + ",");
								System.out.print(ptpBody.getPtpmaxmen() + ",");
								System.out.print(ptpBody.getPtpstatus() + ",");
								System.out.print(ptpBody.getPtptimelog() + ",");
								System.out.println();
				}
			}
		}
