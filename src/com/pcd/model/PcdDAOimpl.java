package com.pcd.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ptp.model.PtpDAOimpl;
import com.ptp.model.PtpVO;

public class PcdDAOimpl implements PcdDAO_interface{
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "TV";
	String passwd = "123456";
	
	private static final String INSERT_STMT =
		"INSERT INTO PACORDER (PCDNO , PTPNO , MEMNO , PCDTRIPMEN , PCDORDDAY ,PCDMONEY ,PCDSTATUS, PCDSECPHONE,PCDFAMDATA ,PCDMARK )"
				+ "VALUES('PCD'||LPAD(TO_CHAR(PCD_SEQ.NEXTVAL),6,'0'),?,?,?,?,?,?,?,?,?)";
	private static final String GET_ALL_STMT = 
		"SELECT * FROM PACORDER ORDER BY PCDNO";
	private static final String GET_ONE_STMT = 
		"SELECT PCDNO, PTPNO, MEMNO, PCDTRIPMEN, PCDORDDAY, PCDMONEY, PCDSTATUS, PCDSECPHONE, PCDFAMDATA, PCDMARK" 
				+" FROM PACORDER WHERE PCDNO= ?";
	private static final String DELETE = 
			"DELETE FROM PACORDER WHERE PCDNO = ?";
	private static final String UPDATE = 
			"UPDATE PACORDER SET PTPNO=?, MEMNO=?, PCDTRIPMEN=?, PCDORDDAY=? , PCDMONEY=? ,PCDSTATUS=? , PCDSECPHONE=? ,PCDFAMDATA=? , PCDMARK=? WHERE PCDNO = ?";
		 		
	


