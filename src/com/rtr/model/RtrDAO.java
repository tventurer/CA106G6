package com.rtr.model;

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

public class RtrDAO implements RtrDAO_interface{
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TV");
		} catch (NamingException ne) {
			ne.printStackTrace();
		}
	}

	private static final String ADD_STMT = "INSERT INTO RECOMMENDTRIP (RTRNO, EMPNO, RTRCON, RTRCITY, RTRDAYS, RTRPEONUM, RTRPREF) VALUES ('RTR'||LPAD(TO_CHAR(RTR_SEQ.NEXTVAL),6,'0'), ?, ?, ?, ?, ?, ?)";
	private static final String UPDATE_STMT = "UPDATE RECOMMENDTRIP SET RTRCON=?, RTRCITY=?, RTRDAYS=?, RTRPEONUM=?, RTRPREF=? WHERE RTRNO=?";
	private static final String DELETE_STMT = "DELETE FROM RECOMMENDTRIP WHERE RTRNO=?";
	private static final String FINDBYPK_STMT = "SELECT * FROM RECOMMENDTRIP WHERE RTRNO=?";
	private static final String FINDBYCDT_STMT = "SELECT * FROM RECOMMENDTRIP WHERE RTRCON=? AND RTRCITY=? AND RTRDAYS=? AND RTRPREF=?";
	private static final String GETALL_STMT = "SELECT * FROM RECOMMENDTRIP";
	
	@Override
	public void add(RtrVO rtr) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(ADD_STMT);

			pstmt.setString(1, rtr.getEmpno());
			pstmt.setString(2, rtr.getRtrcon());
			pstmt.setString(3, rtr.getRtrcity());
			pstmt.setInt(4, rtr.getRtrdays());
			pstmt.setObject(5, rtr.getRtrpeonum());
			pstmt.setInt(6, rtr.getRtrpref());

			pstmt.executeUpdate();
			
		} catch (SQLException se) {
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
	public void update(RtrVO rtr) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STMT);

			pstmt.setString(1, rtr.getRtrcon());
			pstmt.setString(2, rtr.getRtrcity());
			pstmt.setInt(3, rtr.getRtrdays());
			pstmt.setObject(4, rtr.getRtrpeonum());
			pstmt.setInt(5, rtr.getRtrpref());
			pstmt.setString(6, rtr.getRtrno());

			pstmt.executeUpdate();
			
		} catch (SQLException se) {
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
	public void delete(String rtrno) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE_STMT);
			
			pstmt.setString(1, rtrno);
			
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
	public RtrVO findByPk(String rtrno) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		RtrVO rtr = new RtrVO();
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(FINDBYPK_STMT);
			
			pstmt.setString(1, rtrno);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			rtr.setRtrno(rs.getString(1));
			rtr.setEmpno(rs.getString(2));
			rtr.setRtrcon(rs.getString(3));
			rtr.setRtrcity(rs.getString(4));
			rtr.setRtrdays(rs.getInt(5));
			rtr.setRtrpeonum(rs.getInt(6));
			rtr.setRtrpref(rs.getInt(7));
			
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
		return rtr;
	}

	@Override
	public List<RtrVO> findByCdt(String rtrcon, String rtrcity, Integer rtrdays, Integer rtrpref) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<RtrVO> list = new ArrayList<RtrVO>();
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(FINDBYCDT_STMT);
			
			pstmt.setString(1, rtrcon);
			pstmt.setString(2, rtrcity);
			pstmt.setInt(3, rtrdays);
			pstmt.setInt(4, rtrpref);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				RtrVO rtr = new RtrVO();
				rtr.setRtrno(rs.getString(1));
				rtr.setEmpno(rs.getString(2));
				rtr.setRtrcon(rs.getString(3));
				rtr.setRtrcity(rs.getString(4));
				rtr.setRtrdays(rs.getInt(5));
				rtr.setRtrpeonum(rs.getInt(6));
				rtr.setRtrpref(rs.getInt(7));
				list.add(rtr);
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
	public List<RtrVO> getAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<RtrVO> list = new ArrayList<RtrVO>();
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GETALL_STMT);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				RtrVO rtr = new RtrVO();
				rtr.setRtrno(rs.getString(1));
				rtr.setEmpno(rs.getString(2));
				rtr.setRtrcon(rs.getString(3));
				rtr.setRtrcity(rs.getString(4));
				rtr.setRtrdays(rs.getInt(5));
				rtr.setRtrpeonum(rs.getInt(6));
				rtr.setRtrpref(rs.getInt(7));
				list.add(rtr);
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

}
