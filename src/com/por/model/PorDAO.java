package com.por.model;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
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

public class PorDAO implements PorDAO_interface{
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
						"INSERT INTO PURCHASEORDER (PORID,PURID,MEMNO,PORMEMNAME,PORPRICE,PORTIME,PORADDRESS,PORTEL,PORSTATUS,PORBUYSCORE,PORBUYCONTENT,PORSELLSCORE,PORSELLCONTENT,PORSUM,PORLOGISTICS,PORQR) VALUES ('POR'||LPAD(to_char(PORID_SEQ.NEXTVAL),6,'0'), ?, ?, ?, ?, CURRENT_TIMESTAMP, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
				private static final String GET_ALL_STMT = 
					"SELECT * FROM PURCHASEORDER order by PORID";
				private static final String GET_ONE_STMT = 
					"SELECT * FROM PURCHASEORDER where PORID = ?";
				private static final String DELETE = 
					"DELETE FROM PURCHASEORDER where PORID = ?";
				
				//買家給予評價
				private static final String UPDATE_PORBUYTIME = 
						"UPDATE PURCHASEORDER set PORBUYSCORE=? , PORBUYCONTENT=?, PORBUYTIME=sysdate where PORID = ?";

				//賣家給予評價
				private static final String UPDATE_PORSELLTIME = 
						"UPDATE PURCHASEORDER set PORSELLSCORE=? , PORSELLCONTENT=?, PORSELLTIME=sysdate where PORID = ?";
				
				//更新代購狀態
				private static final String UPDATE_PORSTATUS = 
						"UPDATE PURCHASEORDER set PORSTATUS=? ,PORSTATUSTIME=sysdate where PORID = ?";
				private static final String UPDATE = 
					"UPDATE PURCHASEORDER set PURID=? , MEMNO=? ,PORMEMNAME=? ,PORPRICE=? ,PORADDRESS=? ,PORTEL=? ,PORSTATUS=? ,PORBUYSCORE=? ,PORBUYCONTENT=? ,PORSELLSCORE=? ,PORSELLCONTENT=? ,PORSUM=? ,PORLOGISTICS=? ,PORQR=?  where PORID = ?";
				private static final String GET_PUR_ALLPOR = 
						"select sum(porsum) as porsumpur from purchaseorder where purid=?";
		
