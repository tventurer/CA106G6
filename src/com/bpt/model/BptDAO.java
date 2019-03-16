package com.bpt.model;

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

public class BptDAO implements BptDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TV");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String GET_ALL_STMT = 
			"SELECT TAGNO, TAGCONTENT FROM BLOGPOSTTAG";
	private static final String GET_ONE_STMT = 
			"SELECT TAGNO, TAGCONTENT FROM BLOGPOSTTAG WHERE TAGNO = ?";

	@Override
	public BptVO findByPrimaryKey(String tagno) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BptVO vo = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setString(1, tagno);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				vo = new BptVO();
				vo.setTagno(rs.getString("TAGNO"));
				vo.setTagcontent(rs.getString("TAGCONTENT"));
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
	public List<BptVO> getAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BptVO vo = null;
		List<BptVO> list = new ArrayList<BptVO>();
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				vo = new BptVO();
				vo.setTagno(rs.getString("TAGNO"));
				vo.setTagcontent(rs.getString("TAGCONTENT"));
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

}
