package Template_Method.Ex2;

public class AutomaticOperationCar extends Car{
	
	@Override
	void play() {
		System.out.println("Drive D�� ��� ����");
		System.out.println("�ڵ� ��� ����");
	}
	
}



//���ø� �޼ҵ带 ������� �ʾ��� �� 
//public class AutomaticOperationCar2{
//	
//	public void playWithOwner() {
//		System.out.println("�õ� �ѱ�");
//		System.out.println("���̵� �극��ũ ����");
//		
//		System.out.println("Ŭ��ġ�� ���¿��� 2�� �ѱ�");
//		System.out.println("��� ���� ����");
//		
//		System.out.println("�극��ũ~!!");
//	}
//
//}

//���ø� �޼ҵ带 ������� �ʾ��� �� 
//public class TemplateMethodPattern2 {
//
//	public void playWithOwner() {
//		System.out.println("�õ� �ѱ�");
//		System.out.println("���̵� �극��ũ ����");
//
//		System.out.println("Drive D�� ��� ����");
//		System.out.println("�ڵ� ��� ����");
//
//		System.out.println("�극��ũ~!!");
//	}
//
//}

//����� �κ��� (�õ� �ѱ�, ���̵� �극��ũ ����) / (�극��ũ~!!) �κ��� ���ø� �޼���� �� �� ����
//����� ������ ���� Ŭ�������� ���ø� �޼ҵ带 �ΰ�, ��ü Ŭ������ ���� Ŭ��������
//�߻� �޼��带 �̿��Ͽ� �ڽ�Ŭ�������� ��üȭ�Ѵ�.