		@Override
		public void insert(PorVO porVO) {
			// TODO Auto-generated method stub
			Connection con = null;
			PreparedStatement pstmt = null;

			try {
				con = ds.getConnection();
pstmt = con.prepareStatement(INSERT_STMT);
				
				pstmt.setString(1, porVO.getPurid());
				pstmt.setString(2, porVO.getMemno());
				pstmt.setString(3, porVO.getPormemname());
				pstmt.setInt(4, porVO.getPorprice());
				pstmt.setString(5, porVO.getPoraddress());
				pstmt.setString(6, porVO.getPortel());
				pstmt.setInt(7, porVO.getPorstatus());
				pstmt.setInt(8, porVO.getPorbuyscore());
				pstmt.setString(9, porVO.getPorbuycontent());
				pstmt.setInt(10, porVO.getPorsellscore());
				pstmt.setString(11, porVO.getPorsellcontent());
				pstmt.setInt(12, porVO.getPorsum());
				pstmt.setInt(13, porVO.getPorlogistics());
				pstmt.setBytes(14, porVO.getPorqr());
				
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
		public void update(PorVO porVO) {
			// TODO Auto-generated method stub
			Connection con = null;
			PreparedStatement pstmt = null;

			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(UPDATE);

				pstmt.setString(1, porVO.getPurid());
				pstmt.setString(2, porVO.getMemno());
				pstmt.setString(3, porVO.getPormemname());
				pstmt.setInt(4, porVO.getPorprice());
				pstmt.setString(5, porVO.getPoraddress());
				pstmt.setString(6, porVO.getPortel());
				pstmt.setInt(7, porVO.getPorstatus());
				pstmt.setInt(8, porVO.getPorbuyscore());
				pstmt.setString(9, porVO.getPorbuycontent());
				pstmt.setInt(10, porVO.getPorsellscore());
				pstmt.setString(11, porVO.getPorsellcontent());
				pstmt.setInt(12, porVO.getPorsum());
				pstmt.setInt(13, porVO.getPorlogistics());
				pstmt.setBytes(14, porVO.getPorqr());
				pstmt.setString(15, porVO.getPorid());


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
		public void delete(String porid) {
			// TODO Auto-generated method stub
			Connection con = null;
			PreparedStatement pstmt = null;

			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(DELETE);

				pstmt.setString(1, porid);

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
		public PorVO findByPrimaryKey(String porid) {
			// TODO Auto-generated method stub
			PorVO porVO = null;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_ONE_STMT);

				pstmt.setString(1, porid);

				rs = pstmt.executeQuery();

				while (rs.next()) {
					// porVO 也稱為 Domain objects
					porVO = new PorVO();
					porVO.setPorid(rs.getString("porid"));
					porVO.setPurid(rs.getString("purid"));
					porVO.setMemno(rs.getString("memno"));
					porVO.setPormemname(rs.getString("pormemname"));
					porVO.setPorprice(rs.getInt("porprice"));
					porVO.setPortime(rs.getTimestamp("portime"));
					porVO.setPoraddress(rs.getString("poraddress"));
					porVO.setPortel(rs.getString("portel"));
					porVO.setPorstatus(rs.getInt("porstatus"));
					porVO.setPorbuyscore(rs.getInt("porbuyscore"));
					porVO.setPorbuycontent(rs.getString("porbuycontent"));
					porVO.setPorsellscore(rs.getInt("porsellscore"));
					porVO.setPorsellcontent(rs.getString("porsellcontent"));
					porVO.setPorsum(rs.getInt("porsum"));
					porVO.setPorlogistics(rs.getInt("porlogistics"));
					porVO.setPorqr(rs.getBytes("porqr"));

					
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
			return porVO;
		}

		@Override
		public List<PorVO> getAll() {
			// TODO Auto-generated method stub
			List<PorVO> list = new ArrayList<PorVO>();
			PorVO porVO = null;

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_ALL_STMT);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					// acrVO 也稱為 Domain objects
					porVO = new PorVO();
					porVO.setPorid(rs.getString("porid"));
					porVO.setPurid(rs.getString("purid"));
					porVO.setMemno(rs.getString("memno"));
					porVO.setPormemname(rs.getString("pormemname"));
					porVO.setPorprice(rs.getInt("porprice"));
					porVO.setPortime(rs.getTimestamp("portime"));
					porVO.setPoraddress(rs.getString("poraddress"));
					porVO.setPortel(rs.getString("portel"));
					porVO.setPorstatus(rs.getInt("porstatus"));
					porVO.setPorbuyscore(rs.getInt("porbuyscore"));
					porVO.setPorbuycontent(rs.getString("porbuycontent"));
					porVO.setPorsellscore(rs.getInt("porsellscore"));
					porVO.setPorsellcontent(rs.getString("porsellcontent"));
					porVO.setPorsum(rs.getInt("porsum"));
					porVO.setPorlogistics(rs.getInt("porlogistics"));
					porVO.setPorqr(rs.getBytes("porqr"));
					list.add(porVO); // Store the row in the list
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
		public Integer getPurporsum(String purid) {
			// TODO Auto-generated method stub
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			Integer purporsum=0;
			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_PUR_ALLPOR);
				pstmt.setString(1, purid);
				rs = pstmt.executeQuery();
				
				
				while (rs.next()) {
					// acrVO 也稱為 Domain objects
					purporsum =rs.getInt("porsumpur");
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
			return purporsum;
		}

		@Override
		public void updatePorStatus(PorVO porVO) {
			// TODO Auto-generated method stub
			Connection con = null;
			PreparedStatement pstmt = null;

			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(UPDATE_PORSTATUS);

				pstmt.setInt(1, porVO.getPorstatus());
				pstmt.setString(2, porVO.getPorid());


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
		public void updatePorBuyTime(PorVO porVO) {
			// TODO Auto-generated method stub
			Connection con = null;
			PreparedStatement pstmt = null;

			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(UPDATE_PORBUYTIME);

				pstmt.setInt(1, porVO.getPorbuyscore());
				pstmt.setString(2, porVO.getPorbuycontent());
				pstmt.setString(3, porVO.getPorid());


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
		public void updatePorSellTime(PorVO porVO) {
			// TODO Auto-generated method stub
			Connection con = null;
			PreparedStatement pstmt = null;

			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(UPDATE_PORSELLTIME);

				pstmt.setInt(1, porVO.getPorsellscore());
				pstmt.setString(2, porVO.getPorsellcontent());
				pstmt.setString(3, porVO.getPorid());


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
