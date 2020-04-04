/*
1. Ex02_Variable 클래스 >> 설계도
2. static void main(String[] args) 함수를 가지고 있는 클래스 : 프로그램의 시작점, 진입점
*클래스의 종류는 2가지
-class Test { static void main(String[] args){}}
-class Test {} 독자적인 실행 (x) : main 가 없는 클래스 : 다른 클래스를 도와주는 클래스(lib)

Tip)
C# > public static void Main()...
서점에 가서 C# .... 70% 이해가 된다 ... C#이랑 자바는 객체지향언어다.

 변수 : variable
 데이터를 담을 수 있는 공간의 이름
 변수는 타입(공간의 크기)>> 자료형 >> 데이터타입을 가진다
데이터 타입 변수명; int i = 100;  i = 200;  값을 덮어서 바꿔써 넣을 수 있다.

변수가 선언되는 위치 (scope : 유효범위)
1. instance variable : 객체변수 >> class Person {int age}
2. local variable : 지역변수  (함수 안에 있는 변수) class Person { public void run() { int speed }}
3. 함수안에 if 블럭, for 블럭 안에 있는 변수도 지역변수 블럭안에서 유효
4. static variable : 공유변수(자원) : 객체간 공유자원

하나의 자바파일이 여러개의클래스를 가질수 잇는데
현업에서는 그렇게 잘 하지 않는다.
설계도는 유연하면 좋다.
*/

//class는 설계도이다 == class Type 이다 (여러개의 작은 타입을 가지고 있는 큰 타입이다.)
class Test{
    int iv = 500; //instance variable,클래스안에서 다사용가능
    // 이 변수는 초기화 하지 않아도 된다 ( 기본값 : default)
    int window; //default => 0
    //초기화 : 처음 값을 갖는 것(할당을 통해서)
    //why : 초기화를 하지 않아도 사용 가능 할까요 (window 변수 )
    //(hint) : 설계도는 하나..설계도를 기반으로 아파트를 여러개지을수있음, 지은 아파트마다 창문의 갯수는 다를 수 있음
    //답)객체(아파트)마다 다른 값을 가질 수 있다...
    
    Test(){ //함수 >> 함수의 이름이 클래스 이름과 같은 함수를 : 생성자(constructor : 초기자)
    	    //자동으로 함수 호출 : 언제 : 아파트가 지어질때 = 객체가 생성과 동시에 
    }
    
    Test(int data){ //위에와 같은 문자인에 에러 안나는 이유 :오버로딩(overloading) :하나의 이름으로 여러가지 기능을 수행
    	window = data; //창문의 개수 초기화
    	
    }
    
   
    void write() {
    	int num = 100; //local variable,write하고만 유효하다
    	//함수가 호출되면 그때 메모리에 생성되고 함수가 종료되면 메모리에서 사라진다.(num 이그럼)
    	//1.window = 11 초기화 할 수 있다 없다? 있따.
    	window = 111;
    	
    	int age =0; //local variable
    	System.out.println(age); //The local variable age may not have been initialized 초기화가 안됐어요라는 뜻이고,지역변수 만들고 쓰려고 하면 에러남
    }
    
    void print() {
    	System.out.println("iv : " + iv);
    	//System.out.println("num : " + num); 자신의 함수 범위에서만 ...
    }
}


class Apt{
	int window; //인스턴스변수 = 객체변수
}




public class Ex02_Variable {
    public static void main(String[] args) { //main도 (특수한) 함수  >>진입점
    	
    	/*
    	Test t = new Test();
    	t.print();
    	t.window = 10;
    	System.out.println("t.window : " + t.window);
    	
    	
    	Test t2 = new Test(100);
    	System.out.println(t2.window);
    	
    	Test t3 = new Test(2);
        System.out.println("t3.window" + t3.window); 
        t3.write();
        System.out.println("함수 호출 한다음에...t3.window" + t3.window); 
    	
    	*/
    	
    	
    	int lv = 500; //local variable (지역 변수)
    	System.out.println("lv 변수값 : " + lv);
    	//Ex02_Variable > javac 컴파일 > class >java > 실행 > JVM
    	//단축키 : ctrl + F11 (컴파일 >> 실행)
    	
    	//1. 지역변수는 반드시 초기화를 하고! 사용해야한다. (변수의 처음 값을 할당하는 것을초기화라고함)내가 얘한테 10을주면 그게 초기화
        //2. 약속( 함수안에 있는 변수는 반드시 초기화) 하자...main 도 함수다...
    	
    	int number=0; //초기화
    	number = 100;
    	number = 200;
    	System.out.println("number : " + number);
    	
    	
    	//선언과 할당(초기화)분리
    	int a;//선언
    	int b;
    	
    	a = 10;//초기화
    	b = 20; 
    	System.out.println(a);
    	
    	
    	//변수앞에는 타입이 있음// ex)int
    	
    	Apt ssung = new Apt();
    	System.out.println(ssung.window);
    	Apt ppark = ssung; //둘이 같은 집에 사는 거임
    	ppark.window = 100;
    	System.out.println(ssung.window);
    	System.out.println(ppark); //Apt@15db9742 얘 주소임 //설계도 이름 + @ + 주소
    	
    	Apt oosan = new Apt();
    	oosan.window = 100;
    	System.out.println(ssung.window);
    	//메인 함수안에 있는 변수는 지역변수고, 지역변수는 초기화를 해서 사용해야한다
    
    	
    	

	}

}
