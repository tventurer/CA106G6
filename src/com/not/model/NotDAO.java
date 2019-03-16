package com.not.model;

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

public class NotDAO implements NotDAO_interface {
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
			"INSERT INTO NOTIFICATION (NOTNO, MEMNO, NOTCONTENT, NOTREADED, NOTTIME) VALUES (('NOT' || LPAD(to_char(MEM_SEQ.NEXTVAL), 6 , '0')), ?, ?, 0, SYSTIMESTAMP)";
	private static final String GET_ALL_STMT = 
			"SELECT MEMNO, MEMACC, MEMPWD, MEMEMAIL, MEMEMAILVALID, MEMREALNAME, MEMENGNAME, MEMPHONE, MEMBIRTH, MEMADDR, MEMIDNO, MEMBANKACC, MEMPHOTO FROM MEMBER";
	private static final String GET_ONE_STMT = 
			"SELECT MEMNO, MEMACC, MEMPWD, MEMEMAIL, MEMEMAILVALID, MEMREALNAME, MEMENGNAME, MEMPHONE, MEMBIRTH, MEMADDR, MEMIDNO, MEMBANKACC FROM MEMBER WHERE MEMNO = ?";
	private static final String UPDATE = 
			"UPDATE MEMBER SET MEMACC = ?, MEMPWD = ?, MEMEMAIL = ?, MEMEMAILVALID = ?, MEMREALNAME = ?, MEMENGNAME = ?, MEMPHONE = ?, MEMBIRTH = ?, MEMADDR = ?, MEMIDNO = ?, MEMBANKACC = ? WHERE MEMNO = ?";
	private static final String GET_BY_MEMNO = 
			"SELECT NOTCONTENT, NOTREADED, NOTTIME FROM NOTIFICATION WHERE MEMNO = ?";
	
	@Override
	public int insert(NotVO notVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, notVO.getMemno());
			pstmt.setString(2, notVO.getNotcontent());
			
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
	public int delete(String notVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public NotVO findByPrimaryKey(String notno) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<NotVO> findByMemno(String memno) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		NotVO vo = null;
		List<NotVO> list = new ArrayList<NotVO>();
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_BY_MEMNO);
			
			pstmt.setString(1, memno);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				vo = new NotVO();
				
				vo.setNotcontent(rs.getString("NOTCONTENT"));
				vo.setNotreaded(rs.getInt("NOTREADED"));
				vo.setNottime(rs.getDate("NOTTIME"));
				
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

	@Override
	public List<NotVO> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
