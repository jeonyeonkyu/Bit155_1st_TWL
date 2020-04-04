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

	@Override  //가지고 있는 멤버필드를 보여주는 toString 이 되었다.
	public String toString() {
		return "Emp [empno=" + empno + ", ename=" + ename + "]";
	}
	
    //toString() 함수 주인은 object
	//상속관계에서 ....toString()내멋대로 바꿔쓸꺼다.
	//object >> private String toString()  접근이 안된다.
	//object >> public String toString()   필요하다면 재정의해. 
	//즉, 상위클래스에서 public 을 쓴다면 "필요할때 재정의 해"  아니면 private 해줘야함.
	
//	@Override
//	public String toString() {
//		// TODO Auto-generated method stub
//		return "내마음이야"; //Object 가 가지는 함수를 재정의 한거.
//	}
	
	
	
	
	

}





