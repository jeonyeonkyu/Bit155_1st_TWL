package factorymethodpattern;

public class Main {
	public static void main(String[] args) {
		PizzaFactory pizzaFactory = new PizzaFactory();
		Pizza pizza1 = pizzaFactory.createPizza("Tomato"); 
		//팩토리에서 case의 인자로 Tomato를 parameter로 입력받았기 때문에 TomatoPizza 객체가 생성된다
		Pizza pizza2 = pizzaFactory.createPizza("Pepperoni");
		
		
		System.out.println(pizza1.getName()+"\n");
		System.out.println(pizza2.getName()+"\n");
	
	}
}
