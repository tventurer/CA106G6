package com.mem.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemDAO implements MemDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TV");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String INSERT_STMT = 
			"INSERT INTO MEMBER (MEMNO, MEMACC, MEMPWD, MEMEMAIL, MEMEMAILVALID, MEMREALNAME, MEMENGNAME, MEMPHONE, MEMBIRTH, MEMADDR, MEMIDNO, MEMBANKACC) VALUES (('MEM' || LPAD(to_char(MEM_SEQ.NEXTVAL), 6 , '0')), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = 
			"SELECT MEMNO, MEMACC, MEMPWD, MEMEMAIL, MEMEMAILVALID, MEMREALNAME, MEMENGNAME, MEMPHONE, MEMBIRTH, MEMADDR, MEMIDNO, MEMBANKACC, MEMPHOTO FROM MEMBER";
	private static final String GET_ONE_STMT = 
			"SELECT MEMNO, MEMACC, MEMPWD, MEMEMAIL, MEMEMAILVALID, MEMREALNAME, MEMENGNAME, MEMPHONE, MEMBIRTH, MEMADDR, MEMIDNO, MEMBANKACC FROM MEMBER WHERE MEMNO = ?";
	private static final String UPDATE = 
			"UPDATE MEMBER SET MEMACC = ?, MEMPWD = ?, MEMEMAIL = ?, MEMEMAILVALID = ?, MEMREALNAME = ?, MEMENGNAME = ?, MEMPHONE = ?, MEMBIRTH = ?, MEMADDR = ?, MEMIDNO = ?, MEMBANKACC = ? WHERE MEMNO = ?";
	
	@Override
	public int insert(MemVO memVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, memVO.getMemacc());
			pstmt.setString(2, memVO.getMempwd());
			pstmt.setString(3, memVO.getMememail());
			pstmt.setInt(4, memVO.getMememailvalid());
			pstmt.setString(5, memVO.getMemrealname());
			pstmt.setString(6, memVO.getMemengname());
			pstmt.setString(7, memVO.getMemphone());
			pstmt.setDate(8, memVO.getMembirth());
			pstmt.setString(9, memVO.getMemaddr());
			pstmt.setString(10, memVO.getMemidno());
			pstmt.setString(11, memVO.getMembankacc());
			
			result = pstmt.executeUpdate();

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
		return result;
	}

	@Override
	public int update(MemVO memVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setString(1, memVO.getMemacc());
			pstmt.setString(2, memVO.getMempwd());
			pstmt.setString(3, memVO.getMememail());
			pstmt.setInt(4, memVO.getMememailvalid());
			pstmt.setString(5, memVO.getMemrealname());
			pstmt.setString(6, memVO.getMemengname());
			pstmt.setString(7, memVO.getMemphone());
			pstmt.setDate(8, memVO.getMembirth());
			pstmt.setString(9, memVO.getMemaddr());
			pstmt.setString(10, memVO.getMemidno());
			pstmt.setString(11, memVO.getMembankacc());
			
			pstmt.setString(12, memVO.getMemno());
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
	public MemVO findByPrimaryKey(String memno) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemVO memvo = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			
			pstmt.setString(1, memno);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				memvo = new MemVO();
				memvo.setMemno(rs.getString("MEMNO"));
				memvo.setMemacc(rs.getString("MEMACC"));
				memvo.setMempwd(rs.getString("MEMPWD"));
				memvo.setMememail(rs.getString("MEMEMAIL"));
				memvo.setMememailvalid(rs.getInt("MEMEMAILVALID"));
				memvo.setMemrealname(rs.getString("MEMREALNAME"));
				memvo.setMemengname(rs.getString("MEMENGNAME"));
				memvo.setMemphone(rs.getString("MEMPHONE"));
				memvo.setMembirth(rs.getDate("MEMBIRTH"));
				memvo.setMemaddr(rs.getString("MEMADDR"));
				memvo.setMemidno(rs.getString("MEMIDNO"));
				memvo.setMembankacc(rs.getString("MEMBANKACC"));
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
		return memvo;
	}

	@Override
	public List<MemVO> getAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		List<MemVO> list = new ArrayList<MemVO>();
		MemVO memvo = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				memvo = new MemVO();
				memvo.setMemno(rs.getString("MEMNO"));
				memvo.setMemacc(rs.getString("MEMACC"));
				memvo.setMempwd(rs.getString("MEMPWD"));
				memvo.setMememail(rs.getString("MEMEMAIL"));
				memvo.setMememailvalid(rs.getInt("MEMEMAILVALID"));
				memvo.setMemrealname(rs.getString("MEMREALNAME"));
				memvo.setMemengname(rs.getString("MEMENGNAME"));
				memvo.setMemphone(rs.getString("MEMPHONE"));
				memvo.setMembirth(rs.getDate("MEMBIRTH"));
				memvo.setMemaddr(rs.getString("MEMADDR"));
				memvo.setMemidno(rs.getString("MEMIDNO"));
				memvo.setMembankacc(rs.getString("MEMBANKACC"));
				
				list.add(memvo);
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
}