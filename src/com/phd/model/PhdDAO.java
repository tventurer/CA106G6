package com.phd.model;

import javax.sql.DataSource;

import android.com.pah.model.PahAnDAO;
import android.com.pah.model.PahAnVO;

import javax.naming.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PhdDAO implements PhdDAO_interface{
	
	private static DataSource ds = null;
	
	static {
		try {
			Context ctx = new javax.naming.InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TV"); 
		}catch(NamingException ne) {
			ne.printStackTrace();
		}		
	}
	
	private final static String INSERT = 
		"INSERT INTO PLANEHOTELDETAIL(PAHNO, PHONO, PHDNUM) VALUES (?,?,?)";
	private final static String DELETE = 
		"DELETE FROM PLANEHOTELDETAIL WHERE PAHNO=? AND PHONO=?";
	private final static String GET_ONE_PAHNO =
		"SELECT * FROM PLANEHOTELDETAIL WHERE PAHNO=?";
	private final static String GET_ONE_PHONO =
		"SELECT * FROM PLANEHOTELDETAIL WHERE PHONO=?";
	private final static String GET_ALL =
		"SELECT * FROM PLANEHOTELDETAIL";
	
	@Override
	public void insert(PhdVO phdvo, Connection con) {
		PreparedStatement ptst = null;
		
		try {
			
			ptst = con.prepareStatement(INSERT);
			ptst.setString(1, phdvo.getPahno());
			ptst.setString(2, phdvo.getPhono());
			ptst.setInt(3, phdvo.getPhdnum());
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

	@Override
	public void delete(PhdVO phdvo) {
		Connection con = null;
		PreparedStatement ptst = null;
		
		try {
			
			con = ds.getConnection();
			ptst = con.prepareStatement(DELETE);
			ptst.setString(1, phdvo.getPahno());
			ptst.setString(2, phdvo.getPhono());
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
	public List<PhdVO> findByPAHNO(String pahno) {
		Connection con = null;
		PreparedStatement ptst = null;
		ResultSet rs = null;
		List<PhdVO> list = new ArrayList<PhdVO>();
		
		try {
			con = ds.getConnection();
			ptst = con.prepareStatement(GET_ONE_PAHNO);
			ptst.setString(1, pahno);
			rs = ptst.executeQuery();
			
			while(rs.next()) {
				PhdVO phdvo = new PhdVO();
				phdvo.setPahno(rs.getString("PAHNO"));
				phdvo.setPhono(rs.getString("PHONO"));
				phdvo.setPhdnum(rs.getInt("PHDNUM"));
				list.add(phdvo);
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
	public List<PhdVO> findByPHONO(String phono) {
		Connection con = null;
		PreparedStatement ptst = null;
		ResultSet rs = null;
		List<PhdVO> list = new ArrayList<PhdVO>();
		
		try {
			con = ds.getConnection();
			ptst = con.prepareStatement(GET_ONE_PHONO);
			ptst.setString(1, phono);
			rs = ptst.executeQuery();
			
			while(rs.next()) {
				PhdVO phdvo = new PhdVO();
				phdvo.setPahno(rs.getString("PAHNO"));
				phdvo.setPhono(rs.getString("PHONO"));
				phdvo.setPhdnum(rs.getInt("PHDNUM"));
				list.add(phdvo);
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
	public List<PhdVO> getall() {
		Connection con = null;
		PreparedStatement ptst = null;
		ResultSet rs = null;
		List<PhdVO> list = new ArrayList<PhdVO>();
		
		try {
			con = ds.getConnection();
			ptst = con.prepareStatement(GET_ALL);
			rs = ptst.executeQuery();
			
			while(rs.next()) {
				PhdVO phdvo = new PhdVO();
				phdvo.setPahno(rs.getString("PAHNO"));
				phdvo.setPhono(rs.getString("PHONO"));
				phdvo.setPhdnum(rs.getInt("PHDNUM"));
				list.add(phdvo);
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


	//**********android專用
	private final static String INSERT_AN = "INSERT INTO PLANEHOTELDETAIL(PAHNO, PHONO, PHDNUM) VALUES (?,?,?)";
	
	//**********android專用
	public void insertAn(PhdVO phdvo, Connection con) {
		PreparedStatement pstmt = null;
		
		try {
			//新增訂單明細
			pstmt = con.prepareStatement(INSERT_AN);
			pstmt.setString(1, phdvo.getPahno());
			pstmt.setString(2, phdvo.getPhono());
			pstmt.setInt(3, phdvo.getPhdnum());
			pstmt.executeUpdate();
			
			//修改旅遊商品數量
			String pahno = phdvo.getPahno();
			Integer phdnum = phdvo.getPhdnum();
			
			PahAnDAO pahAnDAO = new PahAnDAO();
			PahAnVO pahAnVO = pahAnDAO.findOneByPk(pahno); //找出商品好取出商品庫存量
			Integer pahnum = pahAnVO.getPahnum() - phdnum; //將商品庫存量減去明細商品數量得到目前庫存量
			Integer pahstatus = 0; //預設商品狀態是上架
			if(pahnum <= 0) { //庫存量小於0，修改商品為下架
				pahstatus = 1;
			}
			pahAnDAO.updatePahNum(pahno, pahnum, pahstatus, con); //使用專提供給android方法
			
		}catch(SQLException se) {
			if(con!=null) {
				try {
					con.rollback();
				}catch(SQLException sqle) {
					throw new RuntimeException("A database error occured. " + sqle.getMessage());
				}		
			}
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
			
		}
	}
	
}
