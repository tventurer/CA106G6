package com.pos.model;

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

public class PosDAO implements PosDAO_interface {
	private static DataSource ds = null;
	private static String INSERT_STMT = 
			"INSERT INTO BLOGPOST (POSNO, MEMNO, TAGNO, POSTITLE, POSCONTENT, POSTIME) VALUES (('POS' || LPAD(to_char(POS_SEQ.NEXTVAL), 6 , '0')), ?, ?, ?, ?, SYSTIMESTAMP)";
	private static String DELETE = 
			"DELETE FROM BLOGPOST WHERE POSNO = ?";
	private static String UPDATE = 
			"UPDATE BLOGPOST SET MEMNO = ?, TAGNO = ?, POSTITLE = ?, POSCONTENT = ?, POSTIME = ? WHERE POSNO = ?";
	private static String GET_ONE_STMT = 
			"SELECT POSNO, MEMNO, TAGNO, POSTITLE, POSCONTENT, to_char(POSTIME,'yyyy-mm-dd hh:mm:ss') POSTIME FROM BLOGPOST WHERE POSNO = ?";
	private static String GET_ALL_STMT = 
			"SELECT POSNO, MEMNO, TAGNO, POSTITLE, POSCONTENT, to_char(POSTIME,'yyyy-mm-dd hh:mm:ss') POSTIME FROM BLOGPOST ORDER BY POSNO DESC";
	
	private static String GET_NEWEST_POST_BY_MEMNO = 
			"SELECT POSNO FROM BLOGPOST WHERE MEMNO = ? ORDER BY POSTIME DESC";
	
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TV");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}	
	@Override
	public String insert(PosVO posvo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String key = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT, java.sql.Statement.RETURN_GENERATED_KEYS);
			
			pstmt.setString(1, posvo.getMemno());
			pstmt.setString(2, posvo.getTagno());
			pstmt.setString(3, posvo.getPostitle());
			pstmt.setString(4, posvo.getPoscontent());
			
			pstmt.executeUpdate();
			pstmt.close();
			
			pstmt = con.prepareStatement(GET_NEWEST_POST_BY_MEMNO);
			pstmt.setString(1, posvo.getMemno());
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				key = rs.getString(1);
			}
		} catch (SQLException se) {
			se.printStackTrace();
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
		
		return key;
	}
	
	@Override
	public int delete(String posno) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			pstmt.setString(1, posno);
			
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
	public int update(PosVO posvo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setString(1, posvo.getMemno());
			pstmt.setString(2, posvo.getTagno());
			pstmt.setString(3, posvo.getPostitle());
			pstmt.setString(4, posvo.getPoscontent());
			pstmt.setTimestamp(5, posvo.getPostime());
			pstmt.setString(6, posvo.getPosno());
			
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
	public PosVO findByPrimaryKey(String posno) {
		Connection con = null;
		PreparedStatement pstmt = null;
		PosVO posvo = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setString(1, posno);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				posvo = new PosVO();
				posvo.setPosno(rs.getString("POSNO"));
				posvo.setMemno(rs.getString("MEMNO"));
				posvo.setTagno(rs.getString("TAGNO"));
				posvo.setPostitle(rs.getString("POSTITLE"));
				posvo.setPoscontent(rs.getString("POSCONTENT"));
				posvo.setPostime(rs.getTimestamp("POSTIME"));			
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
		return posvo;
	}

	@Override
	public List<PosVO> getAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		List<PosVO> list = new ArrayList<PosVO>();
		PosVO posvo = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				posvo = new PosVO();
				posvo.setPosno(rs.getString("POSNO"));
				posvo.setMemno(rs.getString("MEMNO"));
				posvo.setTagno(rs.getString("TAGNO"));
				posvo.setPostitle(rs.getString("POSTITLE"));
				posvo.setPoscontent(rs.getString("POSCONTENT"));
				posvo.setPostime(rs.getTimestamp("POSTIME"));
				list.add(posvo);
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
