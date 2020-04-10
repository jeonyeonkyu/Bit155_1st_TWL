import kr.or.bit.Emp;

/*
 *1. 1~45������ ������ �߻����� 6���� �迭�� ��������
      (int)(Math.random()*45 + 1)
      lotto[0] = 44 , lotto[1] = 1 .... lotto[5] = 33
 *2. �迭�� ��� 6���� �迭���� �ߺ����� ������ �ȵǿ�  (�ߺ��� ���� :����� ���)
 *3. �迭�� �ִ� 6���� ���� ���� ������ ���� ��Ű����  (���� : �ڸ��ٲ�)
 *4. �� ����� ��� �ִ� �迭�� ����ϼ��� (ȭ�� ���)

 ���Ŀ��� ������ Ŭ���� �и��ؼ� Lotto.java ..... 
 ���� main �Լ� �ȿ��� ��� ....����...

���� 1�� �Դϴ�
  
 */
public class Ex03_Array_lotto {

	public static void main(String[] args) {
		int[] lotto = new int[6];
		for (int i = 0; i < 6; i++) {
			lotto[i] = (int) (Math.random() * 45 + 1);
			for (int j = 0; j < i; j++) { // j < i (ä���� ���� ��ŭ ��)
				if (lotto[i] == lotto[j]) {
					i--; // point ���� ���� ���� �ٲپ �Ѵ�
					break;
				}
			}
		}

		// 1. 6�� �迭 ��� ���� .. �迭���� ���ϰ� .. �ߺ����� ... 6���� �����
		// 2. �迭���� ���������� ���� �濡 �ִ� ����� ���Ѵ�

		// �����ϱ� (6���� �迭 ���� ��������� ����)
		// swap
		for (int i = 0; i < lotto.length; i++) {
			for (int j = i + 1; j < lotto.length; j++) {
				if (lotto[i] > lotto[j]) {
					int temp = lotto[i];
					lotto[i] = lotto[j];
					lotto[j] = temp;
				}
			}
		}

		// ����ϱ�
		for (int i = 0; i < lotto.length; i++) {
			System.out.println(lotto[i]);

		}
		
		//Today Point ^^ 
		
		//������ for��, ���� for ��
		//JAVA: for(Type ������ : �迭 or Collection {���౸��}
		//C#  : for(Type ������ in �迭 or Collection {���౸��}
		//JavaScript : for(Type ������ in �迭 or Collection){���౸��}
		
		int[] arr3 = {5,6,7,8,9};
//		for(int i=0;i<arr3.length;i++) {
//			System.out.println(arr3[i]);
//		}
		for(int val : arr3) {      //�ƹ� �������� ������ ��
			System.out.println(val); //5 ...9 ���� ���´�.
			
		}
		System.out.println("-------String---------");
		//String Ÿ��
		
		String[] strarr = {"A","B","C","D","FFFF"};
		
		for(String val : strarr) {
			System.out.println(val);
		}
		
		System.out.println("--------Emp----------");
		
		Emp[] list = {new Emp(1,"A"),new Emp(2,"B"),new Emp(3,"C")};
		//������ for ���� ����ؼ� ���, �̸� ���
		
		System.out.println(list[0].getEname());
		list[0].setEname("AA");
		System.out.println(">");
		System.out.println(list[0].getEname());
		System.out.println("<");
		
		
		for(Emp e : list) {
			e.empInfoPrint();
		}
		
		for(int i= 0;i<list.length;i++) {
			list[i].empInfoPrint();
		}
		
		//���Ŀ�� ���� (3��)   �ð��� 3��
		int[][] score3 = new int[][] {
			{11,12},
			{13,14},
			{15,16},
		};
		
		//������ for���� ����ؼ� �迭�� ���
		
//		for(int z : score3) {
//			for(int y : score[z].length) {
//				System.out.println();
//			}
//		}
		for(int[] col : score3) {
			for(int val : col) {
				System.out.println("��: "+ val);
			}
		}
		
		 

	}

}
