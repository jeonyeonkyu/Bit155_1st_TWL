package Ex10_Thread;

/*
���α׷�  >> ���μ���  >> ������ (�ּ� ���� ����)
���ݱ���
�̱����μ��� : �̱۽����� (main) �Լ�
JVM : call Stack >> �Լ� ���� ....
���� ���μ����� stack �ϳ��� ������ �ֱ� ������
�Լ��� 10�� �� �ѹ��� �ϳ��� �Լ��� ���� ...
[������ ����]
*/
public class Ex01_Single_Thread {
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








