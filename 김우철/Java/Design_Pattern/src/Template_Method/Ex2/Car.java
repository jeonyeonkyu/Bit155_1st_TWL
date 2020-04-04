package Template_Method.Ex2;

public abstract class Car {
	//템플릿 메서드
	public void playWithOwner() {
		System.out.println("시동 켜기");
		System.out.println("사이트 브레이크 해제");
		
		play();
		runSomething();
	}
	
	//추상 메서드
	abstract void play();
	
	//일반 메서드(Hook메서드)
	//Hook메서드란 재정의해도 되고 안해도 됨. 여기 예제에서는 재정의함
	void runSomething() {
		System.out.println("브레이크");
	}

}
