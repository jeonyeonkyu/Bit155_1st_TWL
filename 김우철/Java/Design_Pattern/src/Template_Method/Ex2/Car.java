package Template_Method.Ex2;

public abstract class Car {
	//���ø� �޼���
	public void playWithOwner() {
		System.out.println("�õ� �ѱ�");
		System.out.println("����Ʈ �극��ũ ����");
		
		play();
		runSomething();
	}
	
	//�߻� �޼���
	abstract void play();
	
	//�Ϲ� �޼���(Hook�޼���)
	//Hook�޼���� �������ص� �ǰ� ���ص� ��. ���� ���������� ��������
	void runSomething() {
		System.out.println("�극��ũ");
	}

}
