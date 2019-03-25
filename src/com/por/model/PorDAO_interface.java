package com.por.model;

import java.util.*;

public interface PorDAO_interface {
	public void insert(PorVO porVO);
    public void update(PorVO porVO);
    public void updatePorlogistics(PorVO porVO);
    public void updatePorBuyTime(PorVO porVO);
    public void updatePorSellTime(PorVO porVO);
    public void updatePorStatusTime(PorVO porVO);
    public void delete(String porid);
    public PorVO findByPrimaryKey(String porid);
    public List<PorVO> getAll();
    public List<PorVO> getPurAll(String purid);
    public List<PorVO> getMemAllPor(String memno);
    public Integer getSellScore(String buymemno);//買家平均分數
    public Integer getBuyScore(String sellmemno);//賣家平均分數

    //萬用複合查詢(傳入參數型態Map)(回傳List)
//  public List<PorVO> getAll(Map<String, String[]> map); 
}
