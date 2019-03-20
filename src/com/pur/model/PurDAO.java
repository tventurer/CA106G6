package com.pur.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class PurDAO implements PurDAO_interface{
	// 一個應用程式終，針對一個資料庫，共用一個DataSource即可
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TV");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = 
		"INSERT INTO PURCHASE (PURID,MEMNO,PURNAME,PURCONTENT,PURSORT,PURURL,PURCOUNTRY,PURDELIVERY,PURREPRICE,PURPRICING,PUROBTAINED,PURTIME,PURRECEIPT,PURSTATUS,PURPIC,PUREXTIME,PURSTOCK,PURSELL,PURLIMIT,PURSAVETIME) VALUES ('PUR'||LPAD(to_char(PURID_SEQ.NEXTVAL),6,'0'), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP, ?, ?, ?, ?, ?, ?, ?,CURRENT_TIMESTAMP)";
	private static final String GET_ALL_STMT = 
		"SELECT * FROM PURCHASE order by PURID";
	private static final String GET_ONE_STMT = 
		"SELECT * FROM PURCHASE where PURID = ?";
	private static final String DELETE = 
		"UPDATE PURCHASE set PURSTATUS=? , PURSAVETIME=sysdate where PURID = ?";
	private static final String UPDATE = 
		"UPDATE PURCHASE set MEMNO=? , PURNAME=? ,PURCONTENT=? ,PURSORT=? ,PURURL=? ,PURCOUNTRY=? ,PURDELIVERY=? ,PURREPRICE=? ,PURPRICING=? ,PUROBTAINED=? ,PURRECEIPT=? ,PURSTATUS=? ,PURPIC=? ,PUREXTIME=? ,PURSTOCK=? ,PURSELL=? ,PURLIMIT=?,PURSAVETIME=sysdate where PURID = ?";
	private static final String GET_MEMALL_STMT=
			"SELECT * FROM PURCHASE where MEMNO = ?";
	private static final String GET_SORTALL_STMT=
			"SELECT * FROM PURCHASE where PURSORT = ?";
	
	//更新商品賣出數量
	private static final String UPDATE_PURSELL = 
			"UPDATE PURCHASE set PURSELL=? where PURID = ?";
	//更新商品狀態並更新最後修改時間
	private static final String UPDATE_PURSTATUS = 
			"UPDATE PURCHASE set PURSTATUS=?,PURSAVETIME=sysdate where PURID = ?";

	
	@Override
	public void insert(PurVO purVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
	
				pstmt.setString(1, purVO.getMemno());
				pstmt.setString(2, purVO.getPurname());
				pstmt.setString(3, purVO.getPurcontent());
				pstmt.setInt(4, purVO.getPursort());
				pstmt.setString(5, purVO.getPururl());
				pstmt.setString(6, purVO.getPurcountry());
				pstmt.setString(7, purVO.getPurdelivery());
				pstmt.setInt(8, purVO.getPurreprice());
				pstmt.setInt(9, purVO.getPurpricing());
				pstmt.setTimestamp(10, purVO.getPurobtained());
				pstmt.setInt(11, purVO.getPurreceipt());
				pstmt.setInt(12, purVO.getPurstatus());
				pstmt.setBytes(13, purVO.getPurpic());
				pstmt.setTimestamp(14, purVO.getPurextime());
				pstmt.setInt(15, purVO.getPurstock());
				pstmt.setInt(16, purVO.getPursell());
				pstmt.setInt(17, purVO.getPurlimit());
				pstmt.executeUpdate();
				
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
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
	}

	@Override
	public void update(PurVO purVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, purVO.getMemno());
			pstmt.setString(2, purVO.getPurname());
			pstmt.setString(3, purVO.getPurcontent());
			pstmt.setInt(4, purVO.getPursort());
			pstmt.setString(5, purVO.getPururl());
			pstmt.setString(6, purVO.getPurcountry());
			pstmt.setString(7, purVO.getPurdelivery());
			pstmt.setInt(8, purVO.getPurreprice());
			pstmt.setInt(9, purVO.getPurpricing());
			pstmt.setTimestamp(10, purVO.getPurobtained());
			pstmt.setInt(11, purVO.getPurreceipt());
			pstmt.setInt(12, purVO.getPurstatus());
			pstmt.setBytes(13, purVO.getPurpic());
			pstmt.setTimestamp(14, purVO.getPurextime());
			pstmt.setInt(15, purVO.getPurstock());
			pstmt.setInt(16, purVO.getPursell());
			pstmt.setInt(17, purVO.getPurlimit());
			pstmt.setString(18, purVO.getPurid());
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
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
	}

	@Override
	public void delete(String purid,Integer purstatus) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			pstmt.setInt(1, purstatus);
			pstmt.setString(2, purid);
			
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
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
	}

	@Override
	public PurVO findByPrimaryKey(String purid) {
		// TODO Auto-generated method stub
		PurVO purVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, purid);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// purVO 也稱為 Domain objects
				purVO = new PurVO();
				purVO.setPurid(rs.getString("purid"));
				purVO.setMemno(rs.getString("memno"));
				purVO.setPurname(rs.getString("purname"));
				purVO.setPurcontent(rs.getString("purcontent"));
				purVO.setPursort(rs.getInt("pursort"));
				purVO.setPururl(rs.getString("pururl"));
				purVO.setPurcountry(rs.getString("purcountry"));
				purVO.setPurdelivery(rs.getString("purdelivery"));
				purVO.setPurreprice(rs.getInt("purreprice"));
				purVO.setPurpricing(rs.getInt("purpricing"));
				purVO.setPurobtained(rs.getTimestamp("purobtained"));
				purVO.setPurtime(rs.getTimestamp("purtime"));
				purVO.setPurreceipt(rs.getInt("purreceipt"));
				purVO.setPurstatus(rs.getInt("purstatus"));
				purVO.setPurpic(rs.getBytes("purpic"));
				purVO.setPurextime(rs.getTimestamp("purextime"));
				purVO.setPurstock(rs.getInt("purstock"));
				purVO.setPursell(rs.getInt("pursell"));
				purVO.setPurlimit(rs.getInt("purlimit"));
				purVO.setPursavetime(rs.getTimestamp("pursavetime"));
				
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
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
		return purVO;
	}

	@Override
	public List<PurVO> getAll() {
		// TODO Auto-generated method stub
		List<PurVO> list = new ArrayList<PurVO>();
		PurVO purVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// acrVO 也稱為 Domain objects
				purVO = new PurVO();
				purVO.setPurid(rs.getString("purid"));
				purVO.setMemno(rs.getString("memno"));
				purVO.setPurname(rs.getString("purname"));
				purVO.setPurcontent(rs.getString("purcontent"));
				purVO.setPursort(rs.getInt("pursort"));
				purVO.setPururl(rs.getString("pururl"));
				purVO.setPurcountry(rs.getString("purcountry"));
				purVO.setPurdelivery(rs.getString("purdelivery"));
				purVO.setPurreprice(rs.getInt("purreprice"));
				purVO.setPurpricing(rs.getInt("purpricing"));
				purVO.setPurobtained(rs.getTimestamp("purobtained"));
				purVO.setPurtime(rs.getTimestamp("purtime"));
				purVO.setPurreceipt(rs.getInt("purreceipt"));
				purVO.setPurstatus(rs.getInt("purstatus"));
				purVO.setPurpic(rs.getBytes("purpic"));
				purVO.setPurextime(rs.getTimestamp("purextime"));
				purVO.setPurstock(rs.getInt("purstock"));
				purVO.setPursell(rs.getInt("pursell"));
				purVO.setPurlimit(rs.getInt("purlimit"));
				purVO.setPursavetime(rs.getTimestamp("pursavetime"));
				list.add(purVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
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
	public List<PurVO> getMemAll(String memno) {
		// TODO Auto-generated method stub
		List<PurVO> list = new ArrayList<PurVO>();
		PurVO purVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_MEMALL_STMT);
			pstmt.setString(1, memno);

			rs = pstmt.executeQuery();


			while (rs.next()) {
				// acrVO 也稱為 Domain objects
				purVO = new PurVO();
				purVO.setPurid(rs.getString("purid"));
				purVO.setMemno(rs.getString("memno"));
				purVO.setPurname(rs.getString("purname"));
				purVO.setPurcontent(rs.getString("purcontent"));
				purVO.setPursort(rs.getInt("pursort"));
				purVO.setPururl(rs.getString("pururl"));
				purVO.setPurcountry(rs.getString("purcountry"));
				purVO.setPurdelivery(rs.getString("purdelivery"));
				purVO.setPurreprice(rs.getInt("purreprice"));
				purVO.setPurpricing(rs.getInt("purpricing"));
				purVO.setPurobtained(rs.getTimestamp("purobtained"));
				purVO.setPurtime(rs.getTimestamp("purtime"));
				purVO.setPurreceipt(rs.getInt("purreceipt"));
				purVO.setPurstatus(rs.getInt("purstatus"));
				purVO.setPurpic(rs.getBytes("purpic"));
				purVO.setPurextime(rs.getTimestamp("purextime"));
				purVO.setPurstock(rs.getInt("purstock"));
				purVO.setPursell(rs.getInt("pursell"));
				purVO.setPurlimit(rs.getInt("purlimit"));
				purVO.setPursavetime(rs.getTimestamp("pursavetime"));
				list.add(purVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
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
	public List<PurVO> getSortAll(Integer pursort) {
		// TODO Auto-generated method stub
		List<PurVO> list = new ArrayList<PurVO>();
		PurVO purVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_SORTALL_STMT);
			pstmt.setInt(1, pursort);

			rs = pstmt.executeQuery();


			while (rs.next()) {
				// acrVO 也稱為 Domain objects
				purVO = new PurVO();
				purVO.setPurid(rs.getString("purid"));
				purVO.setMemno(rs.getString("memno"));
				purVO.setPurname(rs.getString("purname"));
				purVO.setPurcontent(rs.getString("purcontent"));
				purVO.setPursort(rs.getInt("pursort"));
				purVO.setPururl(rs.getString("pururl"));
				purVO.setPurcountry(rs.getString("purcountry"));
				purVO.setPurdelivery(rs.getString("purdelivery"));
				purVO.setPurreprice(rs.getInt("purreprice"));
				purVO.setPurpricing(rs.getInt("purpricing"));
				purVO.setPurobtained(rs.getTimestamp("purobtained"));
				purVO.setPurtime(rs.getTimestamp("purtime"));
				purVO.setPurreceipt(rs.getInt("purreceipt"));
				purVO.setPurstatus(rs.getInt("purstatus"));
				purVO.setPurpic(rs.getBytes("purpic"));
				purVO.setPurextime(rs.getTimestamp("purextime"));
				purVO.setPurstock(rs.getInt("purstock"));
				purVO.setPursell(rs.getInt("pursell"));
				purVO.setPurlimit(rs.getInt("purlimit"));
				purVO.setPursavetime(rs.getTimestamp("pursavetime"));
				list.add(purVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
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
	public void updatePurSell(PurVO purVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_PURSELL);


			pstmt.setInt(1, purVO.getPursell());
			pstmt.setString(2, purVO.getPurid());
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
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
		
	}

	@Override
	public void updatePurstatus(PurVO purVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_PURSTATUS);


			pstmt.setInt(1, purVO.getPurstatus());
			pstmt.setString(2, purVO.getPurid());
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
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
		
	}

}
