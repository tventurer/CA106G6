package com.sme.model;

import java.util.List;

import com.sme.model.SmeVO;

public interface SmeDAO_interface {
	public void insert(SmeVO smeVO);
	public List<SmeVO> getAll();
}
