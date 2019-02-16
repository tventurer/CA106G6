package com.acr.model;

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

public class AcrJDBCDAO implements AcrDAO_interface{

	// 一個應用程式終，針對一個資料庫，共用一個DataSource即可
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "TV";
	String passwd = "123456";
	
		private static final String INSERT_STMT = 
			"INSERT INTO  ACCOUNTRECORD (ACRID,MEMNO,ACRTIME,ACRPRICE,ACRSOURCE,ACREND,ACRTOTAL) VALUES ('ACR'||LPAD(to_char(ACRID_SEQ.NEXTVAL),6,'0'), ?, CURRENT_TIMESTAMP, ?, ?, ?, ?)";
		private static final String GET_ALL_STMT = 
			"SELECT ACRID,MEMNO,to_char(ACRTIME,'YYYY-MM-DD HH24:MI:SS') ACRTIME, ACRPRICE, ACRSOURCE, ACREND, ACRTOTAL FROM ACCOUNTRECORD order by ACRID";
		private static final String GET_ONE_STMT = 
			"SELECT ACRID,MEMNO,to_char(ACRTIME,'YYYY-MM-DD HH24:MI:SS') ACRTIME, ACRPRICE, ACRSOURCE, ACREND, ACRTOTAL FROM ACCOUNTRECORD where ACRID = ?";
		private static final String DELETE = 
			"DELETE FROM ACCOUNTRECORD WHERE ACRID = ?";
		private static final String UPDATE = 
			"UPDATE ACCOUNTRECORD set MEMNO=?, ACRTIME=sysdate, ACRPRICE=?, ACRSOURCE=?, ACREND=?, ACRTOTAL=? where ACRID = ?";
	
	@Override
	public void insert(AcrVO acrVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, acrVO.getMemno());
			pstmt.setInt(2, acrVO.getAcrprice());
			pstmt.setInt(3, acrVO.getAcrsource());
			pstmt.setString(4, acrVO.getAcrend());
			pstmt.setInt(5, acrVO.getAcrtotal());

			pstmt.executeUpdate();

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
	}

	@Override
	public void update(AcrVO acrVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, acrVO.getMemno());
			pstmt.setInt(2, acrVO.getAcrprice());
			pstmt.setInt(3, acrVO.getAcrsource());
			pstmt.setString(4, acrVO.getAcrend());
			pstmt.setInt(5, acrVO.getAcrtotal());
			pstmt.setString(6, acrVO.getAcrid());


			pstmt.executeUpdate();

			// Handle any driver errors
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
	}

	@Override
	public void delete(String acrid) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, acrid);

			pstmt.executeUpdate();

			// Handle any driver errors
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
	}

	@Override
	public AcrVO findByPrimaryKey(String acrid) {
		// TODO Auto-generated method stub
		AcrVO acrVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, acrid);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// acrVO 也稱為 Domain objects
				acrVO = new AcrVO();
				acrVO.setAcrid(rs.getString("acrid"));
				acrVO.setMemno(rs.getString("memno"));
				acrVO.setAcrtime(rs.getTimestamp("acrtime"));
				acrVO.setAcrprice(rs.getInt("acrprice"));
				acrVO.setAcrsource(rs.getInt("acrsource"));
				acrVO.setAcrend(rs.getString("acrend"));
				acrVO.setAcrtotal(rs.getInt("acrtotal"));
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
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
		return acrVO;
	}

	@Override
	public List<AcrVO> getAll() {
		// TODO Auto-generated method stub
		List<AcrVO> list = new ArrayList<AcrVO>();
		AcrVO acrVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// acrVO 也稱為 Domain objects
				acrVO = new AcrVO();
				acrVO.setAcrid(rs.getString("acrid"));
				acrVO.setMemno(rs.getString("memno"));
				acrVO.setAcrtime(rs.getTimestamp("acrtime"));
				acrVO.setAcrprice(rs.getInt("acrprice"));
				acrVO.setAcrsource(rs.getInt("acrsource"));
				acrVO.setAcrend(rs.getString("acrend"));
				acrVO.setAcrtotal(rs.getInt("acrtotal"));
				list.add(acrVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
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
