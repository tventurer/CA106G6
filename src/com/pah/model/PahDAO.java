package com.pah.model;

import java.util.List;
import java.util.Map;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.Date;

import javax.sql.DataSource;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.naming.Context;




public class PahDAO implements PahDAO_interface{
	
	private static DataSource ds = null;
	
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TV");
		}catch(NamingException ne) {
			ne.printStackTrace();
		}
	}

	private final static String INSERT_STMT = 
		"INSERT INTO PLANEHOTEL (PAHNO,PAHNAME,PAHINTRO,PAHCONTENT,PAHPRICE,PAHCOUNTRY,PAHNUM,PAHSTDATE,PAHENDDATE,PAHDOWN,PAHSTATUS,PAHPC1,PAHPC2,PAHPC3,PAHPC4,PAHPC5,EMPNO) VALUES ('PAH'||LPAD(TO_CHAR(PH_SEQ.NEXTVAL),6,'0'),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	private final static String UPDATE_STMT = 
		"UPDATE PLANEHOTEL SET PAHNAME=?,PAHINTRO=?,PAHCONTENT=?,PAHPRICE=?,PAHCOUNTRY=?,PAHNUM=?,PAHSTDATE=?,PAHENDDATE=?,PAHDOWN=?,PAHSTATUS=?,PAHPC1=?,PAHPC2=?,PAHPC3=?,PAHPC4=?,PAHPC5=?,EMPNO=? WHERE PAHNO=?";
	private final static String GET_ALL =
		"SELECT PAHNO,PAHNAME,PAHINTRO,PAHCONTENT,PAHPRICE,PAHCOUNTRY,PAHNUM,to_char(PAHSTDATE,'yyyy-mm-dd') PAHSTDATE,to_char(PAHENDDATE,'yyyy-mm-dd') PAHENDDATE,to_char(PAHDOWN,'yyyy-mm-dd HH:MM:SS') PAHDOWN,PAHSTATUS,PAHPC1,PAHPC2,PAHPC3,PAHPC4,PAHPC5,EMPNO FROM PLANEHOTEL ORDER BY PAHNO";
	private final static String GET_ONE_PK = 
		"SELECT PAHNO,PAHNAME,PAHINTRO,PAHCONTENT,PAHPRICE,PAHCOUNTRY,PAHNUM,to_char(PAHSTDATE,'yyyy-mm-dd') PAHSTDATE,to_char(PAHENDDATE,'yyyy-mm-dd') PAHENDDATE,to_char(PAHDOWN,'yyyy-mm-dd HH:MM:SS') PAHDOWN,PAHSTATUS,PAHPC1,PAHPC2,PAHPC3,PAHPC4,PAHPC5,EMPNO FROM PLANEHOTEL WHERE PAHNO = ?";
	private final static String DELETE =
		"DELETE FROM PLANEHOTEL WHERE PAHNO = ?";
	private final static String FIND_ONLY_COUNTRY =
		"SELECT DISTINCT PAHCOUNTRY FROM PLANEHOTEL WHERE PAHSTATUS=0 AND PAHNUM>0";
	private final static String SELL = 
		"UPDATE PLANEHOTEL SET PAHNUM=? WHERE PAHNO=?";
	private final static String CHANGESTATUS = 
		"UPDATE PLANEHOTEL SET PAHSTATUS=? WHERE PAHNO=?";
	private final static String DECREASENUM = 
		"UPDATE PLANEHOTEL SET PAHSTATUS=?,PAHNUM=? WHERE PAHNO=?";
	
	
	@Override
	public void insert(PahVO Pahvo) {
		
		Connection con = null;
		PreparedStatement ptst = null;
		
		try {
			con = ds.getConnection();
			ptst = con.prepareStatement(INSERT_STMT);
			
			ptst.setString(1, Pahvo.getPahname());
			ptst.setString(2, Pahvo.getPahintro());
			ptst.setString(3, Pahvo.getPahcontent());
			ptst.setInt(4, Pahvo.getPahprice());
			ptst.setString(5, Pahvo.getPahcountry());
			ptst.setInt(6, Pahvo.getPahnum());
			ptst.setDate(7, Pahvo.getPahstdate());
			ptst.setDate(8, Pahvo.getPahenddate());
			ptst.setTimestamp(9, Pahvo.getPahdown());
			ptst.setInt(10, Pahvo.getPahstatus());
			ptst.setBytes(11, Pahvo.getPahpc1());
			ptst.setBytes(12, Pahvo.getPahpc2());
			ptst.setBytes(13, Pahvo.getPahpc3());
			ptst.setBytes(14, Pahvo.getPahpc4());
			ptst.setBytes(15, Pahvo.getPahpc5());
			ptst.setString(16, Pahvo.getEmpno());
			
			ptst.executeUpdate();
			
		}catch(SQLException e) {
			throw new RuntimeException("A database error occured. "
					+ e.getMessage());
		}finally {
			
			if(ptst != null) {
				try {
					con.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
			
		}	
	}
	
	@Override
	public void update(PahVO ItemVO) {
		
		Connection con = null;
		PreparedStatement ptst = null;
		
		try {
			
			con = ds.getConnection();
			ptst = con.prepareStatement(UPDATE_STMT);
			
			ptst.setString(1, ItemVO.getPahname());
			ptst.setString(2, ItemVO.getPahintro());
			ptst.setString(3, ItemVO.getPahcontent());
			ptst.setInt(4, ItemVO.getPahprice());
			ptst.setString(5, ItemVO.getPahcountry());
			ptst.setInt(6, ItemVO.getPahnum());
			ptst.setDate(7, ItemVO.getPahstdate());
			ptst.setDate(8, ItemVO.getPahenddate());
			ptst.setTimestamp(9, ItemVO.getPahdown());
			ptst.setInt(10, ItemVO.getPahstatus());
			ptst.setBytes(11, ItemVO.getPahpc1());
			ptst.setBytes(12, ItemVO.getPahpc2());
			ptst.setBytes(13, ItemVO.getPahpc3());
			ptst.setBytes(14, ItemVO.getPahpc4());
			ptst.setBytes(15, ItemVO.getPahpc5());
			ptst.setString(16, ItemVO.getEmpno());
			ptst.setString(17, ItemVO.getPahno());
			
			ptst.executeUpdate();
			
		}catch(SQLException e) {
			throw new RuntimeException("A database error occured. "
					+ e.getMessage());
		}finally {
			
			if(ptst != null) {
				try {
					con.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
			
		}
	}
	
	@Override
	public void delete(String PAHNO) {
		
		Connection con = null;
		PreparedStatement ptst = null;
		
		try {
			
			con = ds.getConnection();
			ptst = con.prepareStatement(DELETE);
			ptst.setString(1, PAHNO);
			ptst.executeUpdate();	
			
		}catch(SQLException e) {
			throw new RuntimeException("A database error occured. "
					+ e.getMessage());
		}finally {
			if(ptst != null) {
				try {
					ptst.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public List<PahVO> getall() {
		
		List<PahVO> list = new ArrayList<PahVO>();
		PahVO pahvo = null;
		Connection con = null;
		PreparedStatement ptst = null;
		ResultSet rs = null;
		
		try {
			
			con = ds.getConnection();
			ptst = con.prepareStatement(GET_ALL);
			rs = ptst.executeQuery();
			
			while(rs.next()) {
				
				pahvo = new PahVO();
				pahvo.setPahno(rs.getString("PAHNO"));
				pahvo.setPahname(rs.getString("PAHNAME"));
				pahvo.setPahintro(rs.getString("PAHINTRO"));
				pahvo.setPahcontent(rs.getString("PAHCONTENT"));
				pahvo.setPahprice(rs.getInt("PAHPRICE"));
				pahvo.setPahcountry(rs.getString("PAHCOUNTRY"));
				pahvo.setPahnum(rs.getInt("PAHNUM"));
				pahvo.setPahstdate(rs.getDate("PAHSTDATE"));
				pahvo.setPahenddate(rs.getDate("PAHENDDATE"));
				pahvo.setPahdown(rs.getTimestamp("PAHDOWN"));
				pahvo.setPahstatus(rs.getInt("PAHSTATUS"));
				pahvo.setPahpc1(rs.getBytes("PAHPC1"));
				pahvo.setPahpc2(rs.getBytes("PAHPC2"));
				pahvo.setPahpc3(rs.getBytes("PAHPC3"));
				pahvo.setPahpc4(rs.getBytes("PAHPC4"));
				pahvo.setPahpc5(rs.getBytes("PAHPC5"));
				pahvo.setEmpno(rs.getString("EMPNO"));
				list.add(pahvo);		
			}
			
		}catch(SQLException e) {
			throw new RuntimeException("A database error occured. "
					+ e.getMessage());
		}finally {
			if(rs != null) {
				try {
					rs.close();	
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
			if(ptst != null) {
				try {
					ptst.close();	
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();	
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return list;
	}

	@Override
	public PahVO findOneByPk(String pahno) {
		PahVO pahvo = null;
		Connection con = null;
		PreparedStatement ptst = null;
		ResultSet rs = null;
		
		try {
			
			con = ds.getConnection();
			ptst = con.prepareStatement(GET_ONE_PK);
			ptst.setString(1, pahno);
			rs = ptst.executeQuery();
			
			while(rs.next()) {
				
				pahvo = new PahVO();
				pahvo.setPahno(rs.getString("PAHNO"));
				pahvo.setPahname(rs.getString("PAHNAME"));
				pahvo.setPahintro(rs.getString("PAHINTRO"));
				pahvo.setPahcontent(rs.getString("PAHCONTENT"));
				pahvo.setPahprice(rs.getInt("PAHPRICE"));
				pahvo.setPahcountry(rs.getString("PAHCOUNTRY"));
				pahvo.setPahnum(rs.getInt("PAHNUM"));
				pahvo.setPahstdate(rs.getDate("PAHSTDATE"));
				pahvo.setPahenddate(rs.getDate("PAHENDDATE"));
				pahvo.setPahdown(rs.getTimestamp("PAHDOWN"));
				pahvo.setPahstatus(rs.getInt("PAHSTATUS"));
				pahvo.setPahpc1(rs.getBytes("PAHPC1"));
				pahvo.setPahpc2(rs.getBytes("PAHPC2"));
				pahvo.setPahpc3(rs.getBytes("PAHPC3"));
				pahvo.setPahpc4(rs.getBytes("PAHPC4"));
				pahvo.setPahpc5(rs.getBytes("PAHPC5"));
				pahvo.setEmpno(rs.getString("EMPNO"));
			}
			
		}catch(SQLException e) {
			throw new RuntimeException("A database error occured. "
					+ e.getMessage());
		}finally {
			if(rs != null) {
				try {
					rs.close();	
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
			if(ptst != null) {
				try {
					ptst.close();	
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();	
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return pahvo;
	}

	@Override
	public List<String> getCountry() {
		Connection con = null;
		PreparedStatement ptst = null;
		ResultSet rs = null;
		List<String> list = new ArrayList<String>();
	try {
			
		con = ds.getConnection();
		ptst = con.prepareStatement(FIND_ONLY_COUNTRY);
		rs = ptst.executeQuery();
		
			while(rs.next()) {
				list.add(rs.getString("PAHCOUNTRY"));
			}
			
		}catch(SQLException e) {
			throw new RuntimeException("A database error occured. "
					+ e.getMessage());
		}finally {
			if(rs != null) {
				try {
					rs.close();	
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
			if(ptst != null) {
				try {
					ptst.close();	
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();	
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return list;
	}
	
	
	
	@Override
	public List<PahVO> getSelectAll(Map<String, String[]> map) {
		List<PahVO> list = new ArrayList<PahVO>();
		PahVO pahvo = null;
	
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			String finalSQL = "SELECT PAHNO,PAHNAME,PAHINTRO,PAHCONTENT,PAHPRICE,PAHCOUNTRY,PAHNUM,to_char(PAHSTDATE,'yyyy-mm-dd') PAHSTDATE,to_char(PAHENDDATE,'yyyy-mm-dd') PAHENDDATE,to_char(PAHDOWN,'yyyy-mm-dd HH:MM:SS') PAHDOWN,PAHSTATUS,PAHPC1,PAHPC2,PAHPC3,PAHPC4,PAHPC5,EMPNO FROM PLANEHOTEL WHERE PAHSTATUS=0 AND PAHNUM>0"
		          + makeSQL.get_WhereCondition(map)
		          + " order by pahno";
			pstmt = con.prepareStatement(finalSQL);
			rs = pstmt.executeQuery();
			
			
			while (rs.next()) {
				pahvo = new PahVO();
				pahvo.setPahno(rs.getString("PAHNO"));
				pahvo.setPahname(rs.getString("PAHNAME"));
				pahvo.setPahintro(rs.getString("PAHINTRO"));
				pahvo.setPahcontent(rs.getString("PAHCONTENT"));
				pahvo.setPahprice(rs.getInt("PAHPRICE"));
				pahvo.setPahcountry(rs.getString("PAHCOUNTRY"));
				pahvo.setPahnum(rs.getInt("PAHNUM"));
				pahvo.setPahstdate(rs.getDate("PAHSTDATE"));
				pahvo.setPahenddate(rs.getDate("PAHENDDATE"));
				pahvo.setPahdown(rs.getTimestamp("PAHDOWN"));
				pahvo.setPahstatus(rs.getInt("PAHSTATUS"));
				pahvo.setPahpc1(rs.getBytes("PAHPC1"));
				pahvo.setPahpc2(rs.getBytes("PAHPC2"));
				pahvo.setPahpc3(rs.getBytes("PAHPC3"));
				pahvo.setPahpc4(rs.getBytes("PAHPC4"));
				pahvo.setPahpc5(rs.getBytes("PAHPC5"));
				pahvo.setEmpno(rs.getString("EMPNO"));
				list.add(pahvo); 
			}
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
	public void sellPah(Integer sellNum, String pahno) {
		Connection con = null;
		PreparedStatement ptst = null;
		
		try {
			
			con = ds.getConnection();
			ptst = con.prepareStatement(SELL);
			
			ptst.setInt(1, sellNum);
			ptst.setString(2, pahno);
			
			ptst.executeUpdate();
			
		}catch(SQLException e) {
			throw new RuntimeException("A database error occured. "
					+ e.getMessage());
		}finally {
			
			if(ptst != null) {
				try {
					con.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
			
		}
	}
	
	@Override
	public void updateStatus(Integer pahstatus, String pahno) {
		Connection con = null;
		PreparedStatement ptst = null;
		
		try {
			
			con = ds.getConnection();
			ptst = con.prepareStatement(CHANGESTATUS);
			
			ptst.setInt(1, pahstatus);
			ptst.setString(2, pahno);
			
			ptst.executeUpdate();
			
		}catch(SQLException e) {
			throw new RuntimeException("A database error occured. "
					+ e.getMessage());
		}finally {
			
			if(ptst != null) {
				try {
					con.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
			
		}
	}

	@Override
	public void decrease(String Pahno, Integer Pahnum, Integer Pahstatus, Connection con) {
		PreparedStatement ptst = null;
		
		try {
			
			ptst = con.prepareStatement(DECREASENUM);
			ptst.setInt(1, Pahstatus);
			ptst.setInt(2, Pahnum);
			ptst.setString(3, Pahno);
			ptst.executeUpdate();
			
		}catch(SQLException se) {
			if(con!=null) {
				try {
					con.rollback();
				}catch(Exception e) {
					e.printStackTrace();
				}		
			}
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}finally {
			
			if(ptst != null) {
				try {
					ptst.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
			
		}
	}
	
	
	
}
