package Abstract_Factory.Ex4;

public class Client {

	public static void main(String[] args) {
		FactoryOfComputerFactory factoryOfComputerFactory = new FactoryOfComputerFactory();
		System.out.println("[�Ϲ� PC]");
		factoryOfComputerFactory.createComputer("�Ϲ�");
		System.out.println("------------------");
		System.out.println("[������ PC]");
		factoryOfComputerFactory.createComputer("����");
	}
}
