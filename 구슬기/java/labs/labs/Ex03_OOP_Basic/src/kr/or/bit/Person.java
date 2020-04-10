package kr.or.bit;
//Class ==설계도==Type
//설계도 구체화(메모리 올려서)를 통해서 객체로 생성되어야 한다.
//구체화된것 >> 객체 , 인스턴스,오브젝트 로 부름

//설계도 기본적인 구성요소(필드 +함수 )+생성자 가 있어야 이건 설계도야 라고 함

//class Car{} >>default class Car {} >> 현재 폴더(패키지) 에서만 사용가능하다
//public class Car{ public String color; int door} >>얘는 다른폴더에서 사용가능하다. 하지만 int door 는 default int door라서 접근불가


public class Person { 
	                    // String 은 default 참조타입(Class >>null) 앞글자 대문자는 클래스 뿐!
	public String name; // member field >> instance variable 
                        // 초기화를 하지 않아도 된다(초기화 : 최초의 값을 할당하는 것)
	                    // 그 이유는? 생성되는 객체(사람) 마다 다른 이름을 갖기 때문에 .. ex)하나의 설계도로, 자이, 힐스테이트 등 만들수있게
	                    // Person p = new Person(); p.name="홍길동" 이렇게 다르게 설정 해주기 위해서
	                    // Person p2 = new person(); p2.name="김유신"
	                    // default 값을 가진다.(초기화를 안할경우 default 0값을 가진다.)
	                    // public int age; //default > 0
	                    // public boolean power //default > negative 한 프로그램이라서 false값이 기본이 됨.
	public int age;
	public boolean power;
	//기능 (행위) >> method       //void :돌려주는 값이 없다 라는 뜻 
	public void print() { //변수값을 출력하는 기능
		System.out.println("name : "+ name + "/" + "age : "+ age);
		
		
	}
}
