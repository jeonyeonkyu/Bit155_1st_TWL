package kr.or.bit;


public class Emp {//public class Emp extends object
	private int empno;
	private String ename;
	
	//Public Emp() {}
	
	public Emp(int empno, String ename) {
		this.empno=empno;
		this.ename=ename;
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

	@Override  //������ �ִ� ����ʵ带 �����ִ� toString �� �Ǿ���.
	public String toString() {
		return "Emp [empno=" + empno + ", ename=" + ename + "]";
	}
	
    //toString() �Լ� ������ object
	//��Ӱ��迡�� ....toString()���ڴ�� �ٲ㾵����.
	//object >> private String toString()  ������ �ȵȴ�.
	//object >> public String toString()   �ʿ��ϴٸ� ��������. 
	//��, ����Ŭ�������� public �� ���ٸ� "�ʿ��Ҷ� ������ ��"  �ƴϸ� private �������.
	
//	@Override
//	public String toString() {
//		// TODO Auto-generated method stub
//		return "�������̾�"; //Object �� ������ �Լ��� ������ �Ѱ�.
//	}
	
	
	
	
	

}





