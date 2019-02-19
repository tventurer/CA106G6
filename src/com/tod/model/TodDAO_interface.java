package com.tod.model;

import java.util.List;

public interface TodDAO_interface {
	
	void add(TodVO tod);
	void update(TodVO tod);
	void delete(String todno);
	TodVO findByPk(String todno);
	List<TodVO> getAll();
}
