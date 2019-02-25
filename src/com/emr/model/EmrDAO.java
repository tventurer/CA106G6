package com.emr.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class EmrDAO implements EmrDAO_interface{
	
	private static final String INSERT_STMT = "INSERT INTO EMPRIGHT(emrno, emrname) VALUES('EMR'||LPAD(TO_CHAR(seq_emr_emrno.nextval), 6, '0'), ?)";
	private static final String DELETE_STMT = "DELETE FROM EMPRIGHT WHERE emrno=?";
	private static final String UPDATE_STMT = "UPDATE EMPRIGHT SET emrname=? WHERE emrno=?";
	private static final String GET_ONE_STMT = "SELECT emrno, emrname FROM EMPRIGHT WHERE emrno=?";
	private static final String GET_ALL_STMT = "SELECT * FROM EMPRIGHT";
	
	private static DataSource ds ;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/TV");
		}catch(NamingException ne) {
			ne.printStackTrace();
		}
	}
	
	@Override
	public void insert(EmrVO emrVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {

			con = ds.getConnection();
			
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, emrVO.getEmrname());
			
			pstmt.executeUpdate();
			
		}catch(SQLException sqle) {
			throw new RuntimeException("A database error occured."+sqle.getMessage());
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
	public void update(EmrVO emrVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {

			con = ds.getConnection();
			
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			pstmt.setString(1,  emrVO.getEmrname());
			pstmt.setString(2,  emrVO.getEmrno());
			
			pstmt.executeUpdate();
			
		}catch(SQLException sqle) {
			throw new RuntimeException("A database error occured"+sqle.getMessage());
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
				}catch(SQLException sqle){
					sqle.printStackTrace(System.err);
				}
			}
		}
	}
	@Override
	public void delete(String empno) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {

			con = ds.getConnection();
			
			pstmt = con.prepareStatement(DELETE_STMT);
			
			pstmt.setString(1, empno);
			
			pstmt.executeUpdate();
			
		}catch(SQLException sqle){
			throw new RuntimeException("A database error occured."+sqle.getMessage());
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
				}catch(SQLException sqle){
					sqle.printStackTrace(System.err);
				}
			}
		}
	}
	@Override
	public EmrVO findByPrimaryKey(String emrno) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		EmrVO emrVO = null;
		try {

			con = ds.getConnection();
			
			pstmt = con.prepareStatement(GET_ONE_STMT);
			
			pstmt.setString(1, emrno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				emrVO = new EmrVO();
				emrVO.setEmrno(rs.getString(1));
				emrVO.setEmrname(rs.getString(2));
			}
			
		}catch(SQLException sqle) {
			throw new RuntimeException("A database error occured"+sqle.getMessage());
		}finally {
			if(rs != null) {
				try {
					rs.close();
				}catch(SQLException sqle) {
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
		
		return emrVO;
	}
	@Override
	public List<EmrVO> getAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<EmrVO> list = new ArrayList<>();
		EmrVO emrVO = null;
		
		try {

			con = ds.getConnection();
			
			pstmt = con.prepareStatement(GET_ALL_STMT);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				emrVO = new EmrVO();
				emrVO.setEmrno(rs.getString(1));
				emrVO.setEmrname(rs.getString(2));
				list.add(emrVO);
			}
			
		}catch(SQLException sqle) {
			throw new RuntimeException("A database error occured."+sqle.getMessage());
		}finally {
			if(rs != null) {
				try {
					rs.close();
				}catch(SQLException sqle) {
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
