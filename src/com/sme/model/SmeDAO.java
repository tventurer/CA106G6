package com.sme.model;

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

public class SmeDAO implements SmeDAO_interface{

	private static final String INSERT_STMT = "INSERT INTO SALES_MESSAGE(smeno, memno, empno, smecon, smetime, smefrom) VALUES('SME'||LPAD(to_char(seq_sme_smeno.nextval), 6 , 0), ?, ?, ?, CURRENT_TIMESTAMP,?)"; //current_timestamp或是sysdate
	private static final String GET_ALL_STMT = "SELECT * FROM SALES_MESSAGE";
	
	private static DataSource ds ;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/TV");
		}catch(NamingException ne) {
			ne.printStackTrace();
		}
	}
	
	@Override
	public void insert(SmeVO smeVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {

			con = ds.getConnection(); 
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, smeVO.getMemno());
			pstmt.setString(2, smeVO.getEmpno());
			pstmt.setString(3, smeVO.getSmecon());
			pstmt.setInt(4, smeVO.getSmefrom());
			
			pstmt.executeUpdate();

		}catch(SQLException sqle) {
			throw new RuntimeException("A database error occured." + sqle.getMessage()); 
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch(SQLException sqle) {
					sqle.printStackTrace(System.err);
				}
			}
			if(con != null) {
				try {
					con.close();
				}catch(SQLException sqle) {
					sqle.printStackTrace(System.err);
				}
			}
		}
	}


	
	
	@Override
	public List<SmeVO> getAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<SmeVO> list = new ArrayList<>();
		SmeVO smeVO = null;
		
		try {

			con = ds.getConnection(); 
			pstmt = con.prepareStatement(GET_ALL_STMT);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				smeVO = new SmeVO();
				smeVO.setSmeno(rs.getString(1));
				smeVO.setMemno(rs.getString(2));
				smeVO.setEmpno(rs.getString(3));
				smeVO.setSmecon(rs.getString(4));
				smeVO.setSmetime(rs.getTimestamp(5));
				list.add(smeVO);
			}
			
		}catch(SQLException sqle) {
			throw new RuntimeException("A database error occured." + sqle.getMessage()); 
		}finally {
			if(rs != null) {
				try {
					rs.close();
				}catch(SQLException sqle) {
					sqle.printStackTrace(System.err);
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch(SQLException sqle) {
					sqle.printStackTrace(System.err);
				}
			}
			if(con != null) {
				try {
					con.close();
				}catch(SQLException sqle) {
					sqle.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

}
