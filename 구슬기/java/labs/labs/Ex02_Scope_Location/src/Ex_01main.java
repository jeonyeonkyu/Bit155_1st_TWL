import kr.or.bit.common.Car;

/*
 클래스 ==설계도 ==타입
 
 클래스 구성 요소 : [필드 + 함수]+ 생성자
 *필드(field)>> 고유정보 , 상태정보 , 참조(부품)정보 자원 >> 변수
 *함수(function) >>기능(행위 정보)
 *추가 생성자 >> 필드의 초기화를 목적으로 하는 함수
 *
 *
 *클래스 , 필드 ,생성자 ,함수 : 자신의 범위(영역)가 있어서 정의해야함 (접근자, 한정자, 수정자)
 *>> public, private, default ,protected ....
 *
 *
 1. public class Test{}

 2. class Test{} >> 컴파일러가 내부적으로 default 접근자를 붙여서 사용
 >>내부적으로 컴파일러가 실행하는 코드 : default class Test{}
 >>default 라는 접근자는 개발자가 직접 구현하지 않는다..
 >>** default 접근자는: [같은 폴더(package)에서 접근 가능 ], [다른 폴더에 있으면 서로 접근 불가]
 >>** default 접근자는: 같은 폴더 (package)내에서 [연습 목적]으로  

 3. 하나의 물리적인 자바파일은 여러개의 클래스를 가질 수 있다.(Test.java) (0)
    단 public 하나만 존재..나머지는 default 
 
 
 실습
 Src 폴더 >> Ex01_main
 kr.or.bit.common >> public Bitmain
 kr.or.bit.common >> public Car
 kr.or.bit.common >> (default) Car  //앞에 퍼블릭이 없는건 접근 금지. 안에서만 갖고 놀거야 하는거랑 똑같은거임
 
 
 	//프로젝트의 첫번째는 요구사항을 파악해야함
 	 * 1.요구사항 정의서(메뉴,게시판 로그인등)
 	 * 2.요구사항 명세
 	 * 문서작업하는 능력도 필요하다!
 	 * 
 	 * 이런걸 파악하다보면 누군 질문하는 개발자, 정리,정의하는 대변인 , 우린 클라이언트가 없어서 논의해서  만들어야한다.
 	 * 하나의 값으로 떨어지지 않으면 class Frame{}, Cpu cpu;등으로 뺀다.
 	 * 근데 Frame frame;프레임 타입의 프레임 Cpu cpu;씨피유타입의 씨피유 이렇게 해주어야함.
 
 */
//무조건 앞에 default 생략 되어 있다... 같은 폴더(패키지)내에서만 접근 가능, 다른 폴더에서는 접근 불가.

class Test{  //default test >>같은 폴더내에서만 사용가능
	int d_iv; //컴파일러가 자동으로 default int d_iv 로 해석함
	public int p_iv; //어디에서나 공유가능
	private int pri_iv; //개인적인 감추어진 숨김
}

public class Ex_01main {

	public static void main(String[] args) {
		Car car =new Car();
		//car.door= 10; 왜 kr.or.bit.common에 있는 카 안의 door 변수에 접근이 안될까. default 변수 이기때문에 안됨 
		//kr.or.bit.common.Person p = new Person();
		
		Test t = new Test();
		t.d_iv = 100; //default
		t.p_iv = 200; //public
		//private 자원접근 불가
		
		
	}

}
