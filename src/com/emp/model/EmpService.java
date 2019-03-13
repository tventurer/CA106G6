package com.emp.model;

import java.util.List;

public class EmpService {
	
	private EmpDAO_interface dao; //有多型傳值安全，但為什麼一個介面對一個類別也需要?
	
	public EmpService() {
		dao = new EmpDAO();
	}
	
	public EmpVO addEmp(String empname, String emppwd, Integer empgen, String empphone, String empcell,
			            String empmail, String empdept, String empposi, Integer empsal,
			            java.sql.Date empdoe, byte[] emppic) {
		EmpVO empVO = new EmpVO();
		
		empVO.setEmpname(empname);
		empVO.setEmppwd(emppwd);
		empVO.setEmpgen(empgen);
		empVO.setEmpphone(empphone);
		empVO.setEmpcell(empcell);
		empVO.setEmpmail(empmail);
		empVO.setEmpdept(empdept);
		empVO.setEmpposi(empposi);
		empVO.setEmpsal(empsal);
		empVO.setEmpdoe(empdoe);
		empVO.setEmppic(emppic);
		dao.insert(empVO);
		
		return empVO;
	}
	
	public EmpVO updateEmp(String empno, String empname, String emppwd, Integer empgen, String empphone,
			               String empcell, String empmail, String empdept, String empposi, Integer empsal,
                           java.sql.Date empdoe, byte[] emppic) {
		EmpVO empVO = new EmpVO();
		
		empVO.setEmpno(empno);
		empVO.setEmpname(empname);
		empVO.setEmppwd(emppwd);
		empVO.setEmpgen(empgen);
		empVO.setEmpphone(empphone);
		empVO.setEmpcell(empcell);
		empVO.setEmpmail(empmail);
		empVO.setEmpdept(empdept);
		empVO.setEmpposi(empposi);
		empVO.setEmpsal(empsal);
		empVO.setEmpdoe(empdoe);
		empVO.setEmppic(emppic);
		dao.update(empVO);

		return empVO;
	}
	
	public void deleteEmp(String empno) {
		dao.delete(empno);
	}
	
	public EmpVO getOneEmp(String empno) {
		return dao.findByPrimaryKey(empno);
	}

	public List<EmpVO> getAll() {
		return dao.getAll();
	}
	
	public EmpVO checkIn(String empmail) {
		return dao.checkIn(empmail);
	}
	
	
	
}
