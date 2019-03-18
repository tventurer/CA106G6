package android.com.pah.model;

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

import android.jdbc.util.compositeQuery.*;

public class PahAnDAO implements PahAnDAO_interface{
	
	private static DataSource ds = null;
	
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TV");
		}catch(NamingException ne) {
			ne.printStackTrace();
		}
	}

//	private final static String INSERT_STMT = 
//		"INSERT INTO PLANEHOTEL (PAHNO,PAHNAME,PAHINTRO,PAHCONTENT,PAHPEOPLE,PAHPRICE,PAHCOUNTRY,PAHNUM,PAHSTDATE,PAHDOWN,PAHSTATUS,PAHPC1,PAHPC2,PAHPC3,PAHPC4,PAHPC5,EMPNO) VALUES ('PAH'||LPAD(TO_CHAR(PH_SEQ.NEXTVAL),6,'0'),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
//	private final static String UPDATE_STMT = 
//		"UPDATE PLANEHOTEL SET PAHNAME=?,PAHINTRO=?,PAHCONTENT=?,PAHPEOPLE=?,PAHPRICE=?,PAHCOUNTRY=?,PAHNUM=?,PAHSTDATE=?,PAHDOWN=?,PAHSTATUS=?,PAHPC1=?,PAHPC2=?,PAHPC3=?,PAHPC4=?,PAHPC5=?,EMPNO=? WHERE PAHNO=?";
//	private final static String DELETE =
//			"DELETE FROM PLANEHOTEL WHERE PAHNO = ?";
	private final static String GET_ONE_PK = 
	"SELECT PAHNO,PAHNAME,PAHINTRO,PAHCONTENT,PAHPRICE,PAHCOUNTRY,PAHNUM,to_char(PAHSTDATE,'yyyy-mm-dd') PAHSTDATE,to_char(PAHENDDATE,'yyyy-mm-dd') PAHENDDATE,to_char(PAHDOWN,'yyyy-mm-dd HH:MM:SS') PAHDOWN,PAHSTATUS,EMPNO FROM PLANEHOTEL WHERE PAHNO=?";
	 
	//取出國家列表SQL指令
	private final static String FIND_ONLY_COUNTRY =
			"SELECT DISTINCT PAHCOUNTRY FROM PLANEHOTEL";
	//取出文字資料SQL指令
	private final static String GET_ALL =
		"SELECT PAHNO,PAHNAME,PAHINTRO,PAHCONTENT,PAHPRICE,PAHCOUNTRY,PAHNUM,to_char(PAHSTDATE,'yyyy-mm-dd') PAHSTDATE, to_char(PAHENDDATE,'yyyy-mm-dd') PAHENDDATE, to_char(PAHDOWN,'yyyy-mm-dd HH:MM:SS') PAHDOWN,PAHSTATUS,EMPNO FROM PLANEHOTEL ORDER BY PAHNO";
	
	private final static String GET_ONE_COUNTRY =
		"SELECT PAHNO,PAHNAME,PAHINTRO,PAHCONTENT,PAHPRICE,PAHCOUNTRY,PAHNUM,to_char(PAHSTDATE,'yyyy-mm-dd') PAHSTDATE, to_char(PAHENDDATE,'yyyy-mm-dd') PAHENDDATE, to_char(PAHDOWN,'yyyy-mm-dd HH:MM:SS') PAHDOWN,PAHSTATUS,EMPNO FROM PLANEHOTEL WHERE PAHCOUNTRY=?";
	private final static String GET_ONE_PRICE = 
		"SELECT PAHNO,PAHNAME,PAHINTRO,PAHCONTENT,PAHPRICE,PAHCOUNTRY,PAHNUM,to_char(PAHSTDATE,'yyyy-mm-dd') PAHSTDATE, to_char(PAHENDDATE,'yyyy-mm-dd') PAHENDDATE, to_char(PAHDOWN,'yyyy-mm-dd HH:MM:SS') PAHDOWN,PAHSTATUS,EMPNO FROM PLANEHOTEL WHERE PAHPRICE BETWEEN ? AND ?";
	private final static String GET_ONE_DATE = 
		"SELECT PAHNO,PAHNAME,PAHINTRO,PAHCONTENT,PAHPRICE,PAHCOUNTRY,PAHNUM,to_char(PAHSTDATE,'yyyy-mm-dd') PAHSTDATE, to_char(PAHENDDATE,'yyyy-mm-dd') PAHENDDATE, to_char(PAHDOWN,'yyyy-mm-dd HH:MM:SS') PAHDOWN,PAHSTATUS,EMPNO FROM PLANEHOTEL WHERE PAHSTDATE BETWEEN ? AND ?";
	//取出圖片SQL指令
	private final static String GET_IMG_1 =
		"SELECT pahpc1 from PLANEHOTEL WHERE pahno =?";
	private final static String GET_IMG_2 =
		"SELECT pahpc2 from PLANEHOTEL WHERE pahno =?";
	private final static String GET_IMG_3 =
		"SELECT pahpc3 from PLANEHOTEL WHERE pahno =?";
	private final static String GET_IMG_4 =
		"SELECT pahpc4 from PLANEHOTEL WHERE pahno =?";
	private final static String GET_IMG_5 =
		"SELECT pahpc5 from PLANEHOTEL WHERE pahno =?";

		
