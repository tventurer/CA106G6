package com.tde.model;

import java.sql.Connection;
import java.util.List;

public interface TdeDAO_interface {
	
	void add(TdeVO tde);
	void update(TdeVO tde);
	void delete(String tdeno);
	TdeVO findByPk(String tdeno);
	List<TdeVO> findByTri(String trino);
	List<TdeVO> getAll();
	
	public void insert2(TdeVO tde, Connection con);
	
	//**********android專用
	List<String> getDays(String trino);
	//**********android專用
	List<String> getSpos(String trino, String tdedate);
}
