/*
 생성자 함수(constructor)
 1.함수(특수한 목적) 
 2.특수한 목적 (member field초기화)
 
 Tip) static{}, {}
 
 3.일반함수와 다른점
 3.1 함수의 이름이 고정되어있음 (class 이름과 동일)
 3.2 실행시점 때문에 : return Type (x) >> void 를 쓰지도 않음  >> 어차피 void 라서 . 명시하지 않아도 default void 라서 생략
 3.3 실행시점 : 객체생성(new) 되고 변수가 만들어 지고 ""자동""으로 호출되는 함수(불러줘야 호출되는 기본함수랑 다르게 유일하게 자동으로 호출됨) >> 생성자 함수
 
 4. 목적: 생성되는 객체마다 강제적으로 다른 member field 값을(초기값) 부여하는 방법
 class Car{String color;}
 >>Car c = new Car(); 이사람이 차를 만들때 무조건 색상을 가지고 갔으면 좋겠는데 방법이 없을까? 그게 바로 생성자!!
 
 5.생성자도 함수다! >> overloading 가능
 
------ ****당신이 만약 overloading  된 생성자 함수를 하나라도 구현했다면 default 생산자 함수는 반드시 구현을 통해서만 생성된다.!!!!
        그 이유는? 
 
 
 */
//설계자의 의도: 자동차를 만들면 반드시 자동차 이름을 넣어라.
class Car{
	String carname;
	//생략되어 있었다....소름..
	//직접 코딩하지 않으면 컴파일러가 자동으로 코드를 하나 만든다. 그것은
	Car(){}
}

class Car2{
	String carname;
	Car2(){ //void 가 생략되어있다.  default void
		System.out.println("나는 default 생성자입니다.(자동호출)");
		carname = "포니"; //생성자 member field 의 초기값....
	}
}

class Car4{
	int door;
	int wheel;
	
//	생성자 오버로딩 : 강제적인 초기화. 생산할때 강제적으로 옵션을 넣어야함.
//	Car4(){
//		System.out.println("default");
//	}
//	 //method overloading (함수)
//	 //오버로딩
//	Car4(int num){
//		door =  num;
//		System.out.println("overloading door : "+ door);
//		
//	}
//	Car4(int num, int num2){
//		door = num;
//		wheel = num2;
//		System.out.println("overloading door : "+ door + "/" + wheel);
//	}
}


public class Ex16_Constructor_overloading {

	public static void main(String[] args) {
		//Car c1 =new Car();
		//c1.carname = "소나타";    이름 넣는 것을 강제하지 않는다. 넣지 않을 수도 있음
		//Car2 c2 =  new Car2(); //Car2(); 생성자 함수를 호출하는 거다.
		//System.out.println(c2.carname);
		
		//원칙적으로는 객체를 생성할때 생성자함수는 1개만 호출
		Car4 c4 = new Car4();         //default나옴
		//Car4 c4 = new Car4(100);    //overloading door : 100
		//Car4 c4 = new Car4(10,200);  // overloading door : 10/200

		//**자동차 주문제작**
		//Case
		//Case 기본자동차. 
		//Case1 자동차색상
		//Case2 자동차 색상, 썬팅
		//Case3 자동차색상 , 썬팅, 네비장착  
		
		//생성자 overloading 활용(강제성)
		
		
		
		
		
		
		//시나리오를 만들어보기....
		
		
		
		
		
		
		
		
		
		
	}

}