    @Override
			public void insert(PcdVO pcdVO) {

				Connection con = null;
				PreparedStatement pstmt = null;
				
				try {

					Class.forName(driver);
					con = DriverManager.getConnection(url, userid, passwd);
					pstmt = con.prepareStatement(INSERT_STMT);
					//自增主鍵不需要擺進去
					pstmt.setString(1, pcdVO.getPtpno());
					pstmt.setString(2, pcdVO.getMemno());
					pstmt.setInt(3, pcdVO.getPcdtripmen());
					pstmt.setDate(4, pcdVO.getPcdordday());
					pstmt.setInt(5, pcdVO.getPcdmoney());
					pstmt.setInt(6, pcdVO.getPcdstatus());
					pstmt.setString(7, pcdVO.getPcdsecphone());
					pstmt.setString(8, pcdVO.getPcdfamdata());
					pstmt.setString(9, pcdVO.getPcdmark());
					
					
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
			public void update(PcdVO pcdVO) {

				Connection con = null;
				PreparedStatement pstmt = null;

				try {

					Class.forName(driver);
					con = DriverManager.getConnection(url, userid, passwd);
					pstmt = con.prepareStatement(UPDATE);
					
					pstmt.setString(1, pcdVO.getPtpno());
					pstmt.setString(2, pcdVO.getMemno());
					pstmt.setInt(3, pcdVO.getPcdtripmen());
					pstmt.setDate(4, pcdVO.getPcdordday());
					pstmt.setInt(5, pcdVO.getPcdmoney());
					pstmt.setInt(6, pcdVO.getPcdstatus());
					pstmt.setString(7, pcdVO.getPcdsecphone());
					pstmt.setString(8, pcdVO.getPcdfamdata());
					pstmt.setString(9, pcdVO.getPcdmark());
					pstmt.setString(10, pcdVO.getPcdno());
				 


					pstmt.executeUpdate();
//					"UPDATE PACTRIPCONTENT SET PTPSTART=?, PTPEND=?, PTPNOTICE=?, PTPVACANCY=? , PACSTATUS=? WHERE PTPNO = ?
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
		public void delete(String pcdno) {
			Connection con = null;
			PreparedStatement pstmt = null;

			try {

				Class.forName(driver);
				con = DriverManager.getConnection(url, userid, passwd);
				pstmt = con.prepareStatement(DELETE);

				pstmt.setString(1, pcdno);
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
		public PcdVO findByPrimaryKey(String pcdno) {
			PcdVO pcdVO = null;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {

				Class.forName(driver);
				con = DriverManager.getConnection(url, userid, passwd);
				pstmt = con.prepareStatement(GET_ONE_STMT);

				pstmt.setString(1, pcdno);

				rs = pstmt.executeQuery();

				while (rs.next()) {
					// PtpVO 也稱為 Domain objects
					pcdVO = new PcdVO();
					pcdVO.setPcdno(rs.getString("pcdno"));
					pcdVO.setPtpno(rs.getString("ptpno"));
					pcdVO.setMemno(rs.getString("memno"));
					pcdVO.setPcdtripmen(rs.getInt("pcdtripmen"));
					pcdVO.setPcdordday(rs.getDate("pcdordday"));
					pcdVO.setPcdmoney(rs.getInt("pcdmoney"));
					pcdVO.setPcdstatus(rs.getInt("pcdstatus"));
					pcdVO.setPcdsecphone(rs.getString("pcdsecphone"));
					pcdVO.setPcdfamdata(rs.getString("pcdfamdata"));
					pcdVO.setPcdmark(rs.getString("pcdmark"));
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
			return pcdVO;
		}

		
		@Override
		public List<PcdVO> getAll() {
			
			List<PcdVO> list = new ArrayList<PcdVO>();
			PcdVO pcdVO = null;

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {

				Class.forName(driver);
				con = DriverManager.getConnection(url, userid, passwd);
				pstmt = con.prepareStatement(GET_ALL_STMT);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					// PcdVO 也稱為 Domain objects
					pcdVO = new PcdVO();
					pcdVO.setPcdno(rs.getString("pcdno"));
					pcdVO.setPtpno(rs.getString("ptpno"));
					pcdVO.setMemno(rs.getString("memno"));
					pcdVO.setPcdtripmen(rs.getInt("pcdtripmen"));
					pcdVO.setPcdordday(rs.getDate("pcdordday"));
					pcdVO.setPcdmoney(rs.getInt("pcdmoney"));
					pcdVO.setPcdstatus(rs.getInt("pcdstatus"));
					pcdVO.setPcdsecphone(rs.getString("pcdsecphone"));
					pcdVO.setPcdfamdata(rs.getString("pcdfamdata"));
					pcdVO.setPcdmark(rs.getString("pcdmark"));
									
					list.add(pcdVO); // Store the row in the list
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

			PcdDAOimpl dao = new PcdDAOimpl();

			// 新增
			PcdVO pcdVO1 = new PcdVO();
//						pcdVO1.setPtpno("PAC000003");
			pcdVO1.setPtpno("PTP000003");
			pcdVO1.setMemno("MEM000003");
			pcdVO1.setPcdtripmen(5);
			pcdVO1.setPcdordday(java.sql.Date.valueOf("2019-1-25"));
			pcdVO1.setPcdmoney(85000);
			pcdVO1.setPcdstatus(1);
			pcdVO1.setPcdsecphone("0980888756");
			pcdVO1.setPcdfamdata("謝隆隆 50/2/9 侯友宜 52/3/3 盧秀燕  55/7/7");
			pcdVO1.setPcdmark("年輕人挑剔");
			dao.insert(pcdVO1);		
			System.out.println("新增一筆"+ pcdVO1.getPtpno());
		
			System.out.println("==============================================");
			// 修改
			PcdVO pcdVO2 = new PcdVO();
//			PTPNO=?, MEMNO=?, PCDTRIPMEN=?, PCDORDDAY=? , PCDMONEY=? ,PCDSTATUS=? , PCDSECPHONE=? ,PCDFAMDATA=? , PCDMARK=? WHERE PCDNO = ?";
				 		
			pcdVO2.setPtpno("PTP000003");
			pcdVO2.setMemno("MEM000003");
			pcdVO2.setPcdtripmen(5);
			pcdVO2.setPcdordday(java.sql.Date.valueOf("2019-1-25"));
			pcdVO2.setPcdmoney(85000);
			pcdVO2.setPcdstatus(1);
			pcdVO2.setPcdsecphone("0980888756");
			pcdVO2.setPcdfamdata("馬英九 50/2/9 蔡英文 52/3/3 李登輝  25/7/7");
			pcdVO2.setPcdmark("年輕人挑剔XXXX");
			pcdVO2.setPcdno("PCD000021");
			dao.update(pcdVO2);		
			
			System.out.println("修改"+pcdVO2.getPcdno() +"成功");

			

			// 刪除
			dao.delete("PCD000009");
			System.out.println("刪除成功");
			System.out.println("=======================================================");

			// 查詢
//			PcdVO pcdVO3 = dao.findByPrimaryKey("PCD000008");
//			System.out.print(pcdVO3.getPtpno() + ",");
//			System.out.print(pcdVO3.getMemno() + ",");
//			System.out.print(pcdVO3.getPcdtripmen() + ",");
//			System.out.print(pcdVO3.getPcdordday() + ",");
//			System.out.print(pcdVO3.getPcdmoney() + ",");
//			System.out.print(pcdVO3.getPcdstatus() + ",");
//			System.out.print(pcdVO3.getPcdsecphone() + ",");
//			System.out.print(pcdVO3.getPcdfamdata()+ ",");
//			System.out.print(pcdVO3.getPcdmark() + ",");
//			System.out.println("---------------------");
			
			
			// 查詢
			
//			List<PcdVO> list = dao.getAll();
//			for (PcdVO pcdBody : list) {
//				System.out.print(pcdBody.getPcdno() + ", ");
//				System.out.print(pcdBody.getPtpno() + ", ");
//				System.out.print(pcdBody.getMemno() + ", ");
//				System.out.print(pcdBody.getPcdtripmen() + " ,");
//				System.out.print(pcdBody.getPcdordday() + ", ");
//				System.out.print(pcdBody.getPcdmoney() + ", ");
//				System.out.print(pcdBody.getPcdstatus() + ", ");
//				System.out.print(pcdBody.getPcdsecphone()+ ", ");
//				System.out.print(pcdBody.getPcdfamdata() + ", ");
//				System.out.print(pcdBody.getPcdmark() + ",");
//				
//				System.out.println();
//			
//			}
		}
	}	
		
		
		
		
		
		
		
		
		
	


