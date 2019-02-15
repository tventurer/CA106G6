package com.spo.model;

import java.util.List;

public interface SpoDAO_interface {
	
	void add(SpoVO spot);
	void update(SpoVO spot);
	void delete(String spono);
	SpoVO findByPk(String spono);
	List<SpoVO> findByCity(String spocity);
	List<SpoVO> findByClass(String spoclass);
	List<SpoVO> getAll();
}
