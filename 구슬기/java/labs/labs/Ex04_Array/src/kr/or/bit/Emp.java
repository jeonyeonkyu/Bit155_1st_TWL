package kr.or.bit;

//���赵....new �� ���ؼ� ����

public class Emp {
	private int empno;
	private String ename;
	
	public Emp() {}
	
	public Emp(int empno, String ename) {
		this.empno = empno;
		this.ename = ename;
	}
	
	//�ʿ��ϴٸ� setter, getter
	
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
	
	//�ʿ��ϴٸ� ���(�������)
	
	public void empInfoPrint() {
		System.out.println(this.empno + "/" + this.ename);
	}
	
	

}
