import kr.or.bit.Bird;

//protected 접근자 상속관계에서만
//목적 : 상속관계에서 재정의...
//당신이 나를 상속한다면 이 자원(함수)는 재정의 해줬음좋겟어. 아님말구 요런의도?
//protected 는 타조예제로 외우자.
//새
class Ostrich extends Bird{  //Ostrich is a Bird.
	//구체화, 특수화
	//타조는 뛰니까
	void run() {
		System.out.println("run ^^");
	}

	@Override
	protected void moveFast() {
		//super.moveFast();
		run();  //원래는 flying 이지만 달려서 빠른거니까 런
	}
}
class Bi extends Bird{
	@Override
	protected void moveFast() {
		super.moveFast();
	}
	
}

public class Ex09_Inherit_Protected {

	public static void main(String[] args) {
		Ostrich ost =new Ostrich(); //타조 달려서 빠름
		ost.run();
		ost.moveFast();
		
		Bi bi = new Bi(); //새 날아서 빠름
		bi.fly();
		bi.moveFast();  //얘는 재정의했는데 super로 조상클래스 메소드 접근
		
		//bi 클래스 에서 재정의 하지 않고 메인함수에서 객체로 접근하게 되면 
		//protected 라서 안보인다. 
		//protected 함수를 그대로 쓰고 싶다면 . bi 클래스에 서 만든담에 super 로 접근 하던가 오버라이딩 하던가.
		//public 함수로 바꾸던가.
		//그렇지 않으면 다른 패키지 라서 안보인다.
		
		
	}

}