//	@Override
//	public void insert(PahAnVO pahAnVO) {
//		
//		Connection con = null;
//		PreparedStatement ptst = null;
//		
//		try {
//			con = ds.getConnection();
//			ptst = con.prepareStatement(INSERT_STMT);
//			
//			ptst.setString(1, pahAnVO.getPahname());
//			ptst.setString(2, pahAnVO.getPahintro());
//			ptst.setString(3, pahAnVO.getPahcontent());
//			ptst.setInt(4, pahAnVO.getPahpeople());
//			ptst.setDouble(5, pahAnVO.getPahprice());
//			ptst.setString(6, pahAnVO.getPahcountry());
//			ptst.setInt(7, pahAnVO.getPahnum());
//			ptst.setDate(8, pahAnVO.getPahstdate());
//			ptst.setTimestamp(9, pahAnVO.getPahdown());
//			ptst.setInt(10, pahAnVO.getPahstatus());
//			ptst.setBytes(11, pahAnVO.getPahpc1());
//			ptst.setBytes(12, pahAnVO.getPahpc2());
//			ptst.setBytes(13, pahAnVO.getPahpc3());
//			ptst.setBytes(14, pahAnVO.getPahpc4());
//			ptst.setBytes(15, pahAnVO.getPahpc5());
//			ptst.setString(16, pahAnVO.getEmpno());
//			
//			ptst.executeUpdate();
//			
//		}catch(SQLException e) {
//			throw new RuntimeException("A database error occured. "
//					+ e.getMessage());
//		}finally {
//			
//			if(ptst != null) {
//				try {
//					con.close();
//				}catch(SQLException e) {
//					e.printStackTrace();
//				}
//			}
//			if(con != null) {
//				try {
//					con.close();
//				}catch(SQLException e) {
//					e.printStackTrace();
//				}
//			}
//			
//		}	
//	}
//	
//	@Override
//	public void update(PahVO ItemVO) {
//		
//		Connection con = null;
//		PreparedStatement ptst = null;
//		
//		try {
//			
//			con = ds.getConnection();
//			ptst = con.prepareStatement(UPDATE_STMT);
//			
//			ptst.setString(1, ItemVO.getPahname());
//			ptst.setString(2, ItemVO.getPahintro());
//			ptst.setString(3, ItemVO.getPahcontent());
//			ptst.setInt(4, ItemVO.getPahpeople());
//			ptst.setDouble(5, ItemVO.getPahprice());
//			ptst.setString(6, ItemVO.getPahcountry());
//			ptst.setInt(7, ItemVO.getPahnum());
//			ptst.setDate(8, ItemVO.getPahstdate());
//			ptst.setTimestamp(9, ItemVO.getPahdown());
//			ptst.setInt(10, ItemVO.getPahstatus());
//			ptst.setBytes(11, ItemVO.getPahpc1());
//			ptst.setBytes(12, ItemVO.getPahpc2());
//			ptst.setBytes(13, ItemVO.getPahpc3());
//			ptst.setBytes(14, ItemVO.getPahpc4());
//			ptst.setBytes(15, ItemVO.getPahpc5());
//			ptst.setString(16, ItemVO.getEmpno());
//			ptst.setString(17, ItemVO.getPahno());
//			
//			ptst.executeUpdate();
//			
//		}catch(SQLException e) {
//			throw new RuntimeException("A database error occured. "
//					+ e.getMessage());
//		}finally {
//			
//			if(ptst != null) {
//				try {
//					con.close();
//				}catch(SQLException e) {
//					e.printStackTrace();
//				}
//			}
//			if(con != null) {
//				try {
//					con.close();
//				}catch(SQLException e) {
//					e.printStackTrace();
//				}
//			}
//			
//		}
//	}
//	
//	@Override
//	public void delete(String PAHNO) {
//		
//		Connection con = null;
//		PreparedStatement ptst = null;
//		
//		try {
//			
//			con = ds.getConnection();
//			ptst = con.prepareStatement(DELETE);
//			ptst.setString(1, PAHNO);
//			ptst.executeUpdate();	
//			
//		}catch(SQLException e) {
//			throw new RuntimeException("A database error occured. "
//					+ e.getMessage());
//		}finally {
//			if(ptst != null) {
//				try {
//					ptst.close();
//				}catch(SQLException e) {
//					e.printStackTrace();
//				}
//			}
//			if(con != null) {
//				try {
//					con.close();
//				}catch(SQLException e) {
//					e.printStackTrace();
//				}
//			}
//		}
//	}
//	
	
	@Override
	public PahAnVO findOneByPk(String pahno) {
		PahAnVO pahAnVO = null;
		Connection con = null;
		PreparedStatement ptst = null;
		ResultSet rs = null;
		
		try {
			
			con = ds.getConnection();
			ptst = con.prepareStatement(GET_ONE_PK);
			ptst.setString(1, pahno);
			rs = ptst.executeQuery();
			
			while(rs.next()) {
				
				pahAnVO = new PahAnVO();
				pahAnVO.setPahno(rs.getString("PAHNO"));
				pahAnVO.setPahname(rs.getString("PAHNAME"));
				pahAnVO.setPahintro(rs.getString("PAHINTRO"));
				pahAnVO.setPahcontent(rs.getString("PAHCONTENT"));
				pahAnVO.setPahprice(rs.getDouble("PAHPRICE"));
				pahAnVO.setPahcountry(rs.getString("PAHCOUNTRY"));
				pahAnVO.setPahnum(rs.getInt("PAHNUM"));
				pahAnVO.setPahstdate(rs.getDate("PAHSTDATE"));
				pahAnVO.setPahenddate(rs.getDate("PAHENDDATE"));
				pahAnVO.setPahdown(rs.getTimestamp("PAHDOWN"));
				pahAnVO.setPahstatus(rs.getInt("PAHSTATUS"));
				pahAnVO.setEmpno(rs.getString("EMPNO"));
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
		return pahAnVO;
	}
	
	@Override
	public List<String> getCountry() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> list = new ArrayList<String>();
	try {
			
		con = ds.getConnection();
		pstmt = con.prepareStatement(FIND_ONLY_COUNTRY);
		rs = pstmt.executeQuery();
		
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
					e.printStackTrace(System.err);
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();	
				}catch(SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if(con != null) {
				try {
					con.close();	
				}catch(SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}
	
	@Override
	public List<PahAnVO> getAll() {
		
		List<PahAnVO> list = new ArrayList<PahAnVO>();
		PahAnVO pahAnVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				pahAnVO = new PahAnVO();
				pahAnVO.setPahno(rs.getString("PAHNO"));
				pahAnVO.setPahname(rs.getString("PAHNAME"));
				pahAnVO.setPahintro(rs.getString("PAHINTRO"));
				pahAnVO.setPahcontent(rs.getString("PAHCONTENT"));
				pahAnVO.setPahprice(rs.getDouble("PAHPRICE"));
				pahAnVO.setPahcountry(rs.getString("PAHCOUNTRY"));
				pahAnVO.setPahnum(rs.getInt("PAHNUM"));
				pahAnVO.setPahstdate(rs.getDate("PAHSTDATE"));
				pahAnVO.setPahenddate(rs.getDate("PAHENDDATE"));
				pahAnVO.setPahdown(rs.getTimestamp("PAHDOWN"));
				pahAnVO.setPahstatus(rs.getInt("PAHSTATUS"));
//				pahAnVO.setPahpc1(rs.getBytes("PAHPC1"));
//				pahAnVO.setPahpc2(rs.getBytes("PAHPC2"));
//				pahAnVO.setPahpc3(rs.getBytes("PAHPC3"));
//				pahAnVO.setPahpc4(rs.getBytes("PAHPC4"));
//				pahAnVO.setPahpc5(rs.getBytes("PAHPC5"));
				pahAnVO.setEmpno(rs.getString("EMPNO"));
				list.add(pahAnVO);		
			}
			
		}catch(SQLException e) {
			throw new RuntimeException("A database error occured. "
					+ e.getMessage());
		}finally {
			if(rs != null) {
				try {
					rs.close();	
				}catch(SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();	
				}catch(SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if(con != null) {
				try {
					con.close();	
				}catch(SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	@Override
	public List<PahAnVO> findByCountry(String PAHCOUNTRY) {
		
		List<PahAnVO> list = new ArrayList<PahAnVO>();
		PahAnVO pahAnVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_COUNTRY);
			pstmt.setString(1, PAHCOUNTRY);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				pahAnVO = new PahAnVO();
				pahAnVO.setPahno(rs.getString("PAHNO"));
				pahAnVO.setPahname(rs.getString("PAHNAME"));
				pahAnVO.setPahintro(rs.getString("PAHINTRO"));
				pahAnVO.setPahcontent(rs.getString("PAHCONTENT"));
				pahAnVO.setPahprice(rs.getDouble("PAHPRICE"));
				pahAnVO.setPahcountry(rs.getString("PAHCOUNTRY"));
				pahAnVO.setPahnum(rs.getInt("PAHNUM"));
				pahAnVO.setPahstdate(rs.getDate("PAHSTDATE"));
				pahAnVO.setPahenddate(rs.getDate("PAHENDDATE"));
				pahAnVO.setPahdown(rs.getTimestamp("PAHDOWN"));
				pahAnVO.setPahstatus(rs.getInt("PAHSTATUS"));
//				pahAnVO.setPahpc1(rs.getBytes("PAHPC1"));
//				pahAnVO.setPahpc2(rs.getBytes("PAHPC2"));
//				pahAnVO.setPahpc3(rs.getBytes("PAHPC3"));
//				pahAnVO.setPahpc4(rs.getBytes("PAHPC4"));
//				pahAnVO.setPahpc5(rs.getBytes("PAHPC5"));
				pahAnVO.setEmpno(rs.getString("EMPNO"));
				list.add(pahAnVO);
			}
			
		}catch(SQLException e) {
			throw new RuntimeException("A database error occured. "
					+ e.getMessage());
		}finally {
			if(rs != null) {
				try {
					rs.close();					
				}catch(SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();					
				}catch(SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if(con != null) {
				try {
					con.close();					
				}catch(SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}	
		return list;
	}
	
	@Override
	public List<PahAnVO> findByPrice(Integer higher,Integer lower) {
		
		List<PahAnVO> list = new ArrayList<PahAnVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PahAnVO pahAnVO = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_PRICE);
			pstmt.setInt(1, higher);
			pstmt.setInt(2, lower);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				
				pahAnVO = new PahAnVO();
				pahAnVO.setPahno(rs.getString("PAHNO"));
				pahAnVO.setPahname(rs.getString("PAHNAME"));
				pahAnVO.setPahintro(rs.getString("PAHINTRO"));
				pahAnVO.setPahcontent(rs.getString("PAHCONTENT"));
				pahAnVO.setPahprice(rs.getDouble("PAHPRICE"));
				pahAnVO.setPahcountry(rs.getString("PAHCOUNTRY"));
				pahAnVO.setPahnum(rs.getInt("PAHNUM"));
				pahAnVO.setPahstdate(rs.getDate("PAHSTDATE"));
				pahAnVO.setPahenddate(rs.getDate("PAHENDDATE"));
				pahAnVO.setPahdown(rs.getTimestamp("PAHDOWN"));
				pahAnVO.setPahstatus(rs.getInt("PAHSTATUS"));
//				pahAnVO.setPahpc1(rs.getBytes("PAHPC1"));
//				pahAnVO.setPahpc2(rs.getBytes("PAHPC2"));
//				pahAnVO.setPahpc3(rs.getBytes("PAHPC3"));
//				pahAnVO.setPahpc4(rs.getBytes("PAHPC4"));
//				pahAnVO.setPahpc5(rs.getBytes("PAHPC5"));
				pahAnVO.setEmpno(rs.getString("EMPNO"));
				list.add(pahAnVO);
			}
			
		}catch(SQLException e) {
			throw new RuntimeException("A database error occured. "
					+ e.getMessage());
		}finally {
			if(rs != null) {
				try {
					rs.close();					
				}catch(SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();					
				}catch(SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if(con != null) {
				try {
					con.close();					
				}catch(SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	@Override
	public List<PahAnVO> findByDate(Date firstDate, Date lateDate) {
		List<PahAnVO> list = new ArrayList<PahAnVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PahAnVO pahAnVO = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_DATE);
			pstmt.setDate(1, firstDate);
			pstmt.setDate(2, lateDate);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				
				pahAnVO = new PahAnVO();
				pahAnVO.setPahno(rs.getString("PAHNO"));
				pahAnVO.setPahname(rs.getString("PAHNAME"));
				pahAnVO.setPahintro(rs.getString("PAHINTRO"));
				pahAnVO.setPahcontent(rs.getString("PAHCONTENT"));
				pahAnVO.setPahprice(rs.getDouble("PAHPRICE"));
				pahAnVO.setPahcountry(rs.getString("PAHCOUNTRY"));
				pahAnVO.setPahnum(rs.getInt("PAHNUM"));
				pahAnVO.setPahstdate(rs.getDate("PAHSTDATE"));
				pahAnVO.setPahenddate(rs.getDate("PAHENDDATE"));
				pahAnVO.setPahdown(rs.getTimestamp("PAHDOWN"));
				pahAnVO.setPahstatus(rs.getInt("PAHSTATUS"));
//				pahAnVO.setPahpc1(rs.getBytes("PAHPC1"));
//				pahAnVO.setPahpc2(rs.getBytes("PAHPC2"));
//				pahAnVO.setPahpc3(rs.getBytes("PAHPC3"));
//				pahAnVO.setPahpc4(rs.getBytes("PAHPC4"));
//				pahAnVO.setPahpc5(rs.getBytes("PAHPC5"));
				pahAnVO.setEmpno(rs.getString("EMPNO"));
				list.add(pahAnVO);
			}
			
		}catch(SQLException e) {
			throw new RuntimeException("A database error occured. "
					+ e.getMessage());
		}finally {
			if(rs != null) {
				try {
					rs.close();					
				}catch(SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();					
				}catch(SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if(con != null) {
				try {
					con.close();					
				}catch(SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}	
		return list;
	}

	//取得單一PK不同欄位照片byte[]資料
	@Override
	public byte[] findImage1ByPK(String pahno) { //取得同pk的第1格照片
		return findImages(pahno, GET_IMG_1);
	}

	@Override
	public byte[] findImage2ByPK(String pahno) {//取得同pk的第2格照片
		return findImages(pahno, GET_IMG_2);
	}

	@Override
	public byte[] findImage3ByPK(String pahno) {//取得同pk的第3格照片
		return findImages(pahno, GET_IMG_3);
	}

	@Override
	public byte[] findImage4ByPK(String pahno) {//取得同pk的第4格照片
		return findImages(pahno, GET_IMG_4);
	}

	@Override
	public byte[] findImage5ByPK(String pahno) {//取得同pk的第5格照片
		return findImages(pahno, GET_IMG_5);
	}
	
	private byte[] findImages (String pahno, String sql) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs  = null;
		byte[] image = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, pahno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				image = rs.getBytes(1);
			}
		}catch(SQLException e) {
			throw new RuntimeException("A database error occured. " + e.getMessage());
		}finally {
			if(rs != null) {
				try {
					rs.close();					
				}catch(SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();					
				}catch(SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if(con != null) {
				try {
					con.close();					
				}catch(SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return image;
	}

	@Override
	public List<PahAnVO> getAll(Map<String, String[]> map) {
		
		List<PahAnVO> list = new ArrayList<PahAnVO>();
		PahAnVO pahAnVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = ds.getConnection();
			
			String str = JDBC_Util_CompositeQuery_Pah.get_WhereCondition(map);
			System.out.println(str);
			
			final String GET_COMPOSITE = "SELECT * FROM PLANEHOTEL " + str + "ORDER BY PAHNO";
			
			pstmt = con.prepareStatement(GET_COMPOSITE);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				pahAnVO = new PahAnVO();
				pahAnVO.setPahno(rs.getString("PAHNO"));
				pahAnVO.setPahname(rs.getString("PAHNAME"));
				pahAnVO.setPahintro(rs.getString("PAHINTRO"));
				pahAnVO.setPahcontent(rs.getString("PAHCONTENT"));
				pahAnVO.setPahprice(rs.getDouble("PAHPRICE"));
				pahAnVO.setPahcountry(rs.getString("PAHCOUNTRY"));
				pahAnVO.setPahnum(rs.getInt("PAHNUM"));
				pahAnVO.setPahstdate(rs.getDate("PAHSTDATE"));
				pahAnVO.setPahenddate(rs.getDate("PAHENDDATE"));
				pahAnVO.setPahdown(rs.getTimestamp("PAHDOWN"));
				pahAnVO.setPahstatus(rs.getInt("PAHSTATUS"));
//				pahAnVO.setPahpc1(rs.getBytes("PAHPC1"));
//				pahAnVO.setPahpc2(rs.getBytes("PAHPC2"));
//				pahAnVO.setPahpc3(rs.getBytes("PAHPC3"));
//				pahAnVO.setPahpc4(rs.getBytes("PAHPC4"));
//				pahAnVO.setPahpc5(rs.getBytes("PAHPC5"));
				pahAnVO.setEmpno(rs.getString("EMPNO"));
				list.add(pahAnVO);		
			}
			
		}catch(SQLException e) {
			throw new RuntimeException("A database error occured. "
					+ e.getMessage());
		}finally {
			if(rs != null) {
				try {
					rs.close();	
				}catch(SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();	
				}catch(SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if(con != null) {
				try {
					con.close();	
				}catch(SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}
	
	//新增訂單修改商品數量與狀態用
	public final static String UPDATE_PAHNUM_STMT = "UPDATE PLANEHOTEL SET PAHNUM=?, PAHSTATUS=? WHERE PAHNO=?";
	
	@Override
	public void updatePahNum(String pahno, Integer pahnum, Integer pahstatus, Connection con) {

		PreparedStatement pstmt = null;
	
		try {	
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_PAHNUM_STMT);
			
			pstmt.setInt(1, pahnum);
			pstmt.setInt(2, pahstatus);
			pstmt.setString(3, pahno);
			
			pstmt.executeUpdate();

		}catch(SQLException e1) {
			if(con != null) {
				try {
					con.rollback();
				}catch(SQLException e2) {
					throw new RuntimeException("交易 rollback!" + e2.getMessage());
				}
			}
			throw new RuntimeException("A database error occured. " + e1.getMessage());
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch(SQLException e3) {
					e3.printStackTrace();
				}
			}
		}
	}
}
