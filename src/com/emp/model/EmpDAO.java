package com.emp.model;

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

public class EmpDAO implements EmpDAO_interface{

	private final String INSERT_STMT = "INSERT INTO EMPLOYEE(empno, empname, emppwd, empgen, empphone, empcell, empmail, empdept, empposi, empsal, empdoe, emppic) VALUES('EMP'||LPAD(to_char(SEQ_EMP_EMPNO.NEXTVAL), 6, '0'), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private final String DELETE_STMT = "DELETE FROM EMPLOYEE WHERE empno = ?";
	private final String UPDATE_STMT = "UPDATE EMPLOYEE SET empname=?, emppwd=?, empgen=?, empphone=?, empcell=?, empmail=?, empdept=?, empposi=?, empsal=?, empdoe=?, emppic=? WHERE empno = ?";
	private final String GET_ONE_STMT = "SELECT empno, empname, emppwd, empgen, empphone, empcell, empmail, empdept, empposi, empsal, empdoe, emppic FROM EMPLOYEE WHERE empno = ?";
	private final String GET_ALL_STMT = "SELECT * FROM EMPLOYEE";
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext(); //NamingException
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/TV");
		}catch(NamingException ne) {
			ne.printStackTrace();
		}
	}
	
	@Override
	public void insert(EmpVO empVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
		
			con = ds.getConnection(); //SQLException
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, empVO.getEmpname());
			pstmt.setString(2,  empVO.getEmppwd());
			pstmt.setInt(3,  empVO.getEmpgen());
			pstmt.setString(4, empVO.getEmpphone());
			pstmt.setString(5,  empVO.getEmpcell());
			pstmt.setString(6,  empVO.getEmpmail());
			pstmt.setString(7,  empVO.getEmpdept());
			pstmt.setString(8, empVO.getEmpposi());
			pstmt.setInt(9, empVO.getEmpsal());
			pstmt.setDate(10, empVO.getEmpdoe());
			pstmt.setBytes(11, empVO.getEmppic()); 
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
	public void update(EmpVO empVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			pstmt.setString(1, empVO.getEmpname());
			pstmt.setString(2, empVO.getEmppwd());
			pstmt.setInt(3, empVO.getEmpgen());
			pstmt.setString(4, empVO.getEmpphone());
			pstmt.setString(5, empVO.getEmpcell());
			pstmt.setString(6, empVO.getEmpmail());
			pstmt.setString(7, empVO.getEmpdept());
			pstmt.setString(8, empVO.getEmpposi());
			pstmt.setInt(9, empVO.getEmpsal());
			pstmt.setDate(10, empVO.getEmpdoe());
			pstmt.setBytes(11, empVO.getEmppic()); //照片
			pstmt.setString(12, empVO.getEmpno());
			
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
	public void delete(String empno) {
		
			Connection con = null;
			PreparedStatement pstmt = null;
			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(DELETE_STMT);
				
				pstmt.setString(1, empno);
				
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
	public EmpVO findByPrimaryKey(String empno) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		EmpVO empVO = null;
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			
			pstmt.setString(1,  empno);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				empVO = new EmpVO();
				empVO.setEmpno(rs.getString(1));
				empVO.setEmpname(rs.getString(2));
				empVO.setEmppwd(rs.getString(3));
				empVO.setEmpgen(rs.getInt(4));
				empVO.setEmpphone(rs.getString(5));
				empVO.setEmpcell(rs.getString(6));
				empVO.setEmpmail(rs.getString(7));
				empVO.setEmpdept(rs.getString(8));
				empVO.setEmpposi(rs.getString(9));
				empVO.setEmpsal(rs.getInt(10));
				empVO.setEmpdoe(rs.getDate(11));
				empVO.setEmppic(rs.getBytes(12)); //照片
			}
			
		}catch(SQLException sqle) {
			throw new RuntimeException("A database error occured." + sqle.getMessage());
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
		return empVO;
	}

	@Override
	public List<EmpVO> getAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		EmpVO empVO = null;
		List<EmpVO> list = new ArrayList<>();
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				empVO = new EmpVO();
				empVO.setEmpno(rs.getString(1));
				empVO.setEmpname(rs.getString(2));
				empVO.setEmppwd(rs.getString(3));
				empVO.setEmpgen(rs.getInt(4));
				empVO.setEmpphone(rs.getString(5));
				empVO.setEmpcell(rs.getString(6));
				empVO.setEmpmail(rs.getString(7));
				empVO.setEmpdept(rs.getString(8));
				empVO.setEmpposi(rs.getString(9));
				empVO.setEmpsal(rs.getInt(10));
				empVO.setEmpdoe(rs.getDate(11));
				empVO.setEmppic(rs.getBytes(12)); //照片
				list.add(empVO);
			}
			
		}catch(SQLException sqle) {
			throw new RuntimeException("A database error occured." + sqle.getMessage());
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
