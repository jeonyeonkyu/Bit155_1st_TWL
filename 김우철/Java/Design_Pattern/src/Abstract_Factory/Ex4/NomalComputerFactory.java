package Abstract_Factory.Ex4;

public class NomalComputerFactory implements ComputerFactory {
	public CPU createCPU() {
		return new CpuIntel();
	};

	public Graphic createGraphic() {
		return new GraphicIntel();
	};
}
