package com.tri.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;

public class TriDAO implements TriDAO_interface{
	
	private static final String ADD_STMT = "INSERT INTO TRIP (TRINO, MEMNO, TRINAME, TRIBEGDATE, TRIENDDATE, TRIPEONUM, TRISTAT, TRIREMARK) VALUES ('TRI'||LPAD(TO_CHAR(TRI_SEQ.NEXTVAL), 6, '0'), ?, ?, ?, ?, ?, ?, ?)";
	private static final String UPDATE_STMT = "UPDATE TRIP SET TRINAME=?, TRIBEGDATE=?, TRIENDDATE=?, TRIPEONUM=?, TRISTAT=?, TRIREMARK=? WHERE TRINO=?";
	private static final String DELETE_STMT = "DELETE FROM TRIP WHERE TRINO=?";
	private static final String FINDBYPK_STMT = "SELECT * FROM TRIP WHERE TRINO=?";
	private static final String GETALL_STMT = "SELECT * FROM TRIP";
	
	@Override
	public void add(TriVO trip) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/TV");
			con = ds.getConnection();
			String[] cols = {"TRINO"};
			pstmt = con.prepareStatement(ADD_STMT, cols);
			
			pstmt.setString(1, trip.getMemno());
			pstmt.setString(2, trip.getTriname());
			pstmt.setDate(3, trip.getTribegdate());
			pstmt.setDate(4, trip.getTrienddate());
			pstmt.setObject(5, trip.getTripeonum());
			pstmt.setInt(6, trip.getTristat());
			pstmt.setString(7, trip.getTriremark());
			
			pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null) {
				try{
					pstmt.close();
				}catch(SQLException se) {
					se.printStackTrace();
				}
			}
			if(con != null) {
				try{
					con.close();
				}catch(SQLException se) {
					se.printStackTrace();
				}
			}
		}
	}

	@Override
	public void update(TriVO trip) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/TV");
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			pstmt.setString(1, trip.getTriname());
			pstmt.setDate(2, trip.getTribegdate());
			pstmt.setDate(3, trip.getTrienddate());
			pstmt.setObject(4, trip.getTripeonum());
			pstmt.setInt(5, trip.getTristat());
			pstmt.setString(6, trip.getTriremark());
			pstmt.setString(7, trip.getTrino());
			
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null) {
				try{
					pstmt.close();
				} catch(SQLException se) {
					se.printStackTrace();
				}
			}
			
			if(con != null) {
				try{
					con.close();
				} catch(SQLException se) {
					se.printStackTrace();
				}
			}
		}
		
	}

	@Override
	public void delete(String trino) {
		
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				Context ctx = new InitialContext();
				DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/TV");
				con = ds.getConnection();
				pstmt = con.prepareStatement(DELETE_STMT);
				
				pstmt.setString(1, trino);
				
				pstmt.executeUpdate();
				
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				if(pstmt != null) {
					try {
						pstmt.close();
					} catch(SQLException se) {
						se.printStackTrace();
					}
				}
				if(con != null) {
					try {
						con.close();
					} catch(SQLException se) {
						se.printStackTrace();
					}
				}
			}
		
	}

	@Override
	public TriVO findByPk(String trino) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		TriVO trip = new TriVO();
		
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/TV");
			con = ds.getConnection();
			pstmt = con.prepareStatement(FINDBYPK_STMT);
			
			pstmt.setString(1, trino);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			trip.setTrino(rs.getString(1));
			trip.setMemno(rs.getString(2));
			trip.setTriname(rs.getString(3));
			trip.setTribegdate(rs.getDate(4));
			trip.setTrienddate(rs.getDate(5));
			trip.setTripeonum(rs.getInt(6));
			trip.setTristat(rs.getInt(7));
			trip.setTriremark(rs.getString(8));
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try{
					rs.close();
				} catch(SQLException se) {
					se.printStackTrace();
				}
			}
			if(pstmt != null) {
				try{
					pstmt.close();
				} catch(SQLException se) {
					se.printStackTrace();
				}
			}
			if(con != null) {
				try{
					con.close();
				} catch(SQLException se) {
					se.printStackTrace();
				}
			}
		}
		return trip;
	}

	@Override
	public List<TriVO> getAll() {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<TriVO> list = new ArrayList<TriVO>();
		
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/TV");
			con = ds.getConnection();
			pstmt = con.prepareStatement(GETALL_STMT);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				TriVO trip = new TriVO();
				trip.setTrino(rs.getString(1));
				trip.setMemno(rs.getString(2));
				trip.setTriname(rs.getString(3));
				trip.setTribegdate(rs.getDate(4));
				trip.setTrienddate(rs.getDate(5));
				trip.setTripeonum(rs.getInt(6));
				trip.setTristat(rs.getInt(7));
				trip.setTriremark(rs.getString(8));
				list.add(trip);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try{
					rs.close();
				} catch(SQLException se) {
					se.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch(SQLException se) {
					se.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch(SQLException se) {
					se.printStackTrace();
				}
			}
		}
		return list;
	}

}
