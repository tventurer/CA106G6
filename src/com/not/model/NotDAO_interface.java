package com.not.model;

import java.util.List;


public interface NotDAO_interface {
	public int insert(NotVO notVO);
	public int delete(String notVO);
	public NotVO findByPrimaryKey(String notno);
	public List<NotVO> findByMemno(String memno);
	public List<NotVO> getAll();
}
