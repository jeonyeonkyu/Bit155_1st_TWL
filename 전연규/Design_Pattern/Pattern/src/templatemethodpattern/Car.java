package templatemethodpattern;

public abstract class Car {
	
	public void playWithOwner() { // 공통분모를 메서드 안에 넣고
		System.out.println("시동 켜기");
		System.out.println("사이드 브레이크 해제");  
		
		play();     //추상메서드로 다른부분을 따로 뺀다  
		runSomething(); //이건 오버라이드 (만약 오버라이드해서 따로 만들어주지 않으면 기존의 메서드가 출력) 
							//공통의 기능이면서 오버라이드 해주어도 되는 부분 
													
	}
	//추상 메서드
	abstract void play(); //상속받은 클래스는 무조건 메서드를 오버라이드 해주어야한다 (기능이 다를경우)
	
	//일반 메서드
	void runSomething() {
		System.out.println("브레이크~!!");
	}
	
}
