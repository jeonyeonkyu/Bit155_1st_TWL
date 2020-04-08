package factorymethodpattern;

public class PizzaFactory extends Factory {// 피자를 생성하는 공장인데
											// 메서드에 파라미터로 값을 받아서 
											//해당 값에 맞는 객체를 생성하게함

	@Override
	public Pizza createPizza(String name) {
		switch(name) {
		case "Tomato": return new TomatoPizza();
		case "Pepperoni": return new PepperoniPizza();
		}
		return null;
	}

}
