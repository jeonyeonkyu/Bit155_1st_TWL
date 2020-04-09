package Template_Method.Ex2;

public abstract class Car {
	//템플릿 메소드(오버라이딩 불가)
	//전체적인 알고리즘의 틀을 제공
	public final void playWithOwner() {
		beforePlay();
		play();
		stop();
	}
	
	public final void beforePlay() {
		System.out.println("시동 켜기");
		System.out.println("사이트 브레이크 해제");
	}
	
	//추상 메서드(강제성O)
	abstract void play();

	//Hook메서드(일반 메서드)
	//알고리즘에서 필수적이지 않은 부분으로서 재정의해도 되고 안해도 됨.
	//공백이거나 기본 행동을 정의
	//서브 클래스에서 사용하고 싶을 때만 오버라이딩 (강제성 X)
	void stop() {
		System.out.println("브레이크");
	}

}
