package com.emp.model;

import java.util.List;

public interface EmpDAO_interface {
	public void insert(EmpVO empVO);
	public void update(EmpVO empVO);
	public void delete(String empno);
	public EmpVO findByPrimaryKey(String empno);
	public List<EmpVO> getAll();
}
