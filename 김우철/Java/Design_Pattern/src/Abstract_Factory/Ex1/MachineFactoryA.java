package Abstract_Factory.Ex1;

public class MachineFactoryA implements MachineFactory {

	@Override
	public MachineA getMachineA() {
		return new MachineA1();
	}

	@Override
	public MachineB getMachineB() {
		return new MachineB1();
	}
	
	
}
