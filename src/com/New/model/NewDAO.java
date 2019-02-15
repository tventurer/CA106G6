package com.New.model;

import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class NewDAO implements NewDAO_interface{

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	
	private static final String INSERT_STMT = 
		"INSERT INTO NEWS (NEWNO, NEWCONTENT, NEWSTDATE, NEWENDDATE, NEWPC1, NEWPC2, EMPNO) VALUES ('NEW'||LPAD(TO_CHAR(NEWS_SEQ.NEXTVAL),6,'0'),?,?,?,?,?,?)";
	private static final String GET_ALL_STMT = 
		"";
	private static final String GET_ONE_STMT = 
		"";
	private static final String DELETE = 
		"";
	private static final String UPDATE = 
		"";
	
	
	
	@Override
	public void insert(NewVO newsvo) {
		
	}

	@Override
	public void update(NewVO newsvo) {
		
	}

	@Override
	public void delete(String newno) {
		
	}

	@Override
	public NewVO findOneByPK(String newno) {
		return null;
	}

	@Override
	public List<NewVO> getall() {
		return null;
	}

}
