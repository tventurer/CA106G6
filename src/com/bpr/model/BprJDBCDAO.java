package com.bpr.model;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;

public class BprJDBCDAO implements BprDAO_interface {
	private static String INSERT_STMT = 
			"INSERT INTO BLOGPOSTREPORT (BPRNO, POSNO, BPCNO, MEMNO, EMPNO, BPRTAG, BPRCONTENT, BPRTIME, BPRSTATUS, BPRRESULT) VALUES (('BPR' || LPAD(to_char(BPR_SEQ.NEXTVAL), 6 , '0')), ?, ?, ?, ?, ?, ?, SYSTIMESTAMP, ?, ?)";
	private static String DELETE = 
			"DELETE FROM BLOGPOSTREPORT WHERE BPRNO = ?";
	private static String UPDATE = 
			"UPDATE BLOGPOSTREPORT SET BPRSTATUS = ?, BPRRESULT = ? WHERE BPRNO = ?";
	private static String GET_ONE_STMT = 
			"SELECT BPRNO, POSNO, BPCNO, MEMNO, EMPNO, BPRTAG, BPRCONTENT, to_char(BPRTIME,'yyyy-mm-dd') BPRTIME, BPRSTATUS, BPRRESULT FROM BLOGPOSTREPORT WHERE BPRNO = ?";
	private static String GET_ALL_STMT = 
			"SELECT BPRNO, POSNO, BPCNO, MEMNO, EMPNO, BPRTAG, BPRCONTENT, to_char(BPRTIME,'yyyy-mm-dd') BPRTIME, BPRSTATUS, BPRRESULT FROM BLOGPOSTREPORT ORDER BY POSNO";
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String user = "TV";
	String password = "123456";
	
	@Override
	public int insert(BprVO bprvo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0; 
		
		try {
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, bprvo.getPosno());
			pstmt.setString(2, bprvo.getBpcno());
			pstmt.setString(3, bprvo.getMemno());
			pstmt.setString(4, bprvo.getEmpno());
			pstmt.setString(5, bprvo.getBprtag());
			pstmt.setString(6, bprvo.getBprcontent());
			pstmt.setInt(7, bprvo.getBprstatus());
			pstmt.setInt(8, bprvo.getBprresult());
			
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
	public int delete(String bprno) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(DELETE);
			pstmt.setString(1, bprno);
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
	public int update(BprVO bprvo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(UPDATE);
			pstmt.setInt(1, bprvo.getBprstatus());
			pstmt.setInt(2, bprvo.getBprresult());
			pstmt.setString(3, bprvo.getBprno());
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
	public BprVO findByPrimaryKey(String bprno) {
		Connection con = null;
		PreparedStatement pstmt = null;
		BprVO vo = null;
		ResultSet rs = null;
		try {
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setString(1, bprno);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				vo = new BprVO();
				vo.setBprno(rs.getString("BPRNO"));
				vo.setPosno(rs.getString("POSNO"));
				vo.setBpcno(rs.getString("BPCNO"));
				vo.setMemno(rs.getString("MEMNO"));
				vo.setEmpno(rs.getString("EMPNO"));
				vo.setBprtag(rs.getString("BPRTAG"));
				vo.setBprcontent(rs.getString("BPRCONTENT"));
				vo.setBprtime(rs.getDate("BPRTIME"));
				vo.setBprstatus(rs.getInt("BPRSTATUS"));
				vo.setBprresult(rs.getInt("BPRRESULT"));
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
		return vo;
	}

	@Override
	public List<BprVO> getAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		BprVO vo = null;
		ResultSet rs = null;
		List<BprVO> list = null;
		
		try {
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			list = new ArrayList<BprVO>();
			while (rs.next()) {
				vo = new BprVO();
				vo.setBprno(rs.getString("BPRNO"));
				vo.setPosno(rs.getString("POSNO"));
				vo.setBpcno(rs.getString("BPCNO"));
				vo.setMemno(rs.getString("MEMNO"));
				vo.setEmpno(rs.getString("EMPNO"));
				vo.setBprtag(rs.getString("BPRTAG"));
				vo.setBprcontent(rs.getString("BPRCONTENT"));
				vo.setBprtime(rs.getDate("BPRTIME"));
				vo.setBprstatus(rs.getInt("BPRSTATUS"));
				vo.setBprresult(rs.getInt("BPRRESULT"));
				list.add(vo);
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
		BprDAO_interface dao = new BprJDBCDAO();
		BprVO vo = new BprVO();
		
		/************************
		 *        INSERT        *
		 ************************/
//		vo.setPosno("POS000001");
//		vo.setMemno("MEM000001");
//		vo.setEmpno("EMP000001");
//		vo.setBprtag("怪怪ㄉ");
//		vo.setBprcontent("實況吃雞");
//		vo.setBprstatus(0);
//		vo.setBprresult(0);
//		
//		System.out.println(dao.insert(vo));
		/************************
		 *        DELETE        *
		 ************************/
//		System.out.println(dao.delete("BPR000001"));
		
		/************************
		 *        UPDATE        *
		 ************************/
//		vo.setBprstatus(1);
//		vo.setBprresult(1);
//		vo.setBprno("BPR000002");
//		System.out.println(dao.update(vo));
		
		/************************
		 *        QUERY         *
		 ************************/
//		vo = dao.findByPrimaryKey("BPR000002");
//		System.out.println(vo.getBprcontent());
		
		/************************
		 *        GETALL        *
		 ************************/
//		List<BprVO> list = dao.getAll();
//		for (BprVO b : list) {
//			System.out.println(b.getBprcontent());
//		}
	}

}
