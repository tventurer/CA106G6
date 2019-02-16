package com.ema.model;

import java.util.List;

public interface EmaDAO_interface {
	public void insert(EmaVO emaVO);
	public void delete(String empno, String emrno);
	public void update(EmaVO emaVO);
	public EmaVO findByPrimaryKey(String empno, String emrno);
	public List<EmaVO> getAll();
}
