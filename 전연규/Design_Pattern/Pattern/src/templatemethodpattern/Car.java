
package templatemethodpattern;

public abstract class Car {
	
	public void playWithOwner() { // ����и� �޼��� �ȿ� �ְ�
		System.out.println("�õ� �ѱ�");
		System.out.println("���̵� �극��ũ ����");  
		
		play();     //�߻�޼���� �ٸ��κ��� ���� ����  
		runSomething(); //�̰� �������̵� (���� �������̵��ؼ� ���� ��������� ������ ������ �޼��尡 ���) 
							//������ ����̸鼭 �������̵� ���־ �Ǵ� �κ� 
													
	}
	//�߻� �޼���
	abstract void play(); //��ӹ��� Ŭ������ ������ �޼��带 �������̵� ���־���Ѵ� (����� �ٸ����)
	
	//�Ϲ� �޼���
	void runSomething() {
		System.out.println("�극��ũ~!!");
	}
	
}
