/*
 OOP 특징
 
 1. 상속
 2. 캡슐화(은닉화)
 3. 다형성(현대...에는 얘를 더 추구함)
 
 1. 상속표현
 java : child extends Base(child는 Base를 확장합니다.)
 C#   : child : Base 
 
 2. 상속 특징
 2.1 다중 상속은 불가능 !  이게 뭔소리냐. 복잡해지기 때문에~ ex)할아버지 ->나, 아버지->나
 2.2 단일 상속(계층적 상속지원: 통해서 여러개의 클래스를 상속 합니다.) ex) 할아버지 -> 아버지 -> 나
 2.3 다중상속을 지원하는게 있음 (유일한 자원 :Interface) 자바에서는 유일하다!
 
 3. 상속 의미
 3.1 진정한 의미 (장점): 재사용성     //다만 서로의 간섭이 심하다. 요즘은 별로 좋아하진않는다.
 3.1 단점 : 초기 비용(설계)
 재사용성 >> 설계 >> 비용(시간, 공통자원(분모,추상화))

 4. 상속관계에서 Memory 를 갖는시점언제?
    최상위 자원인 Object -> GrandFather -> Father -> Child 순으로 올라간다.
  사용자가 만드는 모든 클래스는 default  로 Object 클래스 상속..
  class Car{} >>내부적으로는 >> class Car extends Object{}
  Object 모든 클래스 root (최상위) : 모든 클래스의 부모 클래스이다.
 
 
 
  
 
 */
class Car{}
class GrandFather{ //GrandFather extends Object 이게 생략된거당
	public GrandFather() {
		System.out.println("GrandFather");
	}
	public int gmoney=5000;
	private int pmoney=10000; //private 상속관계에서는 어떤 의미 일까 : 접근불가능(보호하는거당)  : 내부에서 활용
}
class Father extends GrandFather{  //아버지는 할아버지의 자원을 상속 받습니다.
	public Father() {
		System.out.println("Father");
	}
	public int fmoney=1000;
}
class Child extends Father{
	public Child() {
		System.out.println("Child");
	}
	public int cmoney=500;
}
public class Ex01_Inherit {

	public static void main(String[] args) {
		Child ch = new Child();  //child father grandfather 가 heap 메모리에 생성된다. 그랜파 ->파 ->차일드 순으로 올라간다.
		System.out.println(ch.gmoney);  //다 사용 가능하다.  //할아버지 돈도 내돈
		System.out.println(ch.fmoney);  //아버지 돈도 내돈
		System.out.println(ch.cmoney);  //내돈도 내돈 
		//System.out.println(ch.pmoney); 할아버지 클래스에서는 프라이빗으로 해놨기때문에 쓸수없다.!!!!!!!!!!
		Car c = new Car();
		

	}

}
