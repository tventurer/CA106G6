package com.pho.model;

import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

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
	
	
	@Override
	public void refundPah(List<PhdVO> phdlist, Integer phostatus, String phomark, String phono) {
		Connection con = null;
		PreparedStatement ptst = null;
		
		try {
			
			con = ds.getConnection();
			con.setAutoCommit(false);
			ptst = con.prepareStatement(CHANGESTATUS);
			
//			更改訂單狀態
			ptst.setInt(1, phostatus);
			ptst.setString(2, phomark);
			ptst.setString(3, phono);			
			ptst.executeUpdate();
			
//			將商品數量加回去
			PahService pas = new PahService();
			PahDAO pda = new PahDAO();
			for(PhdVO phdvo:phdlist) {
				PahVO pahvo = pas.findByPk(phdvo.getPahno());
				int num = pahvo.getPahnum() + phdvo.getPhdnum();
				pda.decrease(phdvo.getPahno(), num, 0, con);
			}
			
			
			con.commit();
			con.setAutoCommit(true);			
		}catch(SQLException e) {
			
			if(con != null) {
				try {
					con.rollback();					
				}catch(SQLException sqe) {
					sqe.printStackTrace();
				}
			}
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
	
	
	
	
	//**********android使用
	private final static String INSERT_ORDER = "INSERT INTO PLANEHOTELORDER(phono, phoowner, phophone, phomail, phostdate, phostatus, phomark, phovisa, phototal, memno) "
                                             + "VALUES('PHO'||LPAD(to_char(PHO_SEQ.NEXTVAL), 6, '0'), ?, ?, ?, SYSDATE, ?, ?, ?, ?, ?)";
	//**********android使用
	@Override
	public String addWithPhoList(PhoListVO phoListVO, List<PhdVO> phdVOList) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String next_orderid = null;
		
		try {
			con = ds.getConnection();
			
			con.setAutoCommit(false);
			//設定pstmt並新增訂單
			String[] cols = {"phono"};
			pstmt = con.prepareStatement(INSERT_ORDER, cols);
			
			pstmt.setString(1, phoListVO.getPhoowner());
			pstmt.setString(2, phoListVO.getPhophone());
			pstmt.setString(3, phoListVO.getPhomail());
			pstmt.setInt(4, 0);
			pstmt.setString(5, phoListVO.getPhomark());
			pstmt.setString(6, phoListVO.getPhovisa());
			pstmt.setInt(7, phoListVO.getPhototal());
			pstmt.setString(8, phoListVO.getMemno());
			
			pstmt.executeUpdate();
			
			//取得自增主鍵值
			ResultSet rs = pstmt.getGeneratedKeys();
			if(rs.next()) {
				next_orderid = rs.getString(1);
				System.out.println("自增主鍵值 = " + next_orderid);
			} else {
				System.out.println("未取得自增主鍵");
			}
			rs.close();
			
			//新增訂單明細
			PhdDAO phdDAO = new PhdDAO();
			for(PhdVO phdVO : phdVOList) {
				phdVO.setPhono(next_orderid);
				phdDAO.insertAn(phdVO, con); //新增訂單明細
			}
			con.commit();
			con.setAutoCommit(true);
			System.out.println("orderItemList.size()-B= " + phdVOList.size());
			System.out.println("新增訂單編號" + next_orderid + "時，共有明細" + phdVOList.size() + "筆同時被新增");

		}catch(SQLException sqle) {
			if(con != null) {
				try {
					System.err.println("交易 rollback!");
					con.rollback();
				}catch(SQLException sqle2) {
					throw new RuntimeException("rollback error occured." + sqle2.getMessage());
				}
			}
			throw new RuntimeException("a data base errored occured." + sqle.getMessage());
		}finally{
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch(SQLException sqle) {
					sqle.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				}catch(SQLException sqle) {
					sqle.printStackTrace();
				}
			}
		}
		return next_orderid;
	}

	//**********android使用
	private static final String GET_ALL = "SELECT * FROM PLANEHOTELORDER WHERE memno = ? ORDER BY phostdate DESC";
	private static final String GET_BY_DATE = "SELECT * FROM PLANEHOTELORDER WHERE memno = ? "
                                            + "AND phostdate BETWEEN TO_DATE(?, 'yyyy-mm-dd') AND TO_DATE(?, 'yyyy-mm-dd') ORDER BY phostdate DESC";
	
	//**********android使用
	@Override
	public List<PhoListVO> getall(String memno, String start, String end) {
		
		List<PhoListVO> phoList = new ArrayList<>();
		PhoListVO phoListVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String end_more = "";
		
		try {
			con = ds.getConnection();
			
			if (start == null || end == null || start.isEmpty()
					|| end.isEmpty()) {
				pstmt = con.prepareStatement(GET_ALL);
				pstmt.setString(1, memno);
			} else {
				try {
					//把傳入的日期多加一天
					DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
					java.util.Date endDate = df.parse(end);
					long endDate_long = endDate.getTime() + 1000 * 60 * 60 * 24L;
					java.util.Date endDate_more = new java.util.Date(endDate_long);
					end_more = df.format(endDate_more);
					end = end_more;
				} catch (ParseException e) {
					e.printStackTrace();
				}
				pstmt = con.prepareStatement(GET_BY_DATE);
				pstmt.setString(1, memno);
				pstmt.setString(2, start);
				pstmt.setString(3, end);
			}

			rs = pstmt.executeQuery();

			while (rs.next()) {
				phoListVO = new PhoListVO();
				phoListVO.setPhono(rs.getString(1));
				phoListVO.setPhoowner(rs.getString(2));
				phoListVO.setPhophone(rs.getString(3));
				phoListVO.setPhomail(rs.getString(4));
				phoListVO.setPhostdate(rs.getDate(5));
				phoListVO.setPhostatus(rs.getInt(6));
				phoListVO.setPhomark(rs.getString(7));
				phoListVO.setPhovisa(rs.getString(8));
				phoListVO.setPhototal(rs.getInt(9));
				phoListVO.setMemno(rs.getString(10));
				phoList.add(phoListVO);
			}
			// Handle any driver errors
		}catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		}finally {
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
		return phoList;
	}

	
}
