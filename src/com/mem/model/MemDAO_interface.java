package com.mem.model;

import java.util.List;

public interface MemDAO_interface {
	public int insert(MemVO memVO);
	public int update(MemVO memVO);
	public MemVO findByPrimaryKey(String memno);
	public List<MemVO> getAll();
}