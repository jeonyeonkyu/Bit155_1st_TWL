//https://limkydev.tistory.com/83?category=957882

package Factory_Method.Ex2;

import java.util.ArrayList;
import java.util.List;

public class Main {
	public static void main(String[] args) {
		Factory pizzaFactory = new PizzaFactory();
		Pizza pizza1 = pizzaFactory.createPizza("Tomato");
		Pizza pizza2 = pizzaFactory.createPizza("Pepperoni");

		System.out.println(pizza1.getName() + "\n");
		System.out.println(pizza2.getName() + "\n");
		
	}
}