package Template_Method.Ex2;

public abstract class Car {
	//���ø� �޼ҵ�(�������̵� �Ұ�)
	//��ü���� �˰����� Ʋ�� ����
	public final void playWithOwner() {
		beforePlay();
		play();
		stop();
	}
	
	public final void beforePlay() {
		System.out.println("�õ� �ѱ�");
		System.out.println("����Ʈ �극��ũ ����");
	}
	
	//�߻� �޼���(������O)
	abstract void play();

	//Hook�޼���(�Ϲ� �޼���)
	//�˰��򿡼� �ʼ������� ���� �κ����μ� �������ص� �ǰ� ���ص� ��.
	//�����̰ų� �⺻ �ൿ�� ����
	//���� Ŭ�������� ����ϰ� ���� ���� �������̵� (������ X)
	void stop() {
		System.out.println("�극��ũ");
	}

}
