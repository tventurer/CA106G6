package com.pho.model;

import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.pah.model.*;
import com.phd.model.*;

public class PhoDAO implements PhoDAO_interface{
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TV");
		}catch(NamingException ne) {
			ne.printStackTrace();
		}
	}
	
	private static final String INSERT_STMT =
		"INSERT INTO PLANEHOTELORDER (PHONO, PHOOWNER, PHOPHONE, PHOMAIL, PHOSTDATE, PHOSTATUS, PHOMARK, PHOVISA, PHOTOTAL, MEMNO) VALUES ('PHO'||LPAD(TO_CHAR(PHO_SEQ.NEXTVAL),6,'0'),?,?,?,sysdate,0,'',?,?,?)";
	private static final String UPDATE = 
		"UPDATE PLANEHOTELORDER SET PHOOWNER=?, PHOPHONE=?, PHOMAIL=?, PHOSTDATE=?, PHOSTATUS=?, PHOMARK=?, PHOVISA=?, PHOTOTAL=?, MEMNO=? WHERE PHONO=?";
	private static final String DELETE = 
		"DELETE FROM PLANEHOTELORDER WHERE PHONO = ?";
	private static final String GET_ONE_STMT = 
		"SELECT * FROM PLANEHOTELORDER WHERE PHONO=?";
	private static final String GET_ALL_STMT = 
		"SELECT * FROM PLANEHOTELORDER ORDER BY PHONO";
	private static final String GET_ME =
		"SELECT * FROM PLANEHOTELORDER WHERE MEMNO = ?";
	private final static String CHANGESTATUS = 
		"UPDATE PLANEHOTELORDER SET PHOSTATUS=?, PHOMARK=? WHERE PHONO=?";

	@Override
	public void insertWithDetail(PhoVO Phovo, List<PhdVO> phdList) {
		Connection con = null;
		PreparedStatement ptst = null;
		
		
		try {
			
			con = ds.getConnection();
			con.setAutoCommit(false);
			String cols[] = {"phono"};
			ptst = con.prepareStatement(INSERT_STMT, cols);
			
			//新增訂單
			ptst.setString(1, Phovo.getPhoowner());
			ptst.setString(2, Phovo.getPhophone());
			ptst.setString(3, Phovo.getPhomail());
			ptst.setString(4, Phovo.getPhovisa());
			ptst.setInt(5, Phovo.getPhototal());
			ptst.setString(6, Phovo.getMemno());
			ptst.executeUpdate();
			
			//取得訂單主鍵
			String phono = null;
			ResultSet rs = ptst.getGeneratedKeys();
			while(rs.next()){
				phono = rs.getString(1);
			}
			rs.close();
			
			//新增訂單明細及扣除商品數量
			PhdDAO pda = new PhdDAO();
			PahDAO paa = new PahDAO();
			PahService pas = new PahService();
			for(PhdVO pdv: phdList){
				pdv.setPhono(phono);
				pda.insert(pdv, con);
				
					
				//修改機加酒數量
				PahVO pahVO = pas.findByPk(pdv.getPahno());
				Integer pahnum = pahVO.getPahnum()-pdv.getPhdnum();
				Integer pahstatus = 0;
				//若機加酒數量為0，狀態改為下架
				if(pahnum<=0) {
					pahstatus = 1;
				}
				paa.decrease(pdv.getPahno(), pahnum, pahstatus, con);
			}
			
			
			//完全新增完成
			con.commit();
			con.setAutoCommit(true);
		}catch(SQLException se) {
			
			if(con != null) {
				try {
					con.rollback();					
				}catch(SQLException sqe) {
					sqe.printStackTrace();
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
	public void update(PhoVO Phovo) {
		Connection con = null;
		PreparedStatement ptst = null;
		
		try {
			
			con = ds.getConnection();
			ptst = con.prepareStatement(UPDATE);
			ptst.setString(1, Phovo.getPhoowner());
			ptst.setString(2, Phovo.getPhophone());
			ptst.setString(3, Phovo.getPhomail());
			ptst.setDate(4, Phovo.getPhostdate());
			ptst.setInt(5, Phovo.getPhostatus());
			ptst.setString(6, Phovo.getPhomark());
			ptst.setString(7, Phovo.getPhovisa());
			ptst.setInt(8, Phovo.getPhototal());
			ptst.setString(9, Phovo.getMemno());
			ptst.setString(10, Phovo.getPhono());
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
	public void delete(String PHONO) {
		Connection con = null;
		PreparedStatement ptst = null;
		
		try {
			
			con = ds.getConnection();
			ptst = con.prepareStatement(DELETE);
			ptst.setString(1, PHONO);
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
	public PhoVO findByPrimaryKey(String PHONO) {
		Connection con = null;
		PreparedStatement ptst = null;
		ResultSet rs = null;
		PhoVO phovo = null;
		
		try {
			con = ds.getConnection();
			ptst = con.prepareStatement(GET_ONE_STMT);
			ptst.setString(1, PHONO);
			rs = ptst.executeQuery();
			
			while(rs.next()) {
				phovo = new PhoVO();
				phovo.setPhono(rs.getString("PHONO"));
				phovo.setPhoowner(rs.getString("PHOOWNER"));
				phovo.setPhophone(rs.getString("PHOPHONE"));
				phovo.setPhomail(rs.getString("PHOMAIL"));
				phovo.setPhostdate(rs.getDate("PHOSTDATE"));
				phovo.setPhostatus(rs.getInt("PHOSTATUS"));
				phovo.setPhomark(rs.getString("PHOMARK"));
				phovo.setPhovisa(rs.getString("PHOVISA"));
				phovo.setPhototal(rs.getInt("PHOTOTAL"));
				phovo.setMemno(rs.getString("MEMNO"));
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
		return phovo;
	}

	@Override
	public List<PhoVO> getall() {
		Connection con = null;
		PreparedStatement ptst = null;
		ResultSet rs = null;
		List<PhoVO> list = new ArrayList<PhoVO>();
		
		try {
			con = ds.getConnection();
			ptst = con.prepareStatement(GET_ALL_STMT);
			rs = ptst.executeQuery();
			
			while(rs.next()) {
				PhoVO phovo = new PhoVO();
				phovo.setPhono(rs.getString("PHONO"));
				phovo.setPhoowner(rs.getString("PHOOWNER"));
				phovo.setPhophone(rs.getString("PHOPHONE"));
				phovo.setPhomail(rs.getString("PHOMAIL"));
				phovo.setPhostdate(rs.getDate("PHOSTDATE"));
				phovo.setPhostatus(rs.getInt("PHOSTATUS"));
				phovo.setPhomark(rs.getString("PHOMARK"));
				phovo.setPhovisa(rs.getString("PHOVISA"));
				phovo.setPhototal(rs.getInt("PHOTOTAL"));
				phovo.setMemno(rs.getString("MEMNO"));
				list.add(phovo);
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
	public List<PhoVO> getmeorder(String MEMNO) {
		Connection con = null;
		PreparedStatement ptst = null;
		ResultSet rs = null;
		List<PhoVO> list = new ArrayList<PhoVO>();
		
		try {
			con = ds.getConnection();
			ptst = con.prepareStatement(GET_ME);
			ptst.setString(1, MEMNO);
			rs = ptst.executeQuery();
			
			while(rs.next()) {
				PhoVO phovo = new PhoVO();
				phovo.setPhono(rs.getString("PHONO"));
				phovo.setPhoowner(rs.getString("PHOOWNER"));
				phovo.setPhophone(rs.getString("PHOPHONE"));
				phovo.setPhomail(rs.getString("PHOMAIL"));
				phovo.setPhostdate(rs.getDate("PHOSTDATE"));
				phovo.setPhostatus(rs.getInt("PHOSTATUS"));
				phovo.setPhomark(rs.getString("PHOMARK"));
				phovo.setPhovisa(rs.getString("PHOVISA"));
				phovo.setPhototal(rs.getInt("PHOTOTAL"));
				phovo.setMemno(rs.getString("MEMNO"));
				list.add(phovo);
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

	public void changeStatus(Integer phostatus, String phomark, String phono) {
		Connection con = null;
		PreparedStatement ptst = null;
		
		try {
			
			con = ds.getConnection();
			ptst = con.prepareStatement(CHANGESTATUS);
			
			ptst.setInt(1, phostatus);
			ptst.setString(2, phomark);
			ptst.setString(3, phono);
			
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
	
	
}
