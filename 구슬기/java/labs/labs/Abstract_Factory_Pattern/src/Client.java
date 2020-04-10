import kr.or.bit.FactoryOfComputerFactory;

public class Client {

	public static void main(String[] args) {
		FactoryOfComputerFactory factoryOfComputerFactory = new FactoryOfComputerFactory();
        factoryOfComputerFactory.createComputer("LG");
	}

}
