/*
 1.자바는 시스템이 제공하는 기본 8가지 타입을 제공(자료형)
 2.8가지 기본 타입은 값을 저장하는 타입
 3.숫자 -> 정수   -> (음의정수, 0, 양의정수) ->byte(-128~127)
                                   ->char (한 문자를 표현하는 타입)
                                   >>한문자(2byte) >> 한글1자 (2byte)
                                                 >> 영문자, 특수, 공백 (1byte)
                                                 >> 협의 >> char (한글, 영문자, 특수, 공백)
                                                                                                           상관없이 한글자 표현하자 (국가간협의) unicode
                                    ->short (c언어 호환성  : 2byte)
                                    ->int  (-21억 ~ 21억 : 4byte) **Java 정수 연산 기본 타입 **
                                    ->long  (8byte)
                                

                   실수(부동소수점)-> float(4byte) , double(8byte)
                   >>정밀도(표현 범위가 크다) >> double ** java 실수 연산 기본 타입 **
      논리  -> 참, 거짓 -> boolean >> 프로그램의 논리적 흐름제어 
       
   ** 궁금한점 : 문자열의 표현 >> "
   *"홍길동" , "HELLO"
String 은 클래스 입니다. (참조타입) String s = new String("홍기동");
그럼에도 불구하고.....
이야기하기 전까지는 String 그냥 문자열을 저장하는 타입
int, double 처럼 사용하세요
그래야 삶이 편해집니다.   

자바는 크게
1.값타입 > 숫자, 논리 8가지 > value type
2.참조타입> 클래스, 배열> 변수에 값이 저장되는 것이 아니라 주소값이 저장 (참조값) > ref type


*** class == 설계도 == Type


*/
class Car{ //Car는 Type이다. Car는 설계도이다. >> 구체화된 산물 >> 객체화(메모리)
	String color;
	int window;
	
}

public class Ex03_Datatype {

