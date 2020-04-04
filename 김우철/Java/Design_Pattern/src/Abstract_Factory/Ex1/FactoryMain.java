//https://jdm.kr/blog/192

package Abstract_Factory.Ex1;

public class FactoryMain {
	public static void main(String[] args) {
		MachineFactory machineFactoryA = new MachineFactoryA();
		machineFactoryA.getMachineA().process();
		machineFactoryA.getMachineB().process();
		
		MachineFactory machineFactoryB = new MachineFactoryB();
		machineFactoryB.getMachineA().process();
		machineFactoryB.getMachineB().process();
	}

}
