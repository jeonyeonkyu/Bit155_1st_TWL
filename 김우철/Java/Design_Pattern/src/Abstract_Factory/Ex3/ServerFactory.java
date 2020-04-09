package Abstract_Factory.Ex3;

public class ServerFactory implements ComputerAbstractFactory {
	private String cpuName;
	private String vgaName;

	public ServerFactory(String cpuName, String vgaName) {
		this.cpuName = cpuName;
		this.vgaName = vgaName;
	}

	@Override
	public Cpu createCpu() {
		return new IntelCpu(cpuName);
	}
	
	@Override
	public Vga createVga() {
		return new IntelVga(vgaName);
	}


}