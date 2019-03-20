package com.pac.model;

import java.util.List;
import java.util.Set;
import com.ptp.model.PtpVO;


public interface PacDAO_interface {
	public void insert(PacVO pacVO);
    public void update(PacVO pacVO);
    public void delete(String empno);
    public PacVO findByPrimaryKey(String pacno);
    public List<PacVO> getAll();
    public Set<PtpVO> getPtpsByPacno(String pacno);

}
