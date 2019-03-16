package com.bpc.model;

import java.util.List;

public interface BpcDAO_interface {
	public int insert(BpcVO bpcVO);
	public int delete(String bpcno);
	public int update(BpcVO bpcVO);
	public BpcVO findByPrimaryKey(String bpcno);
	public List<BpcVO> getAll();
}
