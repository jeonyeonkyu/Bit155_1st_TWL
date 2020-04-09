package Abstract_Factory.Ex4;

public class FactoryOfComputerFactory {
	public void createComputer(String type) {
		ComputerFactory computerFactory = null;
		switch (type) {
		case "일반":
			computerFactory = new NomalComputerFactory();
			break;

		case "서버":
			computerFactory = new SeverComputerFactory();
			break;

		}
	
		computerFactory.createCPU().CpuCreate();
		//CPU cpu = computerFactory.createCPU();
		//cpu.CpuCreate();
		computerFactory.createGraphic().GraphicCreate();
		//Graphic graphic = computerFactory.createGraphic();
		//graphic.GraphicCreate();
	}

}