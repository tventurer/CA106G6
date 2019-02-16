package com.pac.model;

import java.util.List;


public interface PacDAO_interface {
	public void insert(PacVO pacVO);
    public void update(PacVO pacVO);
    public void delete(String empno);
    public PacVO findByPrimaryKey(String pacno);
    public List<PacVO> getAll();

}
