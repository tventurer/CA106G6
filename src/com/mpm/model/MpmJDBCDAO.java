package com.mpm.model;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;

public class MpmJDBCDAO implements MpmDAO_interface {
	private static String INSERT_STMT = 
			"INSERT INTO MEMBERPRIVATEMESSAGE (MPMNO, MPMSENDER, MPMRECIVER, MPMTITLE, MPMCONTENT, MPMTIME, MPMREADED) VALUES (('MPM' || LPAD(to_char(MPM_SEQ.NEXTVAL), 6 , '0')), ?, ?, ?, ?, SYSTIMESTAMP, ?)";
	private static String DELETE = 
			"DELETE FROM MEMBERPRIVATEMESSAGE WHERE MPMNO = ?";
	private static String UPDATE = 
			"UPDATE MEMBERPRIVATEMESSAGE SET MPMTITLE = ?, MPMCONTENT = ? WHERE MPMNO = ?";
	private static String GET_ONE_STMT = 
			"SELECT MPMNO, MPMSENDER, MPMRECIVER, MPMTITLE, MPMCONTENT, to_char(MPMTIME,'yyyy-mm-dd') MPMTIME, MPMREADED FROM MEMBERPRIVATEMESSAGE WHERE MPMNO = ?";
	private static String GET_ALL_STMT = 
			"SELECT MPMNO, MPMSENDER, MPMRECIVER, MPMTITLE, MPMCONTENT, to_char(MPMTIME,'yyyy-mm-dd') MPMTIME, MPMREADED FROM MEMBERPRIVATEMESSAGE ORDER BY MPMNO";

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String user = "TV";
	String password = "123456";
	
	@Override
	public int insert(MpmVO mpmvo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, mpmvo.getMpmsender());
			pstmt.setString(2, mpmvo.getMpmreceiver());
			pstmt.setString(3, mpmvo.getMpmtitle());
			pstmt.setString(4, mpmvo.getMpmcontent());
			pstmt.setInt(5, mpmvo.getMpmreaded());
			
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
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setString(1, mpmno);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				mpmvo = new MpmVO();
				mpmvo.setMpmno(rs.getString("MPMNO"));
				mpmvo.setMpmsender(rs.getString("MPMSENDER"));
				mpmvo.setMpmreceiver(rs.getString("MPMRECIVER"));
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
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				mpmvo = new MpmVO();
				mpmvo.setMpmno(rs.getString("MPMNO"));
				mpmvo.setMpmsender(rs.getString("MPMSENDER"));
				mpmvo.setMpmreceiver(rs.getString("MPMRECIVER"));
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

	@SuppressWarnings("unused")
	public static void main(String[] args) {
		MpmDAO_interface md = new MpmJDBCDAO();
		MpmVO mvo = new MpmVO();
		/************************
		 *        INSERT        *
		 ************************/
//		mvo.setMpmsender("MEM000002");
//		mvo.setMpmreciver("MEM000003");
//		mvo.setMpmtitle("測試標題");
//		mvo.setMpmcontent("測試內文");
//		mvo.setMpmreaded(0);
//		System.out.println(md.insert(mvo));
		/************************
		 *        DELETE        *
		 ************************/
//		System.out.println(md.delete("MPM000005"));
		
		/************************
		 *        UPDATE        *
		 ************************/
//		bpcvo.setBpccontent("修改測試");
//		bpcvo.setBpcno("BPC000004");
//		System.out.println(bdao.update(bpcvo));
		
		/************************
		 *        QUERY         *
		 ************************/
//		mvo = md.findByPrimaryKey("MPM000001");
//		System.out.println(mvo.getMpmcontent());
		
		/************************
		 *        GETALL        *
		 ************************/
//		List<MpmVO> list = md.getAll();
//		for (MpmVO b : list) {
//			System.out.println(b.getMpmcontent());
//		}

	}

}
