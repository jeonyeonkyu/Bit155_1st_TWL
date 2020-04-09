package Abstract_Factory.Ex4;

public class Client {

	public static void main(String[] args) {
		FactoryOfComputerFactory factoryOfComputerFactory = new FactoryOfComputerFactory();
		System.out.println("[일반 PC]");
		factoryOfComputerFactory.createComputer("일반");
		System.out.println("------------------");
		System.out.println("[서버용 PC]");
		factoryOfComputerFactory.createComputer("서버");
	}
}
