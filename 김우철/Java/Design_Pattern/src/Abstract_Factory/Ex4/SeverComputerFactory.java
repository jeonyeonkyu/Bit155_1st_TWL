package Abstract_Factory.Ex4;

public class SeverComputerFactory implements ComputerFactory {
	public CPU createCPU() {
		return new CpuRyzen();
	};

	public Graphic createGraphic() {
		return new GraphicRyzen();
	};
}