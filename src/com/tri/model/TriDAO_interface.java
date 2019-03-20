package com.tri.model;

import java.util.List;

import com.tde.model.TdeVO;

public interface TriDAO_interface {
	
	void add(TriVO trip);
	void update(TriVO trip);
	void delete(String trino);
	TriVO findByPk(String trino);
	TriVO findByTriname(String triname);
	List<TriVO> findByMemno(String memno);
	List<TriVO> findByTristat(int tristat);
	List<TriVO> getAll();
	
	
	public void insertWithTdes(TriVO trivo, List<TdeVO> tdeVOList);
}
