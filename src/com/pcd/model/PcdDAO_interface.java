package com.pcd.model;

import java.util.List;
import java.util.Set;

import com.ptp.model.PtpVO;

public interface PcdDAO_interface {
	
	public void insert(PcdVO pcdVO);
    public void update(PcdVO pcdVO);
    public void delete(String pcdno);
    public Set<PcdVO> member_query(String memno);
    public PcdVO findByPrimaryKey(String pcdno);
    public List<PcdVO> getAll();
}
