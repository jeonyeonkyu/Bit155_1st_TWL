import java.util.Arrays;

public class Ex02_Array_Quiz {

	public static void main(String[] args) {
		// ���а� �л����� �⸻��� ��������
		int[] score = new int[] { 79, 88, 97, 54, 56, 95 };
		int max = score[0]; // max >> 79
		int min = score[0]; // min >> 79

		/*
		 * ����� ����ؼ� max��� ������ �������� �ִ밪�� , min ������ �������� �ּҰ��� ��������. ��µǴ� �����: max = 97,
		 * min = 54 �� ������ for���� �ѹ��� ����Ͻʽÿ�.(max , min �ϳ��� for)
		 * 
		 */

		for (int i = 0; i < score.length; i++) {
			if (min > score[i]) {
				min = score[i];
			}
			if (max < score[i]) {
				max = score[i];

			}
		}
		System.out.printf("min%d, max%d", min, max);

		for (int i = 0; i < score.length; i++) {
			// if(score[i] > max){max = score[i];}
			// if(score[i] < max){min = score[i];}
			max = (score[i] > max) ? score[i] : max;
			min = (score[i] < max) ? score[i] : min;
		}
		System.out.println();

		int[] number = new int[10];
		// 10������ ���� 1~10���� �ʱ�ȭ�ϼ���.

		for (int i = 0; i < number.length; i++) {
			number[i] = i + 1;
		}

		for (int i = 0; i < number.length; i++) {
			System.out.println(number[i]);
		}

		// ��� �л��� �⸻��� ���������� ������ (5����)
		int sum = 0;
		float average = 0f;
		int[] jumsu = { 100, 55, 90, 60, 78 };
		/*
		 * 1. �Ѱ���� 2. ������ �� 3. ������ ��� ��)2,3 ������ �ϳ��� for ������ �ذ��ϼ���
		 */
		for (int i = 0; i < jumsu.length; i++) {
			sum += jumsu[i];
			// average = sum/ (float)jumsu.length;
			// ��� ������ ���(��� ������ ���� ��)
			if (i == jumsu.length - 1) {
				average = sum / (float) jumsu.length; // �̷��� �ϸ� i�� �迭�� ������ �Ǿ����� �׶� �ѹ��� ���Ѵ�.
			}
		}
		System.out.println("�Ѱ����: " + jumsu.length + "\t������ ��: " + sum + "\t������ ���: " + average);

		/*
		 1.1~45 ������ ������ �߻����� 6���� �迭�� ��������
		 2.�迭�� ��� 6���� �迭���� �ߺ����� ������ �ȵǿ� (�ߺ��� ����: ����� ���)
		 3.�迭�� �ִ� 6���� ���� ���� ������ ���� ��Ű���� (����:�ڸ��ٲ�)
		 4.�� ����� ��� �ִ� �迭�� ����ϼ���(ȭ�� ���)
		 
		 ���Ŀ��� ������ Ŭ���� �и��ؼ� Lotto.java...
		 ���� main �Լ� �ȿ��� ���...����
		 */
		//�̰� ����Ǭ��
	
		int[] lotto = new int[6];
		int tmp = 0;
		
		for (int i = 0; i < 6; i++) {
			lotto[i] = (int) (Math.random() * 45 + 1);
		}
//		for(int i =0;i<6; i++) {
//			for(int j=0;j<6;j++) {
//				if(lotto[i] == lotto[j]) {
//					lotto[i]= i+1
//							;
//				}
//			}
//		}
		
		//�����ͺ��� ū�ű��� ������� ����.
		for(int i = 0;i<lotto.length;i++) { 
			for(int jk = 0;jk<lotto.length;jk++) {
				if(lotto[i]<lotto[jk]) {
					 tmp = lotto[i];
					lotto[i] = lotto[jk];
					lotto[jk]=tmp;
				}
			}
		}
		
		for(int i=0;i<lotto.length;i++) {
			System.out.print(lotto[i]+" ");
		}
		
		
	}

}
