package com.pcd.model;

import java.util.List;

public interface PcdDAO_interface {
	
	public void insert(PcdVO pcdVO);
    public void update(PcdVO pcdVO);
    public void delete(String pcdno);
    public PcdVO findByPrimaryKey(String pcdno);
    public List<PcdVO> getAll();
}
