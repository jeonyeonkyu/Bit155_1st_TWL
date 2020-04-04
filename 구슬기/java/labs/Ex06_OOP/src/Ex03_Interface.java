/*
추상 클래스 : 인터페이스 (일상세계에 존재하는 표준, 약속, 규칙, 규약 을 만드는 행위)

 
 ISO직무표준..이라는게 있따. 서류처리의 방법, 라벨지 크기..글자체..라벨지사서 연도를 부착해 등등.. ISO를 잘지키면 정부가 연말에 보너스를 준다.  
 이걸 지켰을때 정부가 얻는 이점이 뭘까? 정부입장에서 검사하기가 수월해진다. 
 프로젝트할때 인터페이스 의 유무차이는 굉장히 크다. ex 유지보수 등 
 
 현실세계의 인터페이스 얘기는? 이거 인터페이스 좋은데? 이런거.. 표준화된 인터페이스..번호 나열이 1~9 까지 되어있다거나..
 우리는 만들어진인터페이스를 사용할거임. 어떻게 적용할지를 고민해보자.  사용법에 초점을 맞추자!
 
 
 ----공통점----
1. 스스로 객체 생성 불가능( new 연산자 사용 불가능)
추상클래스 (미완성), 인터페이스(모든것이 추상자원:약속만 있고 약속을 구현하지는 않는다.)

2.상속(extends), 구현(implements)을 통해서만 [사용가능 ==(heap메모리에 적재가능)]

3. [재정의를 통한 강제적 구현이 목적]이다.  추상은 일부는 구현되있고 일부만 완성하는거지만, 인터페이스는 모든것.

 ----다른점----
1. 인터페이스는 다중 구현 가능 하다. (약속(표준) 최대한 작게 만들어요, 작은약속 티끌모아 큰약속으로 만든다. 그러다보니 다중이된다)   //상속은 계층적 대물림이지만 유일하게 인터페이스는 다중구현이 가능하다.  
    class Test extends Object implements Ia, Ib, Ic   <<--이게 바로 약속을 모아모아서 크게한다. 

2. 추상클래스는 단일 상속 원칙(원칙대로 계층적 상속을 통해서 여러개 받기가능)    

3. 추상클래스 완성된 코드 + 미완성코드

4. 인터페이스는 상수를 제외한 나머지는 모두 미완성(추상) JDK version8 (Default 값, Static 구현)은 되는데 원칙적으로 현 개발자들은 추상자원을 100%가진 인터페이스를 만든다.


 
 
 인터페이스 : 소프트웨어 설계 최상위 단계
 어떤 프로젝트를 진행....
 쇼핑몰 정의 ... 
 
 **개발자(초급) **
 1. 인터페이스를 [다형성]입장으로 접근(인터페이스 부모타입)
 2. 서로 연관성이 없는 클래스를 하나로 묶어주는 기능을 하는 측면에서 바라보자. (부모를 동일하게 만들자)
 3. 인터페이스는 만들지 않아도 JAVA API 가 거의 제공하고 있다... 자바가 이미 만들어놓은거 사용만해도 충분히 개발이 가능하다.
 4. 인터페이스는 (~able) : 날 수 있는, 수리 할 수 있는(설계)
 5. 객체간의 연결 고리 (객체 소통 역할)
 
 
 소프트웨어 설계
 1. 개발단계의 최상위 >> 요구사항 >> 설계(고려 인터페이스)
 2. 설계 표준 >> 강제 이해(구현)...>> 재정의
 
 Interface
 1.실제 구현부가 없다. : 실행블럭이 없다 : 약속(시스템에서 이동: move, 좌표값 받자...)
                                  void move(int x, int y); 추상 메서드
 JavaAPI  (개발에 필요한 수 많은 인터페이스를 설계: 인터페이스를 기반으로 생성된 클래스...)
 >>Collection (동적배열)  >>Vector, ArrayList, HastSet , HashMap
 >>여러개의 interface 구현..
 
                                  
 생성방법(구현이 목적인 애들이라서 public)
 1. 상수  (final) : public static final int VERSION =1; >> [public static final]이걸 생략하고 >> int VERSION =1;  디폴트 생성자로 착각하면안된다!!!!!!
 2. 함수(method) : public abstract void run(); >> [public abstract]얘도 이걸 생략 >> void run();
 3.             : String move(int x , int y); 이런식으루 생략!
 
 interface Ia{
 int VERSION=1; //public static final 생략
 void run();
 String move(int x, int y);
 }
 
 interface Ia{void run();} //어떠한 내용을 갖고 있지않아도된다. 부모로서 쓰기 때문에.
interface Ib{};
interface Ic{}
//class Test extends object implements Ia, Ib , Ic{}  이게 풀어서 쓴거. 
class Test implements Ia , Ib , Ic{ //유일하게 인터페이스만 이렇게 다중상속도 가능하다. 

	@Override
	public void run() {
		// TODO Auto-generated method stub
		
	}
	
}
 */
interface Ia{
	int AGE =100; //public static final 이 생략되어있음
	String GENDER="남";
	
	String print(); //public abstract 생략
	void message(String str);  //public abstract
	
}
interface Ib{
	int AGE=10;  //public static final
	void info();  //public abstract
	String val(String s);  //public abstract
}

class Test2 extends Object implements Ia,Ib{

	@Override
	public String print() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void message(String str) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void info() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String val(String s) {
		// TODO Auto-generated method stub
		return null;
	}
	
}

public class Ex03_Interface {
	

	public static void main(String[] args) {
		Test2 t = new Test2();
		
		
		Ia ia = t; //다형성   인터페이스가 부모타입..
		System.out.println(ia.AGE);  //100
		
		Ib ib = t;
		System.out.println(ib.AGE);  //10

		
	}

}
