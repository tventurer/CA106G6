package com.rtd.model;

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

public class RtdDAO implements RtdDAO_interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TV");
		} catch (NamingException ne) {
			ne.printStackTrace();
		}
	}

	private static final String ADD_STMT = "INSERT INTO RECOMMENDTRIPDETAIL (RTDNO, RTRNO, SPONO, RTDSTART, RTDFINISH, RTDDAYS, RTDSEQ) VALUES ('RTD'||LPAD(TO_CHAR(RTD_SEQ.NEXTVAL),6,'0'), ?, ?, ?, ?, ?, ?)";
	private static final String UPDATE_STMT = "UPDATE RECOMMENDTRIPDETAIL SET SPONO=?, RTDSTART=?, RTDFINISH=?, RTDDAYS=?, RTDSEQ=? WHERE RTDNO=?";
	private static final String DELETE_STMT = "DELETE FROM RECOMMENDTRIPDETAIL WHERE RTDNO=?";
	private static final String FINDBYPK_STMT = "SELECT * FROM RECOMMENDTRIPDETAIL WHERE RTDNO=?";
	private static final String FINDBYRTR_STMT = "SELECT * FROM RECOMMENDTRIPDETAIL WHERE RTRNO=?";
	private static final String GETALL_STMT = "SELECT * FROM RECOMMENDTRIPDETAIL";

	@Override
	public void add(RtdVO rtd) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(ADD_STMT);

			pstmt.setString(1, rtd.getRtrno());
			pstmt.setString(2, rtd.getSpono());
			pstmt.setTimestamp(3, rtd.getRtdstart());
			pstmt.setTimestamp(4, rtd.getRtdfinish());
			pstmt.setString(5, rtd.getRtddays());
			pstmt.setInt(6, rtd.getRtdseq());

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
	public void update(RtdVO rtd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			pstmt.setString(1, rtd.getSpono());
			pstmt.setTimestamp(2, rtd.getRtdstart());
			pstmt.setTimestamp(3, rtd.getRtdfinish());
			pstmt.setString(4, rtd.getRtddays());
			pstmt.setInt(5, rtd.getRtdseq());
			pstmt.setString(6, rtd.getRtdno());
			
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
	public void delete(String rtdno) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE_STMT);
			
			pstmt.setString(1, rtdno);
			
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
	public RtdVO findByPk(String rtdno) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		RtdVO rtd = new RtdVO();
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(FINDBYPK_STMT);
			
			pstmt.setString(1, rtdno);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			rtd.setRtdno(rs.getString(1));
			rtd.setRtrno(rs.getString(2));
			rtd.setSpono(rs.getString(3));
			rtd.setRtdstart(rs.getTimestamp(4));
			rtd.setRtdfinish(rs.getTimestamp(5));
			rtd.setRtddays(rs.getString(6));
			rtd.setRtdseq(rs.getInt(7));
			
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
		return rtd;
	}

	@Override
	public List<RtdVO> findByRtr(String rtrno) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<RtdVO> list = new ArrayList<RtdVO>();
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(FINDBYRTR_STMT);
			
			pstmt.setString(1, rtrno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				RtdVO rtd = new RtdVO();
				rtd.setRtdno(rs.getString(1));
				rtd.setRtrno(rs.getString(2));
				rtd.setSpono(rs.getString(3));
				rtd.setRtdstart(rs.getTimestamp(4));
				rtd.setRtdfinish(rs.getTimestamp(5));
				rtd.setRtddays(rs.getString(6));
				rtd.setRtdseq(rs.getInt(7));
				list.add(rtd);
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
	public List<RtdVO> getAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<RtdVO> list = new ArrayList<RtdVO>();
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GETALL_STMT);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				RtdVO rtd = new RtdVO();
				rtd.setRtdno(rs.getString(1));
				rtd.setRtrno(rs.getString(2));
				rtd.setSpono(rs.getString(3));
				rtd.setRtdstart(rs.getTimestamp(4));
				rtd.setRtdfinish(rs.getTimestamp(5));
				rtd.setRtddays(rs.getString(6));
				rtd.setRtdseq(rs.getInt(7));
				list.add(rtd);
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
