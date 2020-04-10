package kr.or.bit;
/*
 기능 , 해위 만드는 방법
 함수(function)(method)
 
 함수(method) : 행위 또는 기능의 최소단위 >> [**하나의 기능 만 구현**]
 ex)먹는다, 걷는다 , 잔다...
 
 클래스 :  필드 +함수+생성자
 
 ex) 게임방 : 게임기 동전넣고... 함수형태
             인형뽀기 동전넣고 인형을 받는것  ...함수형태
             
 Java 함수 종류(4가지)
 1. void, parameter(0) : void print(String str) {실행코드}
 2. void, parameter(x) : void print(){실행코드}    //동전넣는 구멍이 없당
 3. return Type , parameter(0) : int print(int data) {return 100;}
 4. return Type , parameter(x) : int print(){return 100;}    
 
 void >> 돌려주는 것이 없다>> return value 없다
 return Type : 8가지 기본타입(byte car short int long float double boolean)      
               + String + 참조타입 + Array + Collection + Interface
ex) Car print(){ return new Car();}
ex) boolean print(){return true;}

 parameter (인자, 인수 ,매개값 , 전달값 ) : 게임기의 동전구멍이다.(동전 구멍1개, 여러개일수도 있다.)
 동전 구멍이 2개면 2개다 넣어야 실행됨. 동전구멍 열개다? 동전 열개 다 넣어야함. 하나라도 빠지면 안됨!
 ex) void print(int a, int b, int c, int d, int f....) >> print(10,20,30,40)네개 넣어서 실행 안됨.
                                                       >> print(10,20,20,10,10) 이건됨  만약 "A' 넣으면 안됨! int 가 아니라서.

함수의 이름은 : 관용적 표현   
의미있는 단어 조합
:getChnnelNumber(),getEmpListByEmpno()>>사번으로 직원리스트 가져와라 이런 내용. 이름으로 어느정도 유추가 가능하게 만들어야함.
함수 첫글자는 소문자. 클래스 앞글자는 대문자

함수라는 것은 반드시 호출(call)되어야만 실행된다.:누군가 그의 이름을 부르지 않으면 실행이 안된다. //main은 제외 알아서 됨.(static붙어있어서)


 */

public class Fclass {
	public int data; //instance variable
	
	//void m()
	public void m () { //컴파일러는 public 이 없을때 내부적으로 default void m 으로 해석한다.
		System.out.println("일반함수 : void, parameter(x)");
	}
	
	
	// void m(int..)
	public void m2(int i) {
		System.out.println("parameter valus (scope :함수내부) :" + i);
		System.out.println("일반함수 : void , parameter(0)");
	}
	
	public int m3() {
		return 100; //return type 있는 함수는 반드시 return 키워드를 사용해야함
	}
	
	public int m4(int data) {
		return data + 1;
	}
	//요기까지가 기본..
	//확장 
	public int sum(int i , int j, int k){
		return i + j + k;
	}
	
	//함수를 만들었는데
	//접근자 >> default int subSum()
	//다른 폴더(패키지)에서 사용할수없다.
	/*
	int subSum(int i) {
		return i+100;
	}
	*/
	//설계자의 의도 : subSum 함수의 활용은 내부에 다른 함수를 도와주는 함수를 만들겠다.
	//이것은 같은 폴더에 통용되지 않는다.
	//의도: subSum() 객체(참조변수)가 접근하지 못하게 하면서 내부에서만 사용.
	//private 접근자, 한정자
	//1. 클래스 내부에서는 의미가 없다. (( 같은 교실안에 누가 뭘들고 있던간에 다보임)
	//2. 참조변수(Fclas f = new Fclass()) f.private 볼수 없다.
	
	//subSum 이라는 함수는 [다른 함수를 보조하는 함수]다. 그래서 직접 호출 되어서는 안된다.
	//내부에서 다른 함수가 호출해서 사용된다. 이렇게사용하려면 private을 붙여야함.
	//private >다른 함수를 도와주는 함수다. 참조로서 다이렉트로 접근하는 함수는 아니다.
	//다른 함수가 사용하는 [공통 함수]
	
	private int subSum(int i) {
		return i + 100;
	}
	public void CallSubSum() {
		int result = subSum(100);
		System.out.println(result);
	}
	
	public void print(int data) {
		System.out.println("data : "+ data);

	}
	
	private int operationMethod(int data) {
		return data * 200;
	}
	
	public int opSum(int data) {
		int result = operationMethod(data);
		if(result > 0) {
			return 1;
		}else {
			return -1;
		}
	}
	
	//Quiz
	//a와 b 둘중에 큰값을 return 하는 함수를 만드세요
	//ex) max(500,300) return 값이 500 받게 하면 되요
	//public int max(int a , int b)
	
	/*
	 * 30점 짜리임 :return문은 반복적 사용을 좋아하지않음.
	public int max(int a, int b) {
		if(a > b) {
			return 500;
		}else {
			return 300;
		}
		
	 * 60점 짜리
	 * int result = 0;
	   if(a>b){
	   	  result = a;
		}else{
		   result = b;
		}
		return result;
		
	* 90점 짜리
	  int max = (a>b) ? a: b;
	  return max;
	  
	  100점 짜리
	  return (a > b) ? a: b;	
	  
	  삼항 연산자 쓰는 습관을 가지자.
	*/
	
	
	public int max(int a , int b) {
		return (a > b) ? a : b; 		
		}
	
	public String concat(String s ,String s1 , String s2) {
		//String result = s + "/" + s1 + "/" + s2;
		//return result;
		return s + "/" + s1 + "/" + s2;	
		
			 
	}
	//요기까지가 함수의 기본편
			//클래스는 타입이다...
			/*
			 public int call(int i, int j){return i + j;}
			 public Tv call(){}   //int 자리에 Tv 넣어도 당연하게 받아들여야한다. Type ==Class ==설계도 니까 타입인 int자리에 Tv 넣을수있음
			 
			 public TV tcall(){return new TV();} 
			 
			 1조 : return new TV(); // TV 타입과 같은 객체의 주소 를 넘기려고 메모리에 넣어서 만든거다.
			 2조 : TV t = new TV(); return t;
			 3조:
			 4조 :
			 5조 : return null;  //문법 적으로만 맞다. 
			 */
	public TV tcall(){return new TV();} 
	
	public TV tcall2(TV t , TV t2) {
		t.brandname = "A";
		t.ch = 99;
		return t;
	}
	public int tcall3(int i) {
		return i + 100;
	}
	
	/*
	 * Today point
	 * 클래스는 memory 에다가올려야 사용가능하다.
	 * TV t = new TV(); >> t 라는 변수는 TV타입 객체의 주소를 갖는다
	 * 
	 * 
	 */
	public TV objMethod() { //TV라는 타입의 객체 주소를 돌려줌 ..오비제이 메소는 티비타입 객체의 주소를 입력해야 하한다.
		TV tv = new TV();
		return tv;
	}
	
	public TV objMethod2() { 
		return new TV();
	}
	
	public TV objMethod3(TV t) { //TV라는 타입을 갖는 객체의 주소를 ..
		return t;
	}
	/*
	 main
	 1. TV t = new TV();
	 t.objMethod3(t);
	 
	 2.
	 t.objMethod3(new TV()); //t 라는 변수는 new TV() 주소값을 받는다.
	 
	 */

}
