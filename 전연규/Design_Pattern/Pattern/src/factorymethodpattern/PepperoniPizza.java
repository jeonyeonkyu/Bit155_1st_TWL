package factorymethodpattern;

public class PepperoniPizza extends Pizza{ //피자를 상속받은 피자 종류(각자의 피자 스타일이 있음)

	@Override
	public String getName() {
		return "PepperoniPizza";
	}
}
