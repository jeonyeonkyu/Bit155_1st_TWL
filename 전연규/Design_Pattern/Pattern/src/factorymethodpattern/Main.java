package factorymethodpattern;

public class Main {
	public static void main(String[] args) {
		PizzaFactory pizzaFactory = new PizzaFactory();
		Pizza pizza1 = pizzaFactory.createPizza("Tomato"); 
		//���丮���� case�� ���ڷ� Tomato�� parameter�� �Է¹޾ұ� ������ TomatoPizza ��ü�� �����ȴ�
		Pizza pizza2 = pizzaFactory.createPizza("Pepperoni");
		
		
		System.out.println(pizza1.getName()+"\n");
		System.out.println(pizza2.getName()+"\n");
	
	}
}
