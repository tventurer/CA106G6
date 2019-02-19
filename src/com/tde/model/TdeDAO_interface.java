package com.tde.model;

import java.util.List;

public interface TdeDAO_interface {
	
	void add(TdeVO tde);
	void update(TdeVO tde);
	void delete(String tdeno);
	TdeVO findByPk(String tdeno);
	List<TdeVO> findByTri(String trino);
	List<TdeVO> getAll();
}
