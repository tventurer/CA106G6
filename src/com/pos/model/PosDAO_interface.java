package com.pos.model;

import java.util.List;

public interface PosDAO_interface {
	public String insert(PosVO posvo);
	public int delete(String posno);
	public int update(PosVO posvo);
	public PosVO findByPrimaryKey(String posno);
	public List<PosVO> getAll();
}