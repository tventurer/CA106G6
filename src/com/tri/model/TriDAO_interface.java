package com.tri.model;

import java.util.List;

public interface TriDAO_interface {
	
	void add(TriVO trip);
	void update(TriVO trip);
	void delete(String trino);
	TriVO findByPk(String trino);
	List<TriVO> getAll();
}
