package com.mpm.model;

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

public class MpmDAO implements MpmDAO_interface {
	private static DataSource ds = null;
	private static String INSERT_STMT = 
			"INSERT INTO MEMBERPRIVATEMESSAGE (MPMNO, MPMSENDER, MPMRECIVER, MPMTITLE, MPMCONTENT, MPMTIME, MPMREADED) VALUES (('MPM' || LPAD(to_char(MPM_SEQ.NEXTVAL), 6 , '0')), ?, ?, ?, ?, SYSTIMESTAMP, ?)";
	private static String DELETE = 
			"DELETE FROM MEMBERPRIVATEMESSAGE WHERE MPMNO = ?";
	private static String UPDATE = 
			"UPDATE MEMBERPRIVATEMESSAGE SET MPMTITLE = ?, MPMCONTENT = ? WHERE MPMNO = ?";
	private static String GET_ONE_STMT = 
			"SELECT MPMNO, MPMSENDER, MPMRECEIVER, MPMTITLE, MPMCONTENT, to_char(MPMTIME,'yyyy-mm-dd hh:mm:ss') MPMTIME, MPMREADED FROM MEMBERPRIVATEMESSAGE WHERE MPMNO = ?";
	private static String GET_ALL_STMT = 
			"SELECT MPMNO, MPMSENDER, MPMRECEIVER, MPMTITLE, MPMCONTENT, to_char(MPMTIME,'yyyy-mm-dd hh:mm:ss') MPMTIME, MPMREADED FROM MEMBERPRIVATEMESSAGE ORDER BY MPMNO";
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TV");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public int insert(MpmVO mpmvo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, mpmvo.getMpmsender());
			pstmt.setString(2, mpmvo.getMpmreceiver());
			pstmt.setString(3, mpmvo.getMpmtitle());
			pstmt.setString(4, mpmvo.getMpmcontent());
			pstmt.setInt(5, 0);
			
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
	public int delete(String bpcno) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			con = ds.getConnection();
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
	public int update(MpmVO mpmvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MpmVO findByPrimaryKey(String mpmno) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MpmVO mpmvo = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setString(1, mpmno);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				mpmvo = new MpmVO();
				mpmvo.setMpmno(rs.getString("MPMNO"));
				mpmvo.setMpmsender(rs.getString("MPMSENDER"));
				mpmvo.setMpmreceiver(rs.getString("MPMRECEIVER"));
				mpmvo.setMpmtitle(rs.getString("MPMTITLE"));
				mpmvo.setMpmcontent(rs.getString("MPMCONTENT"));
				mpmvo.setMpmtime(rs.getTimestamp("MPMTIME"));
				mpmvo.setMpmreaded(rs.getInt("MPMREADED"));
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
		return mpmvo;
	}

	@Override
	public List<MpmVO> getAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MpmVO mpmvo = null;
		List<MpmVO> list = new ArrayList<MpmVO>();
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				mpmvo = new MpmVO();
				mpmvo.setMpmno(rs.getString("MPMNO"));
				mpmvo.setMpmsender(rs.getString("MPMSENDER"));
				mpmvo.setMpmreceiver(rs.getString("MPMRECEIVER"));
				mpmvo.setMpmtitle(rs.getString("MPMTITLE"));
				mpmvo.setMpmcontent(rs.getString("MPMCONTENT"));
				mpmvo.setMpmtime(rs.getTimestamp("MPMTIME"));
				mpmvo.setMpmreaded(rs.getInt("MPMREADED"));
				list.add(mpmvo);
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
