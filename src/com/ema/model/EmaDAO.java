package com.ema.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class EmaDAO implements EmaDAO_interface{

	private final static String INSERT_STMT="INSERT INTO EMPAUTHORIZATION(empno, emrno, emastate) VALUES(?, ?, ?)";
	private final static String DELETE_STMT="DELETE FROM EMPAUTHORIZATION WHERE empno=? AND emrno=?";
	private final static String UPDATE_STMT="UPDATE EMPAUTHORIZATION SET emastate=? WHERE empno=? AND emrno=?";
	private final static String GET_ONE_STMT="SELECT empno, emrno, emastate FROM EMPAUTHORIZATION WHERE empno=? AND emrno=?";
	private final static String GET_ALL_STMT="SELECT * FROM EMPAUTHORIZATION";
	
	private static DataSource ds = null;
	
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TV");
		}catch(NamingException ne) {
			ne.printStackTrace();
		}
	}

	@Override
	public void insert(EmaVO emaVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
	
			con = ds.getConnection();
			
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1,  emaVO.getEmpno());
			pstmt.setString(2,  emaVO.getEmrno());
			pstmt.setInt(3,  emaVO.getEmastate());
			
			pstmt.executeUpdate();
			
		}catch(SQLException sqle) {
			throw new RuntimeException("A database error occured." + sqle.getMessage());
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch(SQLException sqle) {
					sqle.printStackTrace(System.err);
				}
			}
			if(con != null) {
				try {
					con.close();
				}catch(SQLException sqle) {
					sqle.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public void delete(String empno, String emrno) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			
			con = ds.getConnection();
			
			pstmt = con.prepareStatement(DELETE_STMT);
			
			pstmt.setString(1,  empno);
			pstmt.setString(2,  emrno);

			pstmt.executeUpdate();
			
		}catch(SQLException sqle) {
			throw new RuntimeException("A database error occured." + sqle.getMessage());
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch(SQLException sqle) {
					sqle.printStackTrace(System.err);
				}
			}
			if(con != null) {
				try {
					con.close();
				}catch(SQLException sqle) {
					sqle.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public void update(EmaVO emaVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {

			con = ds.getConnection();
			
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			pstmt.setInt(1, emaVO.getEmastate());
			pstmt.setString(2, emaVO.getEmpno());
			pstmt.setString(3, emaVO.getEmrno());

			pstmt.executeUpdate();
			
		}catch(SQLException sqle) {
			throw new RuntimeException("A database error occured." + sqle.getMessage());
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch(SQLException sqle) {
					sqle.printStackTrace(System.err);
				}
			}
			if(con != null) {
				try {
					con.close();
				}catch(SQLException sqle) {
					sqle.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public EmaVO findByPrimaryKey(String empno, String emrno) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		EmaVO emaVO = null;
		try {

			con = ds.getConnection();
			
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, empno);
			pstmt.setString(2, emrno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				emaVO = new EmaVO();
				emaVO.setEmpno(rs.getString(1));
				emaVO.setEmrno(rs.getString(2));
				emaVO.setEmastate(rs.getInt(3));
			}
			
		}catch(SQLException sqle) {
			throw new RuntimeException("A database error occured." + sqle.getMessage());
		}finally {
			if(rs != null) {
				try {
					rs.close();
				}catch(SQLException sqle){
					sqle.printStackTrace(System.err);
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch(SQLException sqle) {
					sqle.printStackTrace(System.err);
				}
			}
			if(con != null) {
				try {
					con.close();
				}catch(SQLException sqle) {
					sqle.printStackTrace(System.err);
				}
			}
		}
		return emaVO;
	}

	@Override
	public List<EmaVO> getAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		EmaVO emaVO = null;
		List<EmaVO> list = new ArrayList<>();
		try {

			con = ds.getConnection();
			
			pstmt = con.prepareStatement(GET_ALL_STMT);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				emaVO = new EmaVO();
				emaVO.setEmpno(rs.getString(1));
				emaVO.setEmrno(rs.getString(2));
				emaVO.setEmastate(rs.getInt(3));
				list.add(emaVO);
			}
			
		}catch(SQLException sqle) {
			throw new RuntimeException("A database error occured." + sqle.getMessage());
		}finally {
			if(rs != null) {
				try {
					rs.close();
				}catch(SQLException sqle){
					sqle.printStackTrace(System.err);
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch(SQLException sqle) {
					sqle.printStackTrace(System.err);
				}
			}
			if(con != null) {
				try {
					con.close();
				}catch(SQLException sqle) {
					sqle.printStackTrace(System.err);
				}
			}
		}
		return list;
	}
	
	
}
