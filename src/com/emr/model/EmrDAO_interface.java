package com.emr.model;

import java.util.List;

public interface EmrDAO_interface {
	public void insert(EmrVO emrVO);
	public void update(EmrVO emrVO);
	public void delete(String empno);
	public EmrVO findByPrimaryKey(String empno);
	public List<EmrVO> getAll();
}
