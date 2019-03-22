package com.pur.model;

import java.util.*;


public interface PurDAO_interface {
	public void insert(PurVO purVO);
    public void update(PurVO purVO);
    public void updatePurSell(PurVO purVO);
    public void updatePurstatus(PurVO purVO);
    public void delete(String purid,Integer purstatus);
    public PurVO findByPrimaryKey(String purid);
    public List<PurVO> getAll();
    public List<PurVO> getMemAll(String memno);
    public List<PurVO> getSortAll(Integer pursort);
    public List<String> getTimeAndDown(String starttime,String endtime);
    //萬用複合查詢(傳入參數型態Map)(回傳List)
//  public List<PurVO> getAll(Map<String, String[]> map); 
}
