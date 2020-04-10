import java.util.ArrayList;

import kr.or.bit.Emp;

public class Ex03_ArrayList_object {

	public static void main(String[] args) {
		
		//사원 1명을 만드세요
		Emp emp = new Emp(100,"김유신","군인");
		System.out.println(emp.toString()); 
		
		
		//Array   (고정배열, 정적배열)
		//사원 2명 만드세요.
		Emp[] emplist = {new Emp(100,"김씨","일반인"),new Emp(200,"박씨","학생")};
		for(Emp e : emplist) {
			System.out.println(e.toString());
		}
		
		//한명이 입사를 더햇네요? 추가하세요 . 
		//기존 배열로는 추가를못하고 아예 새로 만들어야한다. 
		
		//Collection
		ArrayList list = new ArrayList();
		list.add(new Emp(1,"강","IT"));
		list.add(new Emp(2,"홍","IT"));
		
		System.out.println(list); 
		//[Emp [empno=1, ename=강, job=IT], Emp [empno=2, ename=홍, job=IT]]  오버라이딩 되어서 이게 나온다.
		//System.out.println(list);   == System.out.println(list.toStinrg()); 
		// [xx번지.toString(); , yy번지.toString()] 오버라이딩 안되어있으면 주소.
		
		System.out.println(list.get(0)); // Emp [empno=1, ename=강, job=IT]
		
		
		//toString 을 활용하지 말고 사원 출력해보세요.
		//일반 for문으로
		for(int i =0; i<list.size();i++) {
			//list.get(i)   이럼 전체가 다나온당
		//	Object obj = list.get(i);
	//obj 안에 Emp 의 주소가 들어있다. 
			Emp e = (Emp)list.get(i);  //부모타입을 자식타입으로 가려면 자식타입에 맞게 캐스팅 해야한다. 
			System.out.println(e.getEmpno()+ "/"+e.getEname()+"/"+e.getJob());
			
 		}
		
		System.out.println("--------------------------");
		
		//toString 사용하지 말고 개선된 for문으로 출력해보세요.
		//짜증..캐스팅을 계속 ...다운캐스팅에 다형성에....
		for(Object j : list) {
			Emp e = (Emp)j;
			System.out.println(e.getEmpno()+ "/"+e.getEname()+"/"+e.getJob());
		}
		
		
		System.out.println("---------제너릭----------");
		//제너릭... (타입을 강제해주기)   이거면 좀 편하겠니??
		
		//Object 불편함.. generic
		ArrayList<Emp> list2 = new ArrayList<Emp>(); //내가 가지는 방의 타입은 Emp 타입 이야!!!
		list2.add(new Emp(1,"A","IT"));
		list2.add(new Emp(2,"B","IT"));
		//list2.add(10);  얜 되지도 않음
		
		for( Emp e : list2) {
			System.out.println(e.getEmpno()+ "/"+e.getEname()+"/"+e.getJob());
		}
		
		System.out.println("----------신입사원 추가-----------");
		
		//그래서 추가 입사는 이렇게 하면 끝!
		list2.add(new Emp(3,"NEW","NEW"));   
		System.out.println(list2); // [Emp [empno=1, ename=A, job=IT], Emp [empno=2, ename=B, job=IT], Emp [empno=3, ename=NEW, job=NEW]]
		//System.out.println(list2.toString());
		
		
		

	}

}
