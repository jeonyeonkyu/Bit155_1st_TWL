package Abstract_Factory.Ex3;

//object ������ �ſ� ����ϰ� �ϴ� �߿��� ����Ʈ ����
//�Ķ���ͷ� �������̽��� �޾� ó���� �ϱ� ������ ������ ���� �������� �ʴ�.
//ServerFactory�� PCFactory���� �����ϱ� ���� Ŭ���̾�Ʈ �ڵ忡 �������� �����Ǵ� ������ Ŭ����.
//if-else ���̵� ���� ���ϴ� ���� Ŭ������ �ν��Ͻ��� ������ �� �ְ� ���.
public class ComputerFactory {
	public static void getComputer(ComputerAbstractFactory factory) {
		Cpu cpu = factory.createCpu();
		System.out.println(cpu.getCpu());
		Vga vga = factory.createVga();
		System.out.println(	vga.getVga());
	
	}

}