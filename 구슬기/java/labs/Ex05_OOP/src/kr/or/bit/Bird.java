package kr.or.bit;

//새 : 공통(일반, 추상) :새는 날수 있다. 새는 빠르다
public class Bird {
	
	//공통기능
	public void fly() {
		System.out.println("flying");
	}
	//나를 상속하는 녀석은 이 기능을 재정의 해줬음 좋겠어.(90%의 바람을 가지고있음) protected 
	protected void moveFast() {
		fly();
	}

}