	public static void main(String[] args) {
		String str = "홍길동";
		int age = 100;

		Car c; //선언 main 안에 있는 local
		//System.out.println(c); //초기화를 하지 않았기 때문에
		//c 라는 변수의 초기화 >> 주소를 가지기 위해서는 new를 이용해야함
		c = new Car();
		System.out.println(c); //Car@15db9742
		
		//선언과 초기화
		Car c2 = new Car(); //선언과 동시에 초기화
		System.out.println(c == c2);  //false
		System.out.println(c2);
		c2.window = 100;
		c2.color = "blue";
		
		
		int i = 10; //선언과 할당
		
		int j; // 선언
		j = 20; //할당 분리

		int k;
		k = j;
		System.out.println("k :" + k);
		k = 300;  //이러게 하면 k는 300  j 는 20
		System.out.println("k :" + k);
		
		//int i = 200; 같은 함수안에 같은 변수명 존재할수없음
		//int p, g, q; //이렇게 할거면 array 사용 (배열)  int[] arr = new int[3]; >>arr[0] , arr [1]
		
		//int (-21억 ~ 21억)
		//Today point
		//literal >> 있는 그대로
		//정수 리터럴 : 10000000000 : [자바의 정수 리터럴 값은 default >> int ] 
		//문자 리터럴 : A
		//int p = 10000000000; // The literal 10000000000 of type int is out of range.
		//int p = 10000000;
		//int p = 10000000000;
		//접미사 : L, l 범위를 넓혀주기
		
		long num2 = 100;
		long num3 = 10000000000L; //int 범위만 표현하는게 디폴트여서 L을 써주어야 함
		System.out.println(num3);
		
		
		//int p = 10000000000l; //Type mismatch: cannot convert from long to int
		
		//char : 2byte (정수값)
		//한문자를 표현하는 자료형(데이터 타입)
		//일반적
		//1. 한글 1 자 : 2byte
		//2.영문자, 특수문자, 공백 :1byte
		//unicode >> 한글, 영문 >> 2byte 취급
		//char 은 한 글자를 받는다.
		// Today point
		//문자열 : "가" ,"Hello" >> String str = "가나다라마"
		//문자 : '가', 'a'      >> char ch = 'A'
		
		char single = '가';
		System.out.println(single);
		char ch = 'A';
		System.out.println(ch);
		//char 문자를 저장하지만 내부적으로는 정수값을 가지고 있다.(아스키 코드표기준)
		//casting (타입변환)

		int intch = 'A'; //자동으로 (내부적으로) 암시적 형 변환
		System.out.println("intch : " + intch);  //intch : 65
		
		System.out.println((int)ch); //type casting : 65
		
		char ch2='a';
		System.out.println(ch2);
		System.out.println((int)ch2);
		
		int intch2 = 65;
		char ch3 = (char)intch2; //속지말자[값을보지말고 값이 가지는 타입을 보자]
		//int가  char 보다 크니까 char에 들어갈수있는 그릇에 한번 담아줘야함 그게 괄호()
		//강제적 형변환 (명시적 형변환)
		//Key Point : 65라는 숫자가 char 타입에 속하는 데이터 손실 발생 없이 할당 가능
		//큰 것을 작은 것으로 바꿀 때에는 크기가 맞지 않으니 [그 타입에 맞는형변환을 통해 작업]을 한다. 손실은 감수
		
		int intch3 = ch3; //형변환.. 자동으로 변환.. 암시적 형변환
		//컴파일러가 자동으로 코드를 재생성한다
		//int intch3 = (int)ch3;
		System.out.println(intch3);
		
		//Today point
		// 1. 할당에서 변수가 가지고 있는 값을 보지말고 [[변수의 타입을 보자]]
		// 2. 변수의 타입 크기를 확인하자
		// 3. 큰타입에는 작은타입을 넣을수있음. 
		// 4. 작은 타입에는 큰 타입값을 못 넣음 (casting)
		//int -> char 변환  >>> char <- (char)int
		//char -> int 변환 >>>  int <- char 실행... >> 내부적으로(컴파일러가) >> int <-(int)char
		
		
	    //이렇게 강제로 변환시키면 변환손실값 또는 쓰레기 값이 발생
		//int intvalue = 10165468;
		//byte bytevaule = (byte)intvalue;
		//System.out.println(bytevalue); //-36 쓰레기 값
		
		
		int intvalue = 10165468;
		byte bytevaule = (byte)intvalue; //이렇게 하면 넘쳐버림 바이트 요만한데 10165468을 넣을라니까
		System.out.println(bytevaule);
	 
		//String (문자열) 타입으로 보자
		String name = "hello world";
		System.out.println(name);
		
		String name2 = name + "안녕하세요"; // + 산슬, 결합
		System.out.println(name2);
		//DB(oracle >> + 연산자 (산슬), 결합연산자 ||)
		//'hello world'  || '월요일'
		
		//TIP) java 특수문자 사용하기
		//특수한 문자를 인지하기 위해서 : \ 역슬러시 뒤에  
		char sing = '\''; //역슬러시 뒤에 있는 쿼테이션은 문자 데이터야....
		System.out.println(sing);
		
		//홍"길"동 이라는 문자를 String 변수에 저장하고 화면 출력해보세요
		
		String ename = "홍\"길\"동";
            
		
		String str3 = "1000";
		String str4 = "10";
		
		String result = str3 + str4;
		System.out.println(result); //"100010"
		
		//C:\temp 화면에 출력하세요 (String 변수에 넣고 화면 println 출력)
		
		String path = "C:\\temp";  //   \t는  Tab 키이다     \n  -> new line)
		System.out.println(path);
		
		
		//실수(부동소수점) : 떠다니는점
		//float (4byte)
		//double (8byte) : **실수의 기본타입(리터럴 값) double***
		
		float f = 3.14f; //3.14 값은 double이라는 그릇안에 들어있음 ,,큰거 작은거에 넣을라니까 에러나는거임 //값말고 그릇으로 봐야함.
		//float f = (float) 3.14;                 //f를 뒤에 써주면 오류가 사라짐. (자바야, 이거 플롯타입이야 이런뜻) 접미사 f or F
		//double f = 3.14;                //실수 리터럴값은 무조건 더블로 보기때문에 생긴 오류
		
		float f2 = 1.123456789f;    //실수 리터럴은 무조건!!!!double로 본다!!!!
		System.out.println("f2 : "+f2);  //f2 : 1.1234568  얘는 버릴때 반올림하고 버려버림
		//반올림처리가 default. 임 ( 대략 소수점이하 7자리 정도 확보후 반올림)
		
		double d = 1.123456789123456789; // double 는  대략 소수점이하 16자리 표현
		System.out.println("d: "+d); //d: 1.1234567891234568 반올림
		
		//Quiz
		// byte : -128 ~ +127
		byte q = (byte)128;  //정수리터럴은 무조건 int!!!!!!!!!   128이라는 정수 값은 기본적으로 int 그릇에 담겨져있음
		System.out.println("q : "+q); //q : -128        최대값을 넘어가면 -128 부터 순서대로나옴.(overflow 시 순환값)
		
		//double d2 = 100; //암시적 형변환
		double d2 = (double)100;  //캐스팅 생략
		System.out.println(d2); //100.0 (실수로 답이 나옴)
		
		//Quiz
		double d3 = 100;
		int i5 = 100;
		
		//int result2 = d3 + i5; //이게 문제  //int = int + double (정수 = 정수 + 실수)
		
		
		//1.  double result2 = d3 + i5;       셋다 답이지만 2번3번은 데이터손실이됨.
		
		
		//2.  int result2 = (int)d3 + i5;     (데이터손실) 만약: d3 = 3.1245
        
		
		//3.  int result2 = (int)(d3 + i5);   (데이터손실) 만약 : d3 = 3.1245
		
		
		//Today Point
		//작은타입 + 큰타입 >> 큰타입
		//타입간 형변환>> 변수가 가지는 값을 보지 말고 변수의 타입을 보고 판단하자.
		//명시적 형변환 (casting) (바꿀려고하는타입 또는 값을 명시하면됨 )
		
		
		int i6 = 100;
		byte b2 = (byte)i6; //명시적 형변환
		System.out.println(b2);
		
		byte b3 = 20;
		int i7 = b3;
		//컴파일러가 내부적으로 (int)b3 생성 // 암시적 형변환
		
		
		
		
		
		
		
		

		
		
		
				
		
		
		
		
		
	
		
	}

}
