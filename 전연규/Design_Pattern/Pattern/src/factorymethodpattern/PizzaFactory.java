package factorymethodpattern;

public class PizzaFactory extends Factory {// ���ڸ� �����ϴ� �����ε�
											// �޼��忡 �Ķ���ͷ� ���� �޾Ƽ� 
											//�ش� ���� �´� ��ü�� �����ϰ���

	@Override
	public Pizza createPizza(String name) {
		switch(name) {
		case "Tomato": return new TomatoPizza();
		case "Pepperoni": return new PepperoniPizza();
		}
		return null;
	}

}
