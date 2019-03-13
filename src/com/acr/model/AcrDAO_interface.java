package com.acr.model;

import java.util.*;

public interface AcrDAO_interface {
	public void insert(AcrVO acrVO);
    public void update(AcrVO acrVO);
    public void delete(String acrid);
    public AcrVO findByPrimaryKey(String acrid);
    public List<AcrVO> getAll();
    public List<AcrVO> getMemAll(String memno);
    public Integer getMemacrtotal(String memno);
    //萬用複合查詢(傳入參數型態Map)(回傳List)
//  public List<AcrVO> getAll(Map<String, String[]> map); 
}
