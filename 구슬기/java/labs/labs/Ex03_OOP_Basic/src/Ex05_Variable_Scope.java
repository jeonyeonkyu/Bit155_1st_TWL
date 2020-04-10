/*
 **instance variable >> class Car {public String color;}
 **local variable >> class Car {public void move (){int speed}}
 main 함수 안에 있는 모든 변수는 :local variable >>초기화 해야하는 것
 static variable >>공유자원(객체간),,객체생성 이전에 memory에 올라가는 자원
 */
class Variable{
	int iv;
	/*
	 1. member field , instance variable 
	 2. Variable v = new Variable(); heap메모리에 iv 생성
	    Variable v2 = new Variable(); heap 메모리에 iv 또 생성...
	 3. 얘를 만드는 목적 : 정보를 담으려고 함(정보에 맞는 Type을 설정해줘야함)
	    -정보(속성) >> 고유정보 , 상태정보 , 부품정보(참조)
	    -정보는 생성되는 객체마다 다른 값을 가질 수 있다. ex)Variable 이 20-30개가 되었을때 iv 는 값이 다 다르게 할수있다.
	    -그렇기 때문에 굳이 초기화를 하지 않는다. 
	    -기본적으로 default 값: int>> 0, float >> o.o , boolean >> false, String >> null, 참조타입 >> null
	 4. 생성시점 : new 라는 연산자를 통해서 heap에 객체가 만들어지고 나서 바로 변수가 생성됩니다. Variable 생기고 iv 변수 생김.   
	 */
	
	static int cv;
	/*
	 1. class Variable (클래스 변수), static variable(공유(객체간) 변수)
	 2. 목적 : 정보를 담는 것  *****짱 중요함. (생성되는 모든 객체가 공유하는 자원) 그래서! 객체간 공유자원
	    heap 이라고 하는 영역에 생성된 객체들의 공통자원(공유자원)
	 3. 특징 : 접근방법이 독특하다 >> 클래스이름.static변수명 (객체가 만들어 지지 않은 상황에서도 접근이 가능)
	    ex) Math.Random() >> 사용하기 위해서>> Math m = new Math() >> m.Randaom() 을 하지 않음
	               접근 방법 >> 누구의 것도 아니기에 >> 참조변수.static변수명     으로도 접근가능함 
	    ex) Variable v = new Variable();
	        Variable v2 = new Variable();
	        1.variable.cv 클래스 이름으로 접근
	        2.v.cv        참조주소로 접근
	        3.v2.cv       이렇게 세가지 방법으로 접근가능
	  
	  
	  
	  
	       class Hello {public static void main(String[] args){ syso...}}
	  4.  생성시점 : Hello.java > javac Hello.java > Hello.class
	              >java.exe Hello 엔터 실행..
	              >class loader System 에 의해서
	                            클래스를 정보(metadata :설명 (언어를 해석하는언어)) class area(method area) 올려요
	              -- 이 클래스는 언제 만들었고 어떤 자원을 import 하고 있고     변수 몇개고...이런것들을 기술하는 것.
	              -- 이 클래서 안에 static variable 또는 static method 가 있으면
	              --이 녀석을 memory(class ==method area)에 올려 놓는다.
	              분석하고 올리다가 static variable 또는 static method 가 있으면 이녀석을 class memory 에 올린다.
	                       
	 */
	void method() {
		int lv = 0;
		/*
		  local variable (함수 안에 있는 지역변수 : 사용전에 반드시 초기화를 해야함)
		  생명주기: 함수가 호출되면 생성되었다가 함수가 끝나면 같이 죽는당. 운명공동체
		  *함수 안에는 제어문 
		  for(int i ....)>> i 변수는 for이 실행되면 생성... for 이 끝나면 소멸
		  --이런걸 블럭변수라고 함.
		 */
	}
}


public class Ex05_Variable_Scope {

	public static void main(String[] args) {
		Variable.cv = 100;
		Variable v = new Variable();
	

	}

}
