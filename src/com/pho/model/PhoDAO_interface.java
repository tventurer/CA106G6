package com.pho.model;

import java.util.List;

import com.phd.model.*;

public interface PhoDAO_interface {
	public void insertWithDetail(PhoVO Phovo, List<PhdVO> phdList);
	public void update(PhoVO Phovo);
	public void delete(String PHONO);
	public PhoVO findByPrimaryKey(String PHONO);
	public List<PhoVO> getall();
	public List<PhoVO> getmeorder(String MEMNO);
	public void changeStatus(Integer phostatus, String phomark, String phono);
	public void refundPah(List<PhdVO> phdlist, Integer phostatus, String phomark, String phono);
	
	//**********android使用
//	public String addWithPhoList(PhoListVO phoListVO, List<PhdVO> phdVOList);
//	public List<PhoListVO> getall(String memno, String start, String end);
}
