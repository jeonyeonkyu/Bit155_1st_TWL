package Template_Method.Ex2;

public class ManualOperationCar extends Car{
	
	@Override
	void play() {
		System.out.println("클러치한 상태에서 2단 넣기");
		System.out.println("기어 수동 조작");
	}
	
	void runSomething() {
		System.out.println("뻑뻑하게 브레이크~!!");
	}


}
