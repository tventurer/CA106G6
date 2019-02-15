package com.Faq.model;

import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class FaqDAO implements FaqDAO_Interface{

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		}catch(NamingException ne) {
			ne.printStackTrace();
		}
	}
	
	private static final String INSERT_STMT =
		"INSERT INTO FAQ (FAQNO, FAQCONTENT, FAQSTYLE, EMPNO) VALUES ('FAQ'||LPAD(TO_CHAR(FAQ_SEQ.NEXTVAL),6,'0'), ?, ?, ?)";
	private static final String UPDATE = 
		"UPDATE FAQ SET FAQCONTENT=?, FAQSTYLE=?, EMPNO=? WHERE FAQNO=?";
	private static final String DELETE = 
		"DELETE FROM FAQ WHERE FAQNO = ?";
	private static final String GET_ONE_STMT = 
		"SELECT FAQNO, FAQSTYLE, FAQCONTENT, EMPNO FROM FAQ ORDER BY FAQNO";
	private static final String GET_ALL_STMT = 
		"SELECT FAQNO, FAQSTYLE, FAQCONTENT, EMPNO FROM FAQ WHERE FAQNO = ?";
			
	@Override
	public void insert(FaqVO faqvo) {
		Connection con = null;
		PreparedStatement ptst = null;
		
		try {
			
			con = ds.getConnection();
			ptst = con.prepareStatement(INSERT_STMT);
			ptst.setString(1, faqvo.getFaqcontent());
			ptst.setInt(2, faqvo.getFaqstyle());
			ptst.setString(3, faqvo.getEmpno());
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
	public void update(FaqVO faqvo) {
		Connection con = null;
		PreparedStatement ptst = null;
		
		try {
			
			con = ds.getConnection();
			ptst = con.prepareStatement(UPDATE);
			ptst.setString(1, faqvo.getFaqcontent());
			ptst.setInt(2, faqvo.getFaqstyle());
			ptst.setString(3, faqvo.getEmpno());
			ptst.setString(4, faqvo.getFaqno());
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
	public void delete(String faqno) {
		Connection con = null;
		PreparedStatement ptst = null;
		
		try {
			con = ds.getConnection();
			ptst = con.prepareStatement(DELETE);
			ptst.setString(1, faqno);
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
	public FaqVO findOneByPK(String faqno) {
		Connection con = null;
		PreparedStatement ptst = null;
		ResultSet rs = null;
		FaqVO faqvo = null;
		
		try {
			con = ds.getConnection();
			ptst = con.prepareStatement(GET_ONE_STMT);
			ptst.setString(1, faqno);
			rs = ptst.executeQuery();
			
			while(rs.next()) {
				faqvo = new FaqVO();
				faqvo.setFaqno(rs.getString("FAQNO"));
				faqvo.setFaqcontent(rs.getString("FAQCONTENT"));
				faqvo.setFaqstyle(rs.getInt("FAQSTYLE"));
				faqvo.setEmpno(rs.getString("EMPNO"));
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
		return faqvo;
	}

	@Override
	public List<FaqVO> getall() {
		Connection con = null;
		PreparedStatement ptst = null;
		ResultSet rs = null;
		List<FaqVO> list = null;
		
		try {
			con = ds.getConnection();
			ptst = con.prepareStatement(GET_ALL_STMT);
			rs = ptst.executeQuery();
			
			while(rs.next()) {
				FaqVO faqvo = new FaqVO();
				faqvo.setFaqno(rs.getString("FAQNO"));
				faqvo.setFaqcontent(rs.getString("FAQCONTENT"));
				faqvo.setFaqstyle(rs.getInt("FAQSTYLE"));
				faqvo.setEmpno(rs.getString("EMPNO"));
				list.add(faqvo);
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
	
	
}
