/*
 ���α׷� >> ���μ��� >>������(�ּ� ���� ����)
 ���ݱ���
 �̱����μ��� : �̱۾�����(main�Լ�)�� ���α׷��� ¥�Դ�.
 JVM : call Stack >> �Լ� ����....
 ���� ���μ����� stack�� �ϳ��� ���� �ֱ� ������ 
 �Լ��� 10���� �ѹ��� �ϳ��� �Լ��� �����Ѵ�...
 [������ ����]
 
 
 */

public class Ex01_Single_thread {
	public static void main(String[] args) {
		System.out.println("�� main �ϲ��̾�");
		worker();
		worker2();
		System.out.println("main �ϲ� ����");

	}
	static void worker() {
		System.out.println("�� 1�� �ϲ��̾�");
	}
	static void worker2() {
		System.out.println("�� 2�� �ϲ��̾�");
	}

}
