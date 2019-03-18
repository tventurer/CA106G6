package com.tri.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;

import com.tde.model.TdeDAO;
import com.tde.model.TdeVO;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class TriDAO implements TriDAO_interface{
	
	private static DataSource ds = null;
	static {
		try{
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/TV");
		} catch(NamingException ne) {
			ne.printStackTrace();
		}
	}
	
	private static final String ADD_STMT = "INSERT INTO TRIP (TRINO, MEMNO, TRINAME, TRIBEGDATE, TRIENDDATE, TRIPEONUM, TRISTAT, TRIREMARK) VALUES ('TRI'||LPAD(TO_CHAR(TRI_SEQ.NEXTVAL), 6, '0'), ?, ?, ?, ?, ?, ?, ?)";
	private static final String UPDATE_STMT = "UPDATE TRIP SET TRINAME=?, TRIBEGDATE=?, TRIENDDATE=?, TRIPEONUM=?, TRISTAT=?, TRIREMARK=? WHERE TRINO=?";
	private static final String DELETE_STMT = "DELETE FROM TRIP WHERE TRINO=?";
	private static final String FINDBYPK_STMT = "SELECT * FROM TRIP WHERE TRINO=?";
	private static final String FINDBYTRINAME_STMT = "SELECT * FROM TRIP WHERE TRINAME=?";
	private static final String FINDBYMEMNO_STMT = "SELECT * FROM TRIP WHERE MEMNO=?";
	private static final String GETALL_STMT = "SELECT * FROM TRIP";
	
	@Override
	public void add(TriVO trip) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(ADD_STMT);
			
			pstmt.setString(1, trip.getMemno());
			pstmt.setString(2, trip.getTriname());
			pstmt.setDate(3, trip.getTribegdate());
			pstmt.setDate(4, trip.getTrienddate());
			pstmt.setObject(5, trip.getTripeonum());
			pstmt.setInt(6, trip.getTristat());
			pstmt.setString(7, trip.getTriremark());
			
			pstmt.executeUpdate();
			
			
		} catch (SQLException se) {
			throw new RuntimeException(se.getMessage());
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
			
		} catch(SQLException se) {
			throw new RuntimeException(se.getMessage());
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
				con = ds.getConnection();
				pstmt = con.prepareStatement(DELETE_STMT);
				
				pstmt.setString(1, trino);
				
				pstmt.executeUpdate();
				
			} catch(SQLException se) {
				throw new RuntimeException(se.getMessage());
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
			
		} catch(SQLException se) {
			throw new RuntimeException(se.getMessage());
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
	public TriVO findByTriname(String triname) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		TriVO triVO = new TriVO();
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(FINDBYTRINAME_STMT);
			
			pstmt.setString(1, triname);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				triVO.setTrino(rs.getString(1));
				triVO.setMemno(rs.getString(2));
				triVO.setTriname(rs.getString(3));
				triVO.setTribegdate(rs.getDate(4));
				triVO.setTrienddate(rs.getDate(5));
				triVO.setTripeonum(rs.getInt(6));
				triVO.setTristat(rs.getInt(7));
				triVO.setTriremark(rs.getString(8));
			}
		} catch(SQLException se) {
			throw new RuntimeException(se.getMessage());
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
		return triVO;
	}
	
	@Override
	public List<TriVO> findByMemno(String memno) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<TriVO> list = new ArrayList<TriVO>();
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(FINDBYMEMNO_STMT);
			
			pstmt.setString(1, memno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				TriVO triVO = new TriVO();
				triVO.setTrino(rs.getString(1));
				triVO.setMemno(rs.getString(2));
				triVO.setTriname(rs.getString(3));
				triVO.setTribegdate(rs.getDate(4));
				triVO.setTrienddate(rs.getDate(5));
				triVO.setTripeonum(rs.getInt(6));
				triVO.setTristat(rs.getInt(7));
				triVO.setTriremark(rs.getString(8));
				list.add(triVO);
			}
			
		} catch(SQLException se) {
			throw new RuntimeException(se.getMessage());
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
		return list;
	}

	@Override
	public List<TriVO> getAll() {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<TriVO> list = new ArrayList<TriVO>();
		
		try {
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
		} catch(SQLException se) {
			throw new RuntimeException(se.getMessage());
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

	@Override
	public void insertWithTdes(TriVO trivo, List<TdeVO> tdeVOList) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			
			con.setAutoCommit(false);
			
			String[] cols = {"TRINO"};
			pstmt = con.prepareStatement(ADD_STMT, cols);
			
			pstmt.setString(1, trivo.getMemno());
			pstmt.setString(2, trivo.getTriname());
			pstmt.setDate(3, trivo.getTribegdate());
			pstmt.setDate(4, trivo.getTrienddate());
			pstmt.setInt(5, trivo.getTripeonum());
			pstmt.setInt(6, trivo.getTristat());
			pstmt.setString(7, trivo.getTriremark());
			
			System.out.println("test");
			pstmt.executeUpdate();
			
			String next_trino = null;
			ResultSet rs = pstmt.getGeneratedKeys();
			if(rs.next()) {
				next_trino = rs.getString(1);
			} else {
				System.out.println("取得自增主鍵值失敗!");
			}
			System.out.println("next_trino:" + next_trino);
			TdeDAO dao = new TdeDAO();
			for(int i = 0; i < tdeVOList.size(); i++) {
				TdeVO tdeVO = tdeVOList.get(i);
				tdeVO.setTrino(next_trino);
				dao.insert2(tdeVO, con);
			}
			
			con.commit();
			con.setAutoCommit(true);
			System.out.println("成功新增:" + tdeVOList.size() + "筆明細");
			
		} catch(SQLException se) {
			if(con != null) {
				try {
					con.rollback();
				} catch (SQLException e) {
					throw new RuntimeException("rollback error:" + e.getMessage());
				}
			}
			throw new RuntimeException("insert database error:" + se.getMessage());
			
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
}
