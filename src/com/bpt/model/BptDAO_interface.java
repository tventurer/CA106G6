package com.bpt.model;

import java.util.List;

public interface BptDAO_interface {
	public BptVO findByPrimaryKey(String tagno);
	public List<BptVO> getAll();
}
