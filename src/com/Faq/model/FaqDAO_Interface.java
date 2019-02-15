package com.Faq.model;

import java.util.List;

public interface FaqDAO_Interface {
	public void insert(FaqVO faqvo);
	public void update(FaqVO faqvo);
	public void delete(String faqno);
	public FaqVO findOneByPK(String faqno);
	public List<FaqVO> getall();
}
