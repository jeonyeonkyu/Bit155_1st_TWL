package DTO;


//Dept 클래스는 (DTO, VO , DOMAIN)
//DB 테이블과 1:1 매핑
//DEPT 테이블의 데이터를 1건 담을 수 있는 클래스
//Dept dept = new Dept();  1건 담는 거임.
//List<Dept> deptlist = new ArrayList<Dept>();  여러건 담기 

public class Dept {   //Dept 테이블의 컬럼명쓴거.
	private int deptno;
	private String dname;
	private String loc;

	
	public int getDeptno() {
		return deptno;
	}
	
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	
	@Override
	public String toString() {
		return "Dept [deptno=" + deptno + ", dname=" + dname + ", loc=" + loc + "]";
	}
	
	
}
