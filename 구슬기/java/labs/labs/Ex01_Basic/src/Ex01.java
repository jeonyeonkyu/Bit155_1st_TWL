import kr.or.bit.Emp;

public class Ex01 {
	public static void main(String[]args) { 
		//System.out.println("Hello World"); 라인 주석
		Emp emp = new Emp();
		emp.empno = 1000;
		emp.ename = "홍길동";
		emp.job ="과장";
		//emp.data = 100;
		emp.setData(-12000);
		System.out.println(emp.getData());
		emp.getEmpInfo();
	
		
        Emp emp2 = new Emp();
        emp2.empno = 2000;
        emp2.ename = "김유신";
        emp2.job = "차장";
        emp2.getEmpInfo();
	}

}
