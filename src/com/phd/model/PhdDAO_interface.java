package com.phd.model;

import java.sql.Connection;
import java.util.List;

public interface PhdDAO_interface {
	public void insert(PhdVO phdvo, Connection con);
	public void delete(PhdVO phdvo);
	public List<PhdVO> findByPAHNO(String pahno);
	public List<PhdVO> findByPHONO(String phono);
	public List<PhdVO> getall();
}
