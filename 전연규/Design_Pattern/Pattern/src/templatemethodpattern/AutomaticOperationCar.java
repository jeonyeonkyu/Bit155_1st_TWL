package templatemethodpattern;

public class AutomaticOperationCar extends Car {
	@Override
	void play() {
		System.out.println("Drive D에 기어 놓기");
		System.out.println("자동 기어 변속");
	}

	void runSomething() {
		System.out.println("스무스하게 ~ 브레이크~!!");
	}
}
