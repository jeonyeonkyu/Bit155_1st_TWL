package kr.or.bit;



//vo, dto, domain 통칭  ... 이런 클래스 (데이터 담는 클래스) 사원정보 담은 클래스~
public class CopyEmp {
	private int empno;
	private String ename;
	private int sal;
	
	public CopyEmp(int empno, String ename, int sal) {
		super();
		this.empno = empno;
		this.ename = ename;
		this.sal = sal;
	}
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
	public int getSal() {
		return sal;
	}
	public void setSal(int sal) {
		this.sal = sal;
	}
	@Override
	public String toString() {
		return "Emp [empno=" + empno + ", ename=" + ename + ", sal=" + sal + "]";
	}
	
	
	

}
