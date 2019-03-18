package android.com.pah.model;

import java.sql.Clob;
import java.sql.Date;
import java.sql.Timestamp;

public class PahAnVO implements java.io.Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private String pahno;
    private String pahname;
    private String pahintro;
    private String pahcontent;
    private Double pahprice;
    private String pahcountry;
    private Integer pahnum;
    private Date pahstdate;
    private Date pahenddate;
	private Timestamp pahdown;
    private Integer pahstatus;
    private String empno;
    
    public PahAnVO() {
    	super();
    }
    //下面兩個建構子專給PhoPahVO使用
    public PahAnVO(String pahno, String pahname, String pahintro, String pahcontent, Double pahprice,
			       String pahcountry, Integer pahnum, java.sql.Date pahstdate, java.sql.Date pahenddate, Timestamp pahdown,
			       Integer pahstatus, String empno) {
    	this.pahno = pahno;
    	this.pahname = pahname;
    	this.pahintro = pahintro;
    	this.pahcontent = pahcontent;
    	this.pahprice = pahprice;
    	this.pahcountry = pahcountry;
    	this.pahnum = pahnum;
    	this.pahstdate = pahstdate;
    	this.pahenddate = pahenddate;
    	this.pahdown = pahdown;
    	this.pahstatus = pahstatus;
    	this.empno = empno;
    }
    
    public PahAnVO(PahAnVO pahAnVO) {
    	this.pahno = pahAnVO.getPahno();
    	this.pahname = pahAnVO.getPahname();
    	this.pahintro = pahAnVO.getPahintro();
    	this.pahcontent = pahAnVO.getPahcontent();
    	this.pahprice = pahAnVO.getPahprice();
    	this.pahcountry = pahAnVO.getPahcountry();
    	this.pahnum = pahAnVO.getPahnum();
    	this.pahstdate = pahAnVO.getPahstdate();
    	this.pahenddate = pahAnVO.getPahenddate();
    	this.pahdown = pahAnVO.getPahdown();
    	this.pahstatus = pahAnVO.getPahstatus();
    	this.empno = pahAnVO.getEmpno();
    }
    
	public String getPahno() {
		return pahno;
	}
	public void setPahno(String pahno) {
		this.pahno = pahno;
	}
	public String getPahname() {
		return pahname;
	}
	public void setPahname(String pahname) {
		this.pahname = pahname;
	}
	public String getPahintro() {
		return pahintro;
	}
	public void setPahintro(String pahintro) {
		this.pahintro = pahintro;
	}
	public String getPahcontent() {
		return pahcontent;
	}
	public void setPahcontent(String pahcontent) {
		this.pahcontent = pahcontent;
	}
	public Double getPahprice() {
		return pahprice;
	}
	public void setPahprice(Double pahprice) {
		this.pahprice = pahprice;
	}
	public String getPahcountry() {
		return pahcountry;
	}
	public void setPahcountry(String pahcountry) {
		this.pahcountry = pahcountry;
	}
	public Integer getPahnum() {
		return pahnum;
	}
	public void setPahnum(Integer pahnum) {
		this.pahnum = pahnum;
	}
	public Date getPahstdate() {
		return pahstdate;
	}
	public void setPahstdate(Date pahstdate) {
		this.pahstdate = pahstdate;
	}
    public Date getPahenddate() {
		return pahenddate;
	}
	public void setPahenddate(Date pahenddate) {
		this.pahenddate = pahenddate;
	}
	public Timestamp getPahdown() {
		return pahdown;
	}
	public void setPahdown(Timestamp pahdown) {
		this.pahdown = pahdown;
	}
	public Integer getPahstatus() {
		return pahstatus;
	}
	public void setPahstatus(Integer pahstatus) {
		this.pahstatus = pahstatus;
	}
	
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((pahno == null) ? 0 : pahno.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PahAnVO other = (PahAnVO) obj;
		if (pahno == null) {
			if (other.pahno != null)
				return false;
		} else if (!pahno.equals(other.pahno)) {
			return false;
		}
		return true;
	}
         
	
	
}

