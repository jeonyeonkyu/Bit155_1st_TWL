//https://readystory.tistory.com/119
//ä��.

//https://jhparkkk.tistory.com/5
//���丮 �޼����� ���� -> �߻� ���丮�� �غ�

package Abstract_Factory.Ex3;

public class AbstractFactoryTest {
	public static void main(String[] args) {
		ComputerFactory.getComputer(new PCFactory("����CPU", "����VGA"));
		ComputerFactory.getComputer(new ServerFactory("������CPU", "������Vga"));
		
	}
}

/*����
1.���� sub class�� Ȯ���ϴ� �� �־� ������ ���� �� �� ����
���� Laptop Ŭ������ �߰��ϰ��� �Ѵٸ� getComputer() �������� LaptopFactory�� �ۼ��ϸ� ��
2.���丮 ������ ���ǹ�(if-else, switch ��)���κ��� ���.
*/