package Template_Method.Ex2;

public abstract class Car {
	//���ø� �޼ҵ�
	//��ü���� �˰����� Ʋ�� ����
	public void playWithOwner() {
		System.out.println("�õ� �ѱ�");
		System.out.println("����Ʈ �극��ũ ����");
		
		play();
		runSomething();
	}
	
	//�߻� �޼���(������O)
	abstract void play();
	
	//Hook�޼���(�Ϲ� �޼���)
	//�˰��򿡼� �ʼ������� ���� �κ����μ� �������ص� �ǰ� ���ص� ��.
	//�����̰ų� �⺻ �ൿ�� ����
	//���� Ŭ�������� ����ϰ� ���� ���� �������̵� (������ X)
	//�̹� ���������� ����Ŭ������ �������̵�.
	void runSomething() {
		System.out.println("�극��ũ");
	}

}
