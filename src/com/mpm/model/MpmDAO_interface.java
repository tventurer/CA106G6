package com.mpm.model;

import java.util.List;

public interface MpmDAO_interface {
	public int insert(MpmVO mpmvo);
	public int delete(String mpmno);
	public int update(MpmVO mpmvo);
	public MpmVO findByPrimaryKey(String mpmno);
	public List<MpmVO> getAll();
}
