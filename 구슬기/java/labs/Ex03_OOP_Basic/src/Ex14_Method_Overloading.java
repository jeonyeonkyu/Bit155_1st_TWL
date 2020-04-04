/*
 * 
 OOP (객체지향 프로그래밍)
 1.상속 (재사용성)
 2.캡슐화(은닉화) : private : 클래스내부에서는 문제가 안되지만 참조변수나 다른쪽에서는 안보인다.  :직접할당을 막고 간접할당을 한다. : setter ,getter (특수한 함수)
 3.다형성
 
 다형성 한 부분으로 .....[오버로딩]
 
  >> method overloading     오버로딩과 오버라이딩의 차이점은?  오버로딩은 하나의 이름으로 여러개의 기능을 하는것 ex) 스타크래프트 오버로드.
                   *구체적으로 설명해보세용*                함수의 이름은 같습니다. 파라매터의 개수와 타입을 달리하는 방법입니다.
                                                                                                            리턴타입은 영향을 주지 않는다.
       [면접에서 자주물어보는 질문이다]                       오버라이딩은 상속간의 재정? 계정?
                                                       
  >>오버로딩은 하나의 이름으로 여러가지 기능을 하는 함수 
  //System.out.println 이 바로 첫날 첫시간에 한 오버로딩을 구현 한 함수이다.
  //println overloading 
   특징 : 오버로딩은 성능향상에 도움을 준다( x)
              그럼 왜쓰냐?  사용자를 편하게 하려고
              고민> 함수의 활용 > 여러개의 함수를 생성 (x) > 하나의 함수(parameter 달리)
    
  문법 : 함수이름은 같고 parameter 의 [개수]와 [타입]을 달리하는 방법 
  1. 함수이름은 같아야 한다.
  2. [parameter]의 개수 또는 [Type]은 달라야 한다.
  3. return Type 오버로딩의 판단기준이 아니다(x)
  3. parameter 순서가 다름을 인정한다.                                                  
                                                       
                                                       
 함수종류와 상관없이 오버로딩은 함수뒤의 것으로 판단한다.
 
 */

class Human{
	String name;
	int age;
	
}


class OverTest{
	int add(int i) {
		return 100+i;
	}
	// 같은이름인데 파라메터 개수와 타입을 달리하는것 : 오버로딩
	int add(int i,int j) {
		return i + j;
	}
	
	//String add(int k) {}  >> int add(int i) {} 같은녀석.
	String add(String s) { //parameter의 개수는 같지만 타입이 다른건 인정한다.
		return s +"hello";
	}
	
	void add(int i , String s) {
		System.out.println("오버로딩: "+ i + "/" + s);
	}
	void add(String s , int i) { //타입의 순서가 다름을 인정한다.
		System.out.println("나도 오버로딩: "+ s + "/"+ i);
	}
	void add(Human h) { //오버로딩
		h.name = "홍길동";
		h.age = 20;
		System.out.println(h.name + "/" + h.age);
		
	}
	
	
	
	
}
public class Ex14_Method_Overloading {

	public static void main(String[] args) {
		OverTest ot = new OverTest();
		int result = ot.add(10,20);
		System.out.println(result);
		
		//ot.add(new Human());  ok
		Human h = new Human();
		ot.add(h);

	}

}
