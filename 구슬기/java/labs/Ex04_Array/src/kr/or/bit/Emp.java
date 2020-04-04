package kr.or.bit;

//설계도....new 를 통해서 재사용

public class Emp {
	private int empno;
	private String ename;
	
	public Emp() {}
	
	public Emp(int empno, String ename) {
		this.empno = empno;
		this.ename = ename;
	}
	
	//필요하다면 setter, getter
	
	public int getEmpno() {
		return empno;
	}

	public void setEmpno(int empno) {
		this.empno = empno;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}
	
	//필요하다면 기능(정보출력)
	
	public void empInfoPrint() {
		System.out.println(this.empno + "/" + this.ename);
	}
	
	

}
