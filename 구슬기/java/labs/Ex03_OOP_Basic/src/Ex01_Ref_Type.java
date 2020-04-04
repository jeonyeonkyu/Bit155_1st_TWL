//import kr.or.bit.*; //안에 클래스200개 >>가독성이 떨어지게됨. 한눈에 무슨 클래스 참조했는지 알수가 없음.
//import kr.or.bit.a; a클래스 사용
//import kr.or.bit.b; b클래스 사용했구나? >> 하나씩 명시해서 가독성을 높인다.
import kr.or.bit.Emp;
import kr.or.bit.Person;
import kr.or.bit.TV;
import kr.or.bit.Emp;
import kr.or.bit.BodyInfo;

public class Ex01_Ref_Type {

	public static void main(String[] args) {
		
		
		//값 타입 (저장공간 : 메모리에 값이있다~)
		int i  = 100; //[메인함수]안에있는변수는 지역변수 초기화를 해야함
		i = 200;
		System.out.println("i : " + i);
		
		//참조타입
		Person person; //선언만 한것 얘도 지역변수임 >>stack 라는 메모리 영역에 변수가 만들어진다.
		person = new Person(); //person 라는 변수에 값(주소값) 을 할당해야함
		System.out.println(person); //kr.or.bit.Person@15db9742
		
		//초기값 할당
		Person person2 = null; //null : 값이 없다!비어있다! 객체의 초기값으로 쓴다.
		System.out.println(person2); //null : 변수는 있는 데 메모리를 가지고 있지 않음(new person2)하면 생김
		
		// person2가 메모리를 갖는 방법은?
		// 1. person2 = new Person();  // new 연산자
		// 2. person2 = person;        // 같은 타입의 주소를 얘한테 할당된다.
        person2 = person;
        System.out.println(person2 == person); //true 얘네 같은 주소임 , 같은집에 사는 거
        
        person2.name ="홍길동";
        person2.age = 100;
        person2.print(); //name : 홍길동/age : 100
        
        System.out.println(person.name);  //홍길동   person2 = person을 해줘서 같은값이 나온다.
        
        //선언과 할당을 동시에 
        Person myperson = new Person();  // 변수 타입 = 연산자 Person();
        myperson.name = "아무개";
        myperson.print(); //name : 아무개/age : 0
        System.out.println(myperson.power); //false  default 값인 fasle 가 나온다.
        
        
        //Tv 만들고 채널 5까지 올려보세요
        //Tv 브랜드는 비트 하고 하세요
        TV tv = new TV();
        tv.brandname = "비트";
        System.out.println("현재 채널 정보: "+tv.ch);
        
        tv.ch_Up();
        tv.ch_Up();
        tv.ch_Up();
        tv.ch_Up();
        tv.ch_Up();
        
        System.out.println("현재 채널 정보: "+ tv.ch);
        
        tv.ch_Down();
        tv.ch_Down();
        
        System.out.println("현재 채널 정보: "+ tv.ch);
        System.out.println("브랜드 이름: "+tv.brandname);
        tv.tvPrint();
        
        
        
        
        //사원 한명을 생성해봐라
        
        Emp emp = new Emp();
        emp.empno =7788; 
        emp.name = "김유신";
        emp.job= "IT";
        
        System.out.println(emp.bodyinfo); //null
        BodyInfo bodyinfo = new BodyInfo();
        emp.bodyinfo = bodyinfo; //할당(주소값 할당)
        bodyinfo.height = 190;
        bodyinfo.weight = 90;
        
        System.out.println(emp + "/" + emp.bodyinfo); //emp.bodyinfo 에 .을 찍지 않으면  주소값 찍으면 그안에 것으로 접근한다.
        System.out.println(emp.empno + "/" + emp.bodyinfo.weight);
        
        Emp e = new Emp();
        e.bodyinfo = new BodyInfo();
        
        
	}

}
