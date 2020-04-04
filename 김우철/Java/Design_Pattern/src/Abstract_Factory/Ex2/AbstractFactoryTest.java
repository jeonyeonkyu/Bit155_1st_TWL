//https://readystory.tistory.com/119
//ä��.

//https://jhparkkk.tistory.com/5
//���丮 �޼����� ���� -> �߻� ���丮�� �غ�

package Abstract_Factory.Ex2;

public class AbstractFactoryTest {
	public static void main(String[] args) {
		Computer pc = ComputerFactory.getComputer(new PCFactory("2 GB", "500 GB", "2.4 GHz"));
		Computer server = ComputerFactory.getComputer(new ServerFactory("16 GB", "1 TB", "2.9 GHz"));
		System.out.println("AbstractFactory PC Config::" + pc);
		System.out.println("AbstractFactory Server Config::" + server);

	}
}

/*����
1.���� sub class�� Ȯ���ϴ� �� �־� ������ ���� �� �� ����
���� Laptop Ŭ������ �߰��ϰ��� �Ѵٸ� getComputer() �������� LaptopFactory�� �ۼ��ϸ� ��
2.���丮 ������ ���ǹ�(if-else, switch ��)���κ��� ���.
*/