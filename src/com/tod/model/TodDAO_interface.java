package com.tod.model;

import java.util.List;

public interface TodDAO_interface {
	
	void add(TodVO tod);
	void update(TodVO tod);
	void delete(String todno);
	TodVO findByPk(String todno);
	TodVO findByTrino(String trino);
	List<TodVO> findByTodstat(int todstat);
	List<TodVO> getAll();
	
	//以下為購買用方法
	void todBuy(TodVO tod);
}
