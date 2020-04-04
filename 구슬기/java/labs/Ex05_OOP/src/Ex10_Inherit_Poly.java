/*
  다형성 - (상속관계에서 존재)    final빼고는 상속관계에서 존재한다.
  다형성 : 여러가지 성질(형태)를 가질 수 있는 능력 . 범용적 사전적 의미
  
  C#: 다형성(overloading, override) 능력으로 본다.
  
  JAVA : [상속관계]에서 [하나의 참조변수]가 [여러개의 타입]을 가질 수 있는 능력을 "다형성" 이라고 한다.
       단!!!!!!! 하나의 참조변수는 [부모타입] 이어야 합니다.
  부모 클래스 타입의 참조변수로 여러개의 자식클래스 객체를 참조 할 수있다. (부모는 자식을 품을 수 있다. 열명이면 열명모두)
  
 -- 다형성 : 현실세계와 반대된다. ? 현실세계 - 부모는 자식에게 조건없이 준다. 
                                                                자바 - 자식이 부모에게 조건없이 드린다.      
  
 */
class Tv2{ //부모타입(일반화, 추상화) 공통자원
	boolean power;
	int ch;
	
	void power() {
		this.power = !this.power;
	}
	void chUp() {
		this.ch++;
	}
	void chDown() {
		this.ch--;
	}
}

class CapTv extends Tv2{ //CapTv 특수화, 구체화, 고유한 표현   ...자막 달리는 Tv
	String text;
	String captionText() {
		return this.text = "현재 자막 처리중.....";
	}
}

public class Ex10_Inherit_Poly {

	public static void main(String[] args) {
		CapTv captv =new CapTv();
		captv.power();
		System.out.println("전원 : "+ captv.power);
		
		captv.chUp();
		System.out.println("채널정보: "+ captv.ch);
		System.out.println("자막처리: "+ captv.captionText());
		//여기까지기존배운내용
		//같은 타입끼리만 할당이 가능했다. 여태까지는
		//Car c = new Car();
		//Car c2 = c;
		
		Tv2 tv2 = captv;  
		//상속관계에서 부모타입은 자식타입의 주소를 가질 수 있다.(이게 다형성)
		//단 부모는 자신의 객체만 볼 수 있따.
		//단 재정의만 제외하고....
		//Tv2 tv = new Tv2(); 이렇게 하지 않는 이유. 기존 힙에 올라간 메모리를 재사용하기 위해서.  또 생성하기 싫어서!
		System.out.println(tv2==captv);   //둘의 주소가 같다.
		System.out.println(tv2.toString());
		System.out.println(captv.toString());
		// tv2.captionText() 안나옴 자식꺼라서>> 자신의 객체만 >> 자식의 자원 접근 분가
		
		
	}

}
