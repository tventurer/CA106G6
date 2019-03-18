package com.spo.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SpoJDBCDAO implements SpoDAO_interface {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "TV";
	String passwd = "123456";
	
	private static final String ADD_STMT = "INSERT INTO SPOT (SPONO, SPONAME, SPOCLASS, SPOCON, SPOCITY, SPOLAT, SPOLONG, SPOADDR, SPOCONTENT, SPOPIC, SPOATTRIBUTE) VALUES ('SPO'||LPAD(TO_CHAR(SPO_SEQ.NEXTVAL),6,'0'), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String UPDATE_STMT = "UPDATE SPOT SET SPONAME=?, SPOCLASS=?, SPOCON=?, SPOCITY=?, SPOLAT=?, SPOLONG=?, SPOADDR=?, SPOCONTENT=?, SPOPIC=?, SPOATTRIBUTE=? WHERE SPONO=?";
	private static final String DELETE_STMT = "DELETE FROM SPOT WHERE SPONO=?";
	private static final String FINDBYPK_STMT = "SELECT * FROM SPOT WHERE SPONO=?";
	private static final String FINDBYNAME_STMT = "SELECT * FROM SPOT WHERE SPONAME=?";
	private static final String FINDBYCITY_STMT = "SELECT * FROM SPOT WHERE SPOCITY=?";
	private static final String FINDBYCLASS_STMT = "SELECT * FROM SPOT WHERE SPOCLASS=?";
	private static final String GETALL_STMT = "SELECT * FROM SPOT";
	private static final String SHOWCLASS_STMT = "SELECT DISTINCT SPOCLASS FROM SPOT ORDER BY nlssort(SPOCLASS,'NLS_SORT=SCHINESE_STROKE_M') DESC";

	@Override
	public void add(SpoVO spot) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			
			pstmt = con.prepareStatement(ADD_STMT);

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

		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e.getMessage());
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
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
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

		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e.getMessage());
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
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE_STMT);

			pstmt.setString(1, spono);

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e.getMessage());
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
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(FINDBYPK_STMT);

			pstmt.setString(1, spono);

			rs = pstmt.executeQuery();

			if(rs.next()) {
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
			}

		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e.getMessage());
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
	public SpoVO findByName(String sponame) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		SpoVO spot = new SpoVO();
		
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(FINDBYNAME_STMT);
			
			pstmt.setString(1, sponame);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
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
			}
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException(se.getMessage());
		}  finally {
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
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
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

		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e.getMessage());
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
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
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

		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e.getMessage());
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
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
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

		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e.getMessage());
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
	public List<String> showClass() {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> list = new ArrayList<String>();
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SHOWCLASS_STMT);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(rs.getString(1));
			}
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e.getMessage());
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
	public List<String> getCity(String cityname) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> citys = new ArrayList<String>();
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			String GETCITY_STMT = "SELECT DISTINCT SPOCITY FROM SPOT WHERE SPOCITY LIKE '%" + cityname + "%'";
			pstmt = con.prepareStatement(GETCITY_STMT);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				citys.add(rs.getString(1));
			}
			
			System.out.println("查詢城市結果有" + citys.size() + "筆");
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e.getMessage());
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
		return citys;
	}

	@Override
	public List<SpoVO> findByClassAndCity(String spoclass, String spocity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> getAllCity() {
		// TODO Auto-generated method stub
		return null;
	}

}
