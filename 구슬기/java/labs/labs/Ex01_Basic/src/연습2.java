import java.util.Scanner;

public class ����2 {

	public static void main(String[] args) {

		for (int i = 2; i <= 9; i++) {
			for (int j = 1; j <= 9; j++) {
				System.out.printf("[%d]*[%d]=[%d]\t", i, j, i * j);
			}
			System.out.println();
		}

		for (int i = 2; i <= 9; i++) {
			for (int j = 1; j <= 9; j++) {
				System.out.printf("[%d]*[%d]=[%d]\t", i, j, i * j);
			}
			System.out.println();
		}

		System.out.println();

		// Today Point : break(Ż��) , continue(��ŵ skip > �Ʒ������� )

		for (int i = 2; i <= 9; i++) {
			for (int j = 1; j <= 9; j++) {
				if (j == i) {
					break;
				}
				System.out.printf("%s", "*");
			}
			System.out.println();
		}

		for (int i = 2; i <= 9; i++) {
			for (int j = 1; j < i; j++) {
				System.out.printf("*");
			}
			System.out.println();
		}
		
		
		for (int i = 0; i<=5; i++) {
			for(int j = 5; j > 0 ; j--) {
				if(j>i) {
					System.out.printf(" ");
				}else {
					System.out.printf("*");
				}
				
			}
			System.out.println();
		}
		
		
		
		for(int i = 0;i <5;i++) {
			for(int j = 5; i<j ; j--) {
				System.out.printf("*");
			}
			System.out.println();
		}
		System.out.println();
		
		
		for(int i = 0;i <5;i++) {
			for(int j = 5; i<j ; j--) {
				System.out.printf("*");
			}
			System.out.println();
		}
		System.out.println();
		


		//��Ģ ���� ����
		int input1 = 0;
		int input2 = 0;
		int result = 0;
		String opr = "";
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("�����Է�:");
		input1 = Integer.parseInt(sc.nextLine());
		
		System.out.print("�����ȣ�Է� (+,-,*,/,)");
		opr = sc.nextLine();
		
		System.out.print("�����Է�:");
		input2 = Integer.parseInt(sc.nextLine());
		
		if(opr.equals("+")) {
			result = input1 + input2;
		}else if(opr.equals("-")){
			result = input1 - input2;
		}else if(opr.equals("*")){
			result = input1 * input2;
		}else if(opr.equals("/")) {
			result = input1 / input2;
		}else {
			System.out.println("�߸� �Է��ϼ̽��ϴ�.");
		}
		System.out.printf("%d %s %d = %d",input1,opr,input2,result);

		
		//      ���﷣�嵿������������ϴ�. �����������5���̸�������,  5 -11������2500�� ,12 ���ʹ�5000���Դϴ�.
//		ȭ�鿡�� ���̸� �Է¹޾� ����� ����Ͽ� ����ϴ� ���α׷��� �ۼ��Ͻÿ�.
//		��¿���
//		>���̸��Է��ϼ���:   
//	    3�����¹����Դϴ�.
//	        ���̸��Է��ϼ���:   
//	    7������2500���Դϴ�.
//	        ���̸��Է��ϼ���:   
//	    22������5000���Դϴ�.
		
		//���﷣�� ������
		int age = 0;
		
		age = Integer.parseInt(sc.nextLine());
		
		if(age <5) {
			System.out.println("������ 2500 �Դϴ�.");
		}else if(age <=11) {
			System.out.println("������5000 �Դϴ�.");
		}else {
			System.out.println("������ ���� �Դϴ�.");
		}
		
	}
	

}
