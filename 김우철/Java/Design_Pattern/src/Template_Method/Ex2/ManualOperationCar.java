package Template_Method.Ex2;

public class ManualOperationCar extends Car{
	
	@Override
	void play() {
		System.out.println("클러치한 상태에서 2단 넣기");
		System.out.println("기어 수동 조작");
	}
	
	//Hook 메소드 재정의
	void stop() {
		System.out.println("뻑뻑하게 브레이크~!!");
	}

}