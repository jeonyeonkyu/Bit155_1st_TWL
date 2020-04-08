package Factory_Method.Ex2;

public class PizzaFactory implements Factory {

	public Pizza createPizza(String name) {
		switch (name) {
		case "Tomato":
			return new TomatoPizza();
		case "Pepperoni":
			return new PepperoniPizza();
			
		}
		return null;
	}


}
