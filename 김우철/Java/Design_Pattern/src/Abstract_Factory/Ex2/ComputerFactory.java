package Abstract_Factory.Ex2;

//object ������ �ſ� ����ϰ� �ϴ� �߿��� ����Ʈ ����
//�Ķ���ͷ� �������̽��� �޾� ó���� �ϱ� ������ ������ ���� �������� �ʴ�.
//ServerFactory�� PCFactory���� �����ϱ� ���� Ŭ���̾�Ʈ �ڵ忡 �������� �����Ǵ� ������ Ŭ����.
//if-else ���̵� ���� ���ϴ� ���� Ŭ������ �ν��Ͻ��� ������ �� �ְ� ���.
public class ComputerFactory {
	public static Computer getComputer(ComputerAbstractFactory factory) {
		return factory.createComputer();
	}

}
