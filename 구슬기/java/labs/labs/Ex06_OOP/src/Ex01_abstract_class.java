/*
 추상클래스 
 >> 미완성클래스 (미완성설계도)  설계도이긴한데 완성본이 아니다. 
 1. 완성된 코드 + 미완성된 코드가 결합된것.
 2. 완성(함수)이란? 실행블럭이 있는 함수 + 미완성(함수) 실행블럭이 없는 함수 (public void run(); >> {x})  어떤 run인지 안정하고 너가 완성하렴 ...요런느낌.. 뛰는지 걷는지 뭔지
 3. 완성과 미완성의 차이는 무엇입니까? new 를 할수있냐.  객체생성(완성된클래스만가능), 미완성 (객체 생성불가능)
 
  정리
  1. 추상클래스(미완성) 스스로 객체 생성 불가능(new 사용 불가)
  2. 추상클래스는 결국 ... 완성된 클래스가가 되는것이 목적...   미완성: 나의 꿈은 완성된 클래스가 되기!    상속으로 ..상속이 목적.. 
  3. 상속관계에서 미완성된 자원(추상자원abstract method) 완성해라(구현해라) >> 재정의 해라... Override 이렇게 됨
  
  설계자 입장에서 >
  추상클래스 >> 만약에 추상 클래스를 만든다면 >> 나의 의도는 무엇일까. >> 강제적 구현을 목적으로 합니다.( 재정의의 강제성)
  왜 만들까? 를 강제하는게 문법이다.
  상속받는 동시에 재정의를 안하면 에러가 난다.  extends 추상클래스{} 하는 순간 오버라이드가 자동화되니까.  ex)협업하는 사람들끼리 강제성을 주기~
  니가 이거(강제로) 완성시켜줘  ~~ 다른사람에게 실행블럭을 강제하는것~
  
 
 
 */
abstract class Abclass{
	//추상클래스는 추상자원을 만들겠다는 의도.
	int pos;
	void run() {
		pos++;   
	}
	//미완성코드를 만들어본다.
	abstract void stop(); //추상자원   {} 요렇게 생긴 실행블럭이 없다.  앞에는 abstract 를 붙인다.
}

//상속이 존재하지 않으면 >> 추상클래스는 태어나지도 않았다. 
class Child extends Abclass{

	@Override
	void stop() {
		//안에를 채울지 말지는 내마음.  실행블럭만 있으면 된다. 함수안의 내용을 강제할 방법이 없다.  
		this.pos =0;
		System.out.println("stop: "+this.pos);
	}
	
}

class Child2 extends Abclass{

	@Override
	void stop() {
		//안에를 채울지 말지는 내마음.  실행블럭만 있으면 된다. 함수안의 내용을 강제할 방법이 없다.   //구현하는 내용은 내맘!
		this.pos = -1;
		System.out.println("stop: "+this.pos);
	}
	
}


public class Ex01_abstract_class {

	public static void main(String[] args) {
		//Abclass ab = new Abclass();  //불가하다.
		Child ch = new Child();
		ch.run();
		ch.run();
		System.out.println(ch.pos);
		ch.stop();
		
		
		Child2 ch2 = new Child2();
		ch2.run();
		ch2.run();
		System.out.println(ch2.pos);
		ch2.stop();
		
		//다형성
		Abclass ab =ch; //부모타입의 참조변수는 자식타입의 객체주소를 가질 수 있다. 
                        //부모는 자신의 타입자원들만 활용할수있다.
		                //******************부모로 접근하더라도 그 자원이 재정의 되어있다면 자식자원으로접근하게된다. 요거 중요하다.
		ab.run();
		ab.stop();
		//그런데 만약 부모쪽으로 가고싶다?  (super)를 쓴다.
		
		
		
	}

}
