package com.pre.model;

import java.util.*;

public interface PreDAO_interface {
	public void insert(PreVO preVO);
    public void update(PreVO preVO);
    public void updatePreresult(PreVO preVO);
    public void delete(String preid);
    public PreVO findByPrimaryKey(String preid);
    public List<PreVO> getAll();
    //萬用複合查詢(傳入參數型態Map)(回傳List)
//  public List<PreVO> getAll(Map<String, String[]> map); 
}
