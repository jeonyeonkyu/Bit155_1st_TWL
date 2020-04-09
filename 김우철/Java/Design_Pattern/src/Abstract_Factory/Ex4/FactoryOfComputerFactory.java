package Abstract_Factory.Ex4;

public class FactoryOfComputerFactory {
	public void createComputer(String type) {
		ComputerFactory computerFactory = null;
		switch (type) {
		case "�Ϲ�":
			computerFactory = new NomalComputerFactory();
			break;

		case "����":
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