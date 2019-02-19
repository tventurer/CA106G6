package com.rtr.model;

import java.util.List;

public interface RtrDAO_interface {
	
	void add(RtrVO rtr);
	void update(RtrVO rtr);
	void delete(String rtrno);
	RtrVO findByPk(String rtrno);
	List<RtrVO> findByCdt(String rtrcon, String rtrcity, Integer rtrdays, Integer rtrpref);
	List<RtrVO> getAll();
}
