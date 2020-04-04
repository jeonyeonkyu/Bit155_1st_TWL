package Abstract_Factory.Ex1;

public class MachineFactoryB implements MachineFactory{

	@Override
	public MachineA getMachineA() {
		return new MachineA2();
	}

	@Override
	public MachineB getMachineB() {
		return new MachineB2();
	}
	
	
}
