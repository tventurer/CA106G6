package com.tde.model;

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

public class TdeDAO implements TdeDAO_interface{
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TV");
		} catch (NamingException ne) {
			ne.printStackTrace();
		}
	}

	private static final String ADD_STMT = "INSERT INTO TRIPDETAIL (TDENO, TRINO, SPONO, TDESTART, TDEFINISH, TDEDATE, TDESEQ, TDEREMARK) VALUES ('TDE'||LPAD(TO_CHAR(TDE_SEQ.NEXTVAL),6,'0'), ?, ?, ?, ?, ?, ?, ?)";
	private static final String UPDATE_STMT = "UPDATE TRIPDETAIL SET SPONO=?, TDESTART=?, TDEFINISH=?, TDEDATE=?, TDESEQ=?, TDEREMARK=? WHERE TDENO=?";
	private static final String DELETE_STMT = "DELETE FROM TRIPDETAIL WHERE TDENO=?";
	private static final String FINDBYPK_STMT = "SELECT * FROM TRIPDETAIL WHERE TDENO=?";
	private static final String FINDBYTRI_STMT = "SELECT * FROM TRIPDETAIL WHERE TRINO=?";
	private static final String GETALL_STMT = "SELECT * FROM TRIPDETAIL";

	@Override
	public void add(TdeVO tde) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(ADD_STMT);
			System.out.println("tdetest");
			pstmt.setString(1, tde.getTrino());
			pstmt.setString(2, tde.getSpono());
			pstmt.setTimestamp(3, tde.getTdestart());
			pstmt.setTimestamp(4, tde.getTdefinish());
			pstmt.setString(5, tde.getTdedate());
			pstmt.setInt(6, tde.getTdeseq());
			pstmt.setString(7, tde.getTderemark());
			System.out.println("tdetest2");
			pstmt.executeUpdate();
			
		} catch (SQLException se) {
//			throw new RuntimeException(se.getMessage());
			se.printStackTrace();
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
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
		}
		
	}

	@Override
	public void update(TdeVO tde) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			pstmt.setString(1, tde.getSpono());
			pstmt.setTimestamp(2, tde.getTdestart());
			pstmt.setTimestamp(3, tde.getTdefinish());
			pstmt.setString(4, tde.getTdedate());
			pstmt.setInt(5, tde.getTdeseq());
			pstmt.setString(6, tde.getTderemark());
			pstmt.setString(7, tde.getTdeno());
			
			pstmt.executeUpdate();
			
		} catch(SQLException se) {
			se.printStackTrace();
			throw new RuntimeException(se.getMessage());
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
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
		}
		
	}

	@Override
	public void delete(String tdeno) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE_STMT);
			
			pstmt.setString(1, tdeno);
			
			pstmt.executeUpdate();
			
		} catch(SQLException se) {
			throw new RuntimeException(se.getMessage());
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
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
		}
		
	}

	@Override
	public TdeVO findByPk(String tdeno) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		TdeVO tde = new TdeVO();
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(FINDBYPK_STMT);
			
			pstmt.setString(1, tdeno);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			tde.setTdeno(rs.getString(1));
			tde.setTrino(rs.getString(2));
			tde.setSpono(rs.getString(3));
			tde.setTdestart(rs.getTimestamp(4));
			tde.setTdefinish(rs.getTimestamp(5));
			tde.setTdedate(rs.getString(6));
			tde.setTdeseq(rs.getInt(7));
			tde.setTderemark(rs.getString(8));
			
		} catch(SQLException se) {
			se.printStackTrace();
			throw new RuntimeException(se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
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
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
		}
		return tde;
	}

	@Override
	public List<TdeVO> findByTri(String trino) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<TdeVO> list = new ArrayList<TdeVO>();
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(FINDBYTRI_STMT);
			
			pstmt.setString(1, trino);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				TdeVO tde = new TdeVO();
				tde.setTdeno(rs.getString(1));
				tde.setTrino(rs.getString(2));
				tde.setSpono(rs.getString(3));
				tde.setTdestart(rs.getTimestamp(4));
				tde.setTdefinish(rs.getTimestamp(5));
				tde.setTdedate(rs.getString(6));
				tde.setTdeseq(rs.getInt(7));
				tde.setTderemark(rs.getString(8));
				list.add(tde);
			}
			
		} catch(SQLException se) {
			throw new RuntimeException(se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
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
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
		}
		return list;
	}

	@Override
	public List<TdeVO> getAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<TdeVO> list = new ArrayList<TdeVO>();
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GETALL_STMT);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				TdeVO tde = new TdeVO();
				tde.setTdeno(rs.getString(1));
				tde.setTrino(rs.getString(2));
				tde.setSpono(rs.getString(3));
				tde.setTdestart(rs.getTimestamp(4));
				tde.setTdefinish(rs.getTimestamp(5));
				tde.setTdedate(rs.getString(6));
				tde.setTdeseq(rs.getInt(7));
				tde.setTderemark(rs.getString(8));
				list.add(tde);
			}
			
		} catch(SQLException se) {
			throw new RuntimeException(se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
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
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
		}
		return list;
	}

	@Override
	public void insert2(TdeVO tde, Connection con) {
		
		PreparedStatement pstmt = null;
		
		try {
			pstmt = con.prepareStatement(ADD_STMT);
			
			pstmt.setString(1, tde.getTrino());
			pstmt.setString(2, tde.getSpono());
			pstmt.setTimestamp(3, tde.getTdestart());
			pstmt.setTimestamp(4, tde.getTdefinish());
			pstmt.setString(5, tde.getTdedate());
			pstmt.setInt(6, tde.getTdeseq());
			pstmt.setString(7, tde.getTderemark());
			
			pstmt.executeUpdate();
			
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
		}
	}

}
