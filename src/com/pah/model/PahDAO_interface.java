package com.pah.model;

import java.util.List;
import java.util.Map;
import java.sql.Connection;
import java.sql.Date;

public interface PahDAO_interface {
	public void insert(PahVO pahVO);
	public void update(PahVO pahVO);
	public void delete(String pahno);
	public PahVO findOneByPk(String pahno);
	public List<PahVO> getall();
	public List<PahVO> getSelectAll(Map<String, String[]> map);
	public List<String> getCountry();
	public void sellPah(Integer sellNum, String pahno);
	public void updateStatus(Integer pahstatus, String pahno);
	public void decrease(String Pahno, Integer Pahnum, Integer Pahstatus,Connection con);
}
