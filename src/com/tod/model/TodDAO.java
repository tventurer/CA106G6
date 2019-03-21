package com.tod.model;

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

public class TodDAO implements TodDAO_interface{
	
	private static DataSource ds = null;
	static {
		try{
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/TV");
		} catch(NamingException ne) {
			ne.printStackTrace();
		}
	}
	
	private static final String ADD_STMT = "INSERT INTO TRIPORDER (TODNO, MEMNO, TRINO, EMPNO, TODQUO, TODDDL, TODDATE, TODREMARK, TODSTAT) VALUES ('TOD'||LPAD(TO_CHAR(TOD_SEQ.NEXTVAL), 6, '0'), ?, ?, ?, ?, ?, SYSDATE, ?, ?)";
	private static final String UPDATE_STMT = "UPDATE TRIPORDER SET EMPNO=?, TODQUO=?, TODDDL=?, TODREMARK=?, TODSTAT=? WHERE TODNO=?";
	private static final String DELETE_STMT = "DELETE FROM TRIPORDER WHERE TODNO=?";
	private static final String FINDBYPK_STMT = "SELECT * FROM TRIPORDER WHERE TODNO=?";
	private static final String FINDBYTRINO_STMT = "SELECT * FROM TRIPORDER WHERE TRINO=?";
	private static final String GETALL_STMT = "SELECT * FROM TRIPORDER";
	
	//購買用sql指令
	private static final String TODBUY_STMT = "UPDATE TRIPORDER SET TODOWNER=?, TODPHONE=?, TODMAIL=?, TODPURCHASE=? WHERE TODNO=?";
	private static final String FINDBYTODSTAT_STMT = "SELECT * FROM TRIPORDER WHERE TODSTAT=?";
	private static final String FINDPURCONTENT_STMT = "SELECT * FROM TRIPORDER WHERE TODNO=?";
	
	@Override
	public void add(TodVO tod) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(ADD_STMT);
			
			pstmt.setString(1, tod.getMemno());
			pstmt.setString(2, tod.getTrino());
			pstmt.setString(3, tod.getEmpno());
			pstmt.setInt(4, tod.getTodquo());
			pstmt.setDate(5, tod.getTodddl());
			pstmt.setString(6, tod.getTodremark());
			pstmt.setInt(7, tod.getTodstat());
			
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
	public void update(TodVO tod) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			pstmt.setString(1, tod.getEmpno());
			pstmt.setInt(2, tod.getTodquo());
			pstmt.setDate(3, tod.getTodddl());
			pstmt.setString(4, tod.getTodremark());
			pstmt.setInt(5, tod.getTodstat());
			pstmt.setString(6, tod.getTodno());
			
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
	public void delete(String todno) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE_STMT);
			
			pstmt.setString(1, todno);
			
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
	public TodVO findByPk(String todno) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		TodVO tod = new TodVO();
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(FINDBYPK_STMT);
			
			pstmt.setString(1, todno);
			
			rs = pstmt.executeQuery();

			rs.next();
			tod.setTodno(rs.getString(1));
			tod.setMemno(rs.getString(2));
			tod.setTrino(rs.getString(3));
			tod.setEmpno(rs.getString(4));
			tod.setTodquo(rs.getInt(5));
			tod.setTodddl(rs.getDate(6));
			tod.setToddate(rs.getDate(7));
			tod.setTodremark(rs.getString(8));
			tod.setTodstat(rs.getInt(9));
			
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
		return tod;
	}
	
	@Override
	public TodVO findByTrino(String trino) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		TodVO todVO = new TodVO();
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(FINDBYTRINO_STMT);
			
			pstmt.setString(1, trino);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				todVO.setTodno(rs.getString(1));
				todVO.setMemno(rs.getString(2));
				todVO.setTrino(rs.getString(3));
				todVO.setEmpno(rs.getString(4));
				todVO.setTodquo(rs.getInt(5));
				todVO.setTodddl(rs.getDate(6));
				todVO.setToddate(rs.getDate(7));
				todVO.setTodremark(rs.getString(8));
				todVO.setTodstat(rs.getInt(9));
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
		
		return todVO;
	}
	
	@Override
	public List<TodVO> findByTodstat(int todstat) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<TodVO> list = new ArrayList<TodVO>();
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(FINDBYTODSTAT_STMT);
			
			pstmt.setInt(1, todstat);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				TodVO todVO = new TodVO();
				todVO.setTodno(rs.getString(1));
				todVO.setMemno(rs.getString(2));
				todVO.setTrino(rs.getString(3));
				todVO.setEmpno(rs.getString(4));
				todVO.setTodquo(rs.getInt(5));
				todVO.setTodddl(rs.getDate(6));
				todVO.setToddate(rs.getDate(7));
				todVO.setTodremark(rs.getString(8));
				todVO.setTodstat(rs.getInt(9));
				todVO.setTodowner(rs.getString(10));
				todVO.setTodphone(rs.getString(11));
				todVO.setTodmail(rs.getString(12));
				todVO.setTodpurchase(rs.getString(13));
				list.add(todVO);
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
	public List<TodVO> getAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<TodVO> list = new ArrayList<TodVO>();
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GETALL_STMT);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				TodVO tod = new TodVO();
				tod.setTodno(rs.getString(1));
				tod.setMemno(rs.getString(2));
				tod.setTrino(rs.getString(3));
				tod.setEmpno(rs.getString(4));
				tod.setTodquo(rs.getInt(5));
				tod.setTodddl(rs.getDate(6));
				tod.setToddate(rs.getDate(7));
				tod.setTodremark(rs.getString(8));
				tod.setTodstat(rs.getInt(9));
				list.add(tod);
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
	public void todBuy(TodVO tod) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(TODBUY_STMT);
			
			pstmt.setString(1, tod.getTodowner());
			pstmt.setString(2, tod.getTodphone());
			pstmt.setString(3, tod.getTodmail());
			pstmt.setString(4, tod.getTodpurchase());
			pstmt.setString(5, tod.getTodno());
			
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
	public TodVO findPurContent(String todno) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		TodVO todVO = new TodVO();
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(FINDPURCONTENT_STMT);
			
			pstmt.setString(1, todno);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				todVO.setTodowner(rs.getString(10));
				todVO.setTodphone(rs.getString(11));
				todVO.setTodmail(rs.getString(12));
				todVO.setTodpurchase(rs.getString(13));
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
		
		return todVO;
	}

}
