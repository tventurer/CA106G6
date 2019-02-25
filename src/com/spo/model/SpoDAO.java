package com.spo.model;

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

public class SpoDAO implements SpoDAO_interface {

	private static DataSource ds =null;
	static {
		try{
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/TV");
		} catch(NamingException ne) {
			ne.printStackTrace();
		}
	}
	
	private static final String ADD_STMT = "INSERT INTO SPOT (SPONO, SPONAME, SPOCLASS, SPOCON, SPOCITY, SPOLAT, SPOLONG, SPOADDR, SPOCONTENT, SPOPIC, SPOATTRIBUTE) VALUES ('SPO'||LPAD(TO_CHAR(SPO_SEQ.NEXTVAL),6,'0'), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String UPDATE_STMT = "UPDATE SPOT SET SPONAME=?, SPOCLASS=?, SPOCON=?, SPOCITY=?, SPOLAT=?, SPOLONG=?, SPOADDR=?, SPOCONTENT=?, SPOPIC=?, SPOATTRIBUTE=? WHERE SPONO=?";
	private static final String DELETE_STMT = "DELETE FROM SPOT WHERE SPONO=?";
	private static final String FINDBYCITY_STMT = "SELECT * FROM SPOT WHERE SPOCITY=?";
	private static final String FINDBYCLASS_STMT = "SELECT * FROM SPOT WHERE SPOCLASS=?";
	private static final String GETALL_STMT = "SELECT * FROM SPOT";

	@Override
	public void add(SpoVO spot) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			String[] cols = { "SPONO" };
			pstmt = con.prepareStatement(ADD_STMT, cols);

			pstmt.setString(1, spot.getSponame());
			pstmt.setString(2, spot.getSpoclass());
			pstmt.setString(3, spot.getSpocon());
			pstmt.setString(4, spot.getSpocity());
			pstmt.setDouble(5, spot.getSpolat());
			pstmt.setDouble(6, spot.getSpolong());
			pstmt.setString(7, spot.getSpoaddr());
			pstmt.setString(8, spot.getSpocontent());
			pstmt.setBytes(9, spot.getSpopic());
			pstmt.setInt(10, spot.getSpoattribute());

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
	public void update(SpoVO spot) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STMT);

			pstmt.setString(1, spot.getSponame());
			pstmt.setString(2, spot.getSpoclass());
			pstmt.setString(3, spot.getSpocon());
			pstmt.setString(4, spot.getSpocity());
			pstmt.setDouble(5, spot.getSpolat());
			pstmt.setDouble(6, spot.getSpolong());
			pstmt.setString(7, spot.getSpoaddr());
			pstmt.setString(8, spot.getSpocontent());
			pstmt.setBytes(9, spot.getSpopic());
			pstmt.setInt(10, spot.getSpoattribute());
			pstmt.setString(11, spot.getSpono());

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
	public void delete(String spono) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE_STMT);

			pstmt.setString(1, spono);

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
	public SpoVO findByPk(String spono) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		SpoVO spot = new SpoVO();

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(FINDBYCITY_STMT);

			pstmt.setString(1, spono);

			rs = pstmt.executeQuery();

			rs.next();
			spot.setSpono(rs.getString(1));
			spot.setSponame(rs.getString(2));
			spot.setSpoclass(rs.getString(3));
			spot.setSpocon(rs.getString(4));
			spot.setSpocity(rs.getString(5));
			spot.setSpolat(rs.getDouble(6));
			spot.setSpolong(rs.getDouble(7));
			spot.setSpoaddr(rs.getString(8));
			spot.setSpocontent(rs.getString(9));
			spot.setSpopic(rs.getBytes(10));
			spot.setSpoattribute(rs.getInt(11));

		} catch (SQLException se) {
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

		return spot;
	}

	@Override
	public List<SpoVO> findByCity(String spocity) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<SpoVO> list = new ArrayList<SpoVO>();

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(FINDBYCITY_STMT);

			pstmt.setString(1, spocity);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				SpoVO spot = new SpoVO();
				spot.setSpono(rs.getString(1));
				spot.setSponame(rs.getString(2));
				spot.setSpoclass(rs.getString(3));
				spot.setSpocon(rs.getString(4));
				spot.setSpocity(rs.getString(5));
				spot.setSpolat(rs.getDouble(6));
				spot.setSpolong(rs.getDouble(7));
				spot.setSpoaddr(rs.getString(8));
				spot.setSpocontent(rs.getString(9));
				spot.setSpopic(rs.getBytes(10));
				spot.setSpoattribute(rs.getInt(11));
				list.add(spot);
			}

		} catch (SQLException se) {
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
	public List<SpoVO> findByClass(String spoclass) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<SpoVO> list = new ArrayList<SpoVO>();

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(FINDBYCLASS_STMT);

			pstmt.setString(1, spoclass);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				SpoVO spot = new SpoVO();
				spot.setSpono(rs.getString(1));
				spot.setSponame(rs.getString(2));
				spot.setSpoclass(rs.getString(3));
				spot.setSpocon(rs.getString(4));
				spot.setSpocity(rs.getString(5));
				spot.setSpolat(rs.getDouble(6));
				spot.setSpolong(rs.getDouble(7));
				spot.setSpoaddr(rs.getString(8));
				spot.setSpocontent(rs.getString(9));
				spot.setSpopic(rs.getBytes(10));
				spot.setSpoattribute(rs.getInt(11));
				list.add(spot);
			}

		} catch (SQLException se) {
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
	public List<SpoVO> getAll() {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<SpoVO> list = new ArrayList<SpoVO>();

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GETALL_STMT);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				SpoVO spot = new SpoVO();
				spot.setSpono(rs.getString(1));
				spot.setSponame(rs.getString(2));
				spot.setSpoclass(rs.getString(3));
				spot.setSpocon(rs.getString(4));
				spot.setSpocity(rs.getString(5));
				spot.setSpolat(rs.getDouble(6));
				spot.setSpolong(rs.getDouble(7));
				spot.setSpoaddr(rs.getString(8));
				spot.setSpocontent(rs.getString(9));
				spot.setSpopic(rs.getBytes(10));
				spot.setSpoattribute(rs.getInt(11));
				list.add(spot);
			}

		} catch (SQLException se) {
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
