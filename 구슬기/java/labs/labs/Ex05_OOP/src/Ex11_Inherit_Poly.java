/*
  자바 다형성(상속)
  
 */

class Pbase{ //자동차의 틀
	int p = 100;
}
class Cbase extends Pbase{ //한국타이어
	int c = 200;
}
class Dbase extends Pbase{ //미쉐린 뭐 이렇게 봐라.
	
}


public class Ex11_Inherit_Poly {

	public static void main(String[] args) {
		Cbase cbase = new Cbase();
		System.out.println(cbase.toString());
		
		Pbase p = cbase; //다형성 .. 이러면 객체생성없이 이미 생성되어있는 객체인, cbase의 주소를 넘겨받는다. 
		//부모타입의 참조변수 p 는 자식타입의 참조변수 cbase가 가지는 주소값을 받을 수 있다.
		//단,  부모타입의 참조변수 p 는 생성된 부모객체 (heap에 있는객체)에만 접근 가능하고 자식객체는 접근 불가
		
		Dbase dbase = new Dbase();
		
		p = dbase;  //한국타이어 미쉐린 타이어 주소 두개 다 받음
		//부모타입 p는 자식타입 [cbase 의 주소]도 가지고, [dbase 의 주소]도 가질 수 있다.
		//p는 상속관계에서 여러개의 자식 타입을 주소 갖기 가능하다.
		
		
	}

}
