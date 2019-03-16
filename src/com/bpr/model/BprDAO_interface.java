package com.bpr.model;

import java.util.List;

public interface BprDAO_interface {
	public int insert(BprVO bprvo);
	public int delete(String bprno);
	public int update(BprVO bprvo);
	public BprVO findByPrimaryKey(String bprno);
	public List<BprVO> getAll();
}
