package kr.or.bit;

//�� : ����(�Ϲ�, �߻�) :���� ���� �ִ�. ���� ������
public class Bird {
	public int g;
	
	//������
	public void fly() {
		System.out.println("flying");
	}
	//���� ����ϴ� �༮�� �� ����� ������ ������ ���ھ�.(90%�� �ٶ��� ����������) protected 
	protected void moveFast() {
		fly();
	}

}
