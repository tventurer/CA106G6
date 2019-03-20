package com.pre.model;

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

import com.por.model.PorVO;


public class PreJDBCDAO implements PreDAO_interface{
		// 一個應用程式終，針對一個資料庫，共用一個DataSource即可
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "TV";
	String passwd = "123456";
		
		private static final String INSERT_STMT = 
				"INSERT INTO PURCHASEREPORT (PREID,MEMNO,PURID,EMPNO,PRECAUSE,PRETIME,PRESTATUS,PRELABEL,PRERESULT) VALUES ('PRE'||LPAD(to_char(PREID_SEQ.NEXTVAL),6,'0'), ?, ?, ?, ?, CURRENT_TIMESTAMP, ?, ?, ?)";
			private static final String GET_ALL_STMT = 
				"SELECT * FROM PURCHASEREPORT order by PREID";
			private static final String GET_ONE_STMT = 
				"SELECT * FROM PURCHASEREPORT where PREID = ?";
			private static final String DELETE = 
				"DELETE FROM PURCHASEREPORT where PREID = ?";
			private static final String UPDATE = 
				"UPDATE PURCHASEREPORT set MEMNO=? , PURID=? ,EMPNO=? ,PRECAUSE=? ,PRETIME=sysdate ,PRESTATUS=? ,PRELABEL=? ,PRERESULT=? where PREID = ?";
			
			//更新違規
			private static final String UPDATE_PRERESULT = 
			"UPDATE PURCHASEREPORT set PRERESULT=? ,prestatus=1 where PREID = ?";
	@Override
	public void insert(PreVO preVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
				con.setAutoCommit(true);
				pstmt.setString(1, preVO.getMemno());
				pstmt.setString(2, preVO.getPurid());
				pstmt.setString(3, preVO.getEmpno());
				pstmt.setString(4, preVO.getPrecause());
				pstmt.setInt(5, preVO.getPrestatus());
				pstmt.setInt(6, preVO.getPrelabel());
				pstmt.setInt(7, preVO.getPreresult());
				
				pstmt.executeUpdate();
				con.commit();
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
	public void update(PreVO preVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, preVO.getMemno());
			pstmt.setString(2, preVO.getPurid());
			pstmt.setString(3, preVO.getEmpno());
			pstmt.setString(4, preVO.getPrecause());
			pstmt.setInt(5, preVO.getPrestatus());
			pstmt.setInt(6, preVO.getPrelabel());
			pstmt.setInt(7, preVO.getPreresult());
			pstmt.setString(8, preVO.getPreid());

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
	public void delete(String preid) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, preid);

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
	public PreVO findByPrimaryKey(String preid) {
		// TODO Auto-generated method stub
		PreVO preVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, preid);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// preVO 也稱為 Domain objects
				preVO = new PreVO();
				preVO.setPreid(rs.getString("preid"));
				preVO.setMemno(rs.getString("memno"));
				preVO.setPurid(rs.getString("purid"));
				preVO.setEmpno(rs.getString("empno"));
				preVO.setPrecause(rs.getString("precause"));
				preVO.setPretime(rs.getTimestamp("pretime"));
				preVO.setPrestatus(rs.getInt("prestatus"));
				preVO.setPrelabel(rs.getInt("prelabel"));
				preVO.setPreresult(rs.getInt("preresult"));
				
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
		return preVO;
	}

	@Override
	public List<PreVO> getAll() {
		// TODO Auto-generated method stub
		List<PreVO> list = new ArrayList<PreVO>();
		PreVO preVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// acrVO 也稱為 Domain objects
				preVO = new PreVO();
				preVO.setPreid(rs.getString("preid"));
				preVO.setMemno(rs.getString("memno"));
				preVO.setPurid(rs.getString("purid"));
				preVO.setEmpno(rs.getString("empno"));
				preVO.setPrecause(rs.getString("precause"));
				preVO.setPretime(rs.getTimestamp("pretime"));
				preVO.setPrestatus(rs.getInt("prestatus"));
				preVO.setPrelabel(rs.getInt("prelabel"));
				preVO.setPreresult(rs.getInt("preresult"));
				list.add(preVO); // Store the row in the list
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

	@Override
	public void updatePreresult(PreVO preVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_PRERESULT);


			pstmt.setInt(1, preVO.getPreresult());
			pstmt.setString(2, preVO.getPreid());

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

}
