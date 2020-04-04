import java.util.ArrayList;

import kr.or.bit.CopyEmp;

class Product {
	int price;
	int bonuspoint;

	Product(int price) {
		this.price = price;
		this.bonuspoint = (int) (this.price / 10.0);
	}
}

class KtTv extends Product { 
	KtTv() {
		super(500); 
	}

	@Override
	public String toString() {
		return "KtTv"; 
	}

}

class Audio extends Product { 
	Audio() {
		super(100);
	}

	@Override
	public String toString() {
		return "Audio";
	}
}

class NoteBook extends Product { 
	NoteBook() {
		super(150);
	}

	@Override
	public String toString() {
		return "NoteBook";
	}
}
 class Emp {
	 int empno;
	 String ename;
	 String job;
	 
	 Emp(int empno, String ename, String job){
		 this.empno = empno;
		 this.ename = ename;
		 this.job =job;
	 }
	
	
 }
public class Ex07_Generic_Quiz {
	public static void main(String[] args) {
		System.out.println("------------------1--------------------");
		
		//1. Array 배열을 사용해서 cart 만들고 제품을 담으세요 (Tv, Audio, Notebook)
		Product[] Cart = {new NoteBook(),new Audio(),new KtTv()};
		
		System.out.println("------------------2--------------------");
		
		//2.ArrayList를 사용해서 cart를 만들고 제품을 담으세요. (Tv, Audio, Notebook)
		//단,generic 사용하세요
		//제품의 이름을 출력하세요
		ArrayList<Product> plist = new ArrayList<Product>();
		plist.add(new NoteBook());
		plist.add(new Audio());
		plist.add(new KtTv());
		System.out.println(plist.toString());
		
		System.out.println("------------------3--------------------");
		
		//3. Emp클래스를 사용해서 사원 3명을 만드세요. 
		//, 단 ArrayList<>를 사용하세요.
		ArrayList<Emp> elist = new ArrayList<Emp>();
		elist.add(new Emp(1,"홍","IT"));
		elist.add(new Emp(2,"길","IT"));
		elist.add(new Emp(3,"동","IT"));
		
		System.out.println("------------------4--------------------");
		
		//4. 사원의 정보(사번, 이름, 직종) 을 개선된 for문을 사용해서 출력하세요
		//toString 사용하지마세요.
		for(Emp e : elist) {
			System.out.println(e.empno +e.ename + e.job);
		}
		
		System.out.println("------------------5--------------------");
		
		//5. 사원의 정보(사번, 이름, 직종) 을 일반 for문을 사용해서 출력하세요
				//toString 사용하지마세요.
		for(int i = 0;i<elist.size();i++) {
			System.out.println(elist.get(i).empno +
					elist.get(i).ename+
					elist.get(i).job);
			
		}
		
		System.out.println("------------------6--------------------");
		
		// 6.CopyEmp 라는 클래스를 만드세요(Emp 와 같은데)
				// job member field 대신에 >>
				// private int sal; 로 바꾸어서 만드세요(getter ,setter 구현)
				// kr.or.bit.CopyEmp 로 하세요
				// ArrayList<> 제너릭 사용해서 사원 3명 만드세요
				// 아래 데이터 사용
				// 100,"김",1000
				// 200,"이",2000
				// 300,"박",3000
		ArrayList<CopyEmp> clist = new ArrayList<CopyEmp>();
		clist.add(new CopyEmp(100, "김", 1000));
		clist.add(new CopyEmp(200, "이", 2000));
		clist.add(new CopyEmp(300, "박", 3000));
		System.out.println(clist.toString());
		
		System.out.println("------------------7--------------------");
		
		// 7.200번 사원의 급여를 5000으로 수정해서 출력하세요(일반 for문 안에서 ....)
		//set 함수
		for(int i =0;i<clist.size();i++) {
			if(i==1) {
				clist.get(i).setSal(5000);
			}
			System.out.println(clist.get(i));
		}
		System.out.println("------------------7--------------------");
		//선생님답
		for(int i =0;i<clist.size();i++) {
			if(clist.get(i).getEmpno()==200) {
				clist.get(i).setSal(5000);
				System.out.println(clist.get(i).toString());
			}
		}
		System.out.println("------------------8--------------------");
				
		// 8.300번 사원의 이름을 "궁금해" 로 수정해서 출력하세요(개선된 for문 안에서 ....)
		//set 함수
		for(CopyEmp c : clist) {
			clist.get(2).setEname("궁금해");
			System.out.println(c);
		}
		//선생님답
		for(CopyEmp emp : clist) {
			if(emp.getEmpno()==300) {
				emp.setEname("궁금해");
				System.out.println(emp.toString());
			}
		}
	}

}
