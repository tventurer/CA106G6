package com.bpc.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BpcJDBCDAO implements BpcDAO_interface {
	private static String INSERT_STMT = 
			"INSERT INTO BLOGPOSTCOMMENT (BPCNO, MEMNO, POSNO, BPCCONTENT,  BPCTIME) VALUES (('BPC' || LPAD(to_char(BPC_SEQ.NEXTVAL), 6 , '0')), ?, ?, ?, SYSTIMESTAMP)";
	private static String DELETE = 
			"DELETE FROM BLOGPOSTCOMMENT WHERE BPCNO = ?";
	private static String UPDATE = 
			"UPDATE BLOGPOSTCOMMENT SET BPCCONTENT = ? WHERE BPCNO = ?";
	private static String GET_ONE_STMT = 
			"SELECT BPCNO, MEMNO, POSNO, BPCCONTENT, to_char(BPCTIME,'yyyy-mm-dd hh:mm:ss') BPCTIME FROM BLOGPOSTCOMMENT WHERE BPCNO = ?";
	private static String GET_ALL_STMT = 
			"SELECT BPCNO, MEMNO, POSNO, BPCCONTENT, to_char(BPCTIME,'yyyy-mm-dd hh:mm:ss') BPCTIME FROM BLOGPOSTCOMMENT ORDER BY POSNO";
	private static String GET_LIST_BY_POSNO = 
			"SELECT BPCNO, MEMNO, POSNO, BPCCONTENT, to_char(BPCTIME,'yyyy-mm-dd hh:mm:ss') BPCTIME FROM BLOGPOSTCOMMENT WHERE POSNO = ?";

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String user = "TV";
	String password = "123456";
	
	@Override
	public List<BpcVO> findByPosno(String posno) {
		Connection con = null;
		PreparedStatement pstmt = null;
		List<BpcVO> list = new ArrayList<BpcVO>();
		BpcVO bpcvo = null;
		ResultSet rs = null;
		
		try {
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(GET_LIST_BY_POSNO);
			pstmt.setString(1, posno);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				bpcvo = new BpcVO();
				bpcvo.setBpcno(rs.getString("BPCNO"));
				bpcvo.setMemno(rs.getString("MEMNO"));
				bpcvo.setPosno(rs.getString("POSNO"));
				bpcvo.setBpccontent(rs.getString("BPCCONTENT"));
				bpcvo.setBpctime(rs.getTimestamp("BPCTIME"));
				list.add(bpcvo);
			}
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
		return list;
	}
	
	@Override
	public int insert(BpcVO bpcVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0; 
		try {
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, bpcVO.getMemno());
			pstmt.setString(2, bpcVO.getPosno());
			pstmt.setString(3, bpcVO.getBpccontent());
			
			result = pstmt.executeUpdate();
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
		return result;
	}

	@Override
	public int delete(String bpcno) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;

		try {
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(DELETE);
			
			pstmt.setString(1, bpcno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
		return result;
	}

	@Override
	public int update(BpcVO bpcVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setString(1, bpcVO.getBpccontent());
			pstmt.setString(2, bpcVO.getBpcno());
			
			result = pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
		return result;
	}

	@Override
	public BpcVO findByPrimaryKey(String bpcno) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BpcVO bpcvo = null;
		
		try {
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			
			pstmt.setString(1, bpcno);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				bpcvo = new BpcVO();
				bpcvo.setBpcno(rs.getString("BPCNO"));
				bpcvo.setMemno(rs.getString("MEMNO"));
				bpcvo.setPosno(rs.getString("POSNO"));
				bpcvo.setBpccontent(rs.getString("BPCCONTENT"));
				bpcvo.setBpctime(rs.getTimestamp("BPCTIME"));
			}
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
		return bpcvo;
	}

	@Override
	public List<BpcVO> getAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		List<BpcVO> list = new ArrayList<BpcVO>();
		BpcVO bpcvo = null;
		ResultSet rs = null;
		
		try {
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				bpcvo = new BpcVO();
				bpcvo.setBpcno(rs.getString("BPCNO"));
				bpcvo.setMemno(rs.getString("MEMNO"));
				bpcvo.setPosno(rs.getString("POSNO"));
				bpcvo.setBpccontent(rs.getString("BPCCONTENT"));
				bpcvo.setBpctime(rs.getTimestamp("BPCTIME"));
				list.add(bpcvo);
			}
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
		return list;
	}
	
	@SuppressWarnings("unused")
	public static void main(String[] args) {
		BpcDAO_interface bdao = new BpcJDBCDAO();
		BpcVO bpcvo = new BpcVO();
		
		/************************
		 *        INSERT        *
		 ************************/
//		bpcvo.setMemno("MEM000001");
//		bpcvo.setPosno("POS000001");
//		bpcvo.setBpccontent("QQ");
//		System.out.println(bdao.insert(bpcvo));
		
		/************************
		 *        DELETE        *
		 ************************/
//		System.out.println(bdao.delete("BPC000010"));
		
		/************************
		 *        UPDATE        *
		 ************************/
//		bpcvo.setBpccontent("修改測試");
//		bpcvo.setBpcno("BPC000004");
//		System.out.println(bdao.update(bpcvo));
		
		/************************
		 *        QUERY         *
		 ************************/
//		bpcvo = bdao.findByPrimaryKey("BPC000001");
//		System.out.println(bpcvo.getBpccontent());
		
		/************************
		 *        GETALL        *
		 ************************/
//		List<BpcVO> list = bdao.getAll();
//		for (BpcVO b : list) {
//			System.out.println(b.getBpccontent());
//		}
	}

}
