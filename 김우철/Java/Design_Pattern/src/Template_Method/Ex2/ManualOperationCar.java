package Template_Method.Ex2;

public class ManualOperationCar extends Car{
	
	@Override
	void play() {
		System.out.println("Ŭ��ġ�� ���¿��� 2�� �ֱ�");
		System.out.println("��� ���� ����");
	}
	
	//Hook �޼ҵ� ������
	void runSomething() {
		System.out.println("ManualOperationCar : �����ϰ� �극��ũ~!!");
	}

}