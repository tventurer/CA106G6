package com.ptp.model;

import java.util.List;


public interface PtpDAO_interface {
	
		public void insert(PtpVO ptpVO);
	    public void update(PtpVO ptpVO);
	    public void delete(String ptpno);
	    public PtpVO findByPrimaryKey(String ptpno);
	    public List<PtpVO> getAll();

	}

	

