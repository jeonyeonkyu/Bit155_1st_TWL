package Template_Method.Ex2;

public class AutomaticOperationCar extends Car{
	
	@Override
	void play() {
		System.out.println("Drive D에 기어 놓기");
		System.out.println("자동 기어 변속");
	}
	
	void runSomething() {
		System.out.println("스무스하게 ~ 브레이크~!!");
	}

}

//템플릿 메소드를 사용하지 않았을 때 
//public class AutomaticOperationCar2{
//	
//	public void playWithOwner() {
//		System.out.println("시동 켜기");
//		System.out.println("사이드 브레이크 해제");
//		
//		System.out.println("클러치한 상태에서 2단 넘기");
//		System.out.println("기어 수동 조작");
//		
//		System.out.println("브레이크~!!");
//	}
//
//}

//템플릿 메소드를 사용하지 않았을 때 
//public class TemplateMethodPattern2 {
//
//	public void playWithOwner() {
//		System.out.println("시동 켜기");
//		System.out.println("사이드 브레이크 해제");
//
//		System.out.println("Drive D에 기어 놓기");
//		System.out.println("자동 기어 변속");
//
//		System.out.println("브레이크~!!");
//	}
//
//}

//공통된 부분인 (시동 켜기, 사이드 브레이크 해제) / (브레이크~!!) 부분을 템플릿 메서드로 뺄 수 있음
//공통된 로직은 상위 클래스에게 템플릿 메소드를 두고, 구체 클래스는 상위 클래스에서
//추상 메서드를 이용하여 자식클래스에서 구체화한다.



