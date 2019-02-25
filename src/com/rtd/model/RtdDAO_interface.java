package com.rtd.model;

import java.util.List;

public interface RtdDAO_interface {
	
	void add(RtdVO rtd);
	void update(RtdVO rtd);
	void delete(String rtdno);
	RtdVO findByPk(String rtdno);
	List<RtdVO> findByRtr(String rtrno);
	List<RtdVO> getAll();
}
