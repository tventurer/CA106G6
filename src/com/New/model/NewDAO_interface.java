package com.New.model;

import java.util.List;

public interface NewDAO_interface {
	public void insert (NewVO newsvo);
	public void update (NewVO newsvo);
	public void delete (String newno);
	public NewVO findOneByPK(String newno);
	public List<NewVO> getall();
}
