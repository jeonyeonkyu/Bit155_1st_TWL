import java.util.Scanner;

public class Ex10_Statement {

	public static void main(String[] args) {
		// �ݺ���(while , do ~wile)
		int i = 10; // local variable
		while (i >= 10) { // ����true
			System.out.println(i);
			// �ݵ�� ���ǿ� �������� ���� true false�� ����� �־����
			i--;
		}

		// while(1~100) ������ ��
		// ������ : ��������

//		int sum=0;
//		int j = 1;
//		while(j <=100) {
//			sum += j; //sum = sum+j;
//			j++;
//		}
//		System.out.println("1~100������ �� : " +sum); //5050 �̰� �´� �� 
//		

		int sum = 0;
		int j = 1;
		while (j <= 100) {
			j++;
			sum += j;
			// ���� �սô� (���� ��� )
		}
		System.out.println("1~100������ �� : " + sum); // 5150 ���ϰ� �ٷ� false �� �ƴ϶� ���ϰ� ���� �� false�� �� ��������

		// while ������ ����ϼ���
		// ���ú����� �������� ���̸� �����ؾ� Ǯ������
		int k = 2;
		int w = 1;
		while (k <= 9) {
			w = 1; // w�� �ٽ� 1�� �ʱ�ȭ
			while (w <= 9) {
				System.out.printf("[%d]*[%d]=[%d]\t", k, w, k * w);
				w++; // �������� 10�� �Ǳ⶧���� ������ �ʱ�ȭ���ִ°���

			}
			System.out.println();
			k++;
		}

		// while(true) {if(true) {break;}}

		// do~while : ������ ���� .. ������ �ѹ��� ���� �ǰ� �ϰڴ�(�����̴� ����)
		// do {���๮} while(����)
		// �޴� ����
		// 1.�λ�
		// 2.�޿�
		// ����� ���ϴ� ���� ��ȣ�� �Է��ϼ���? do { } ������
		// �Է°�: 3 while(����) ���� �Ǵ�

		Scanner sc = new Scanner(System.in);
//		int inputdata = 0;
//		do {
//			System.out.println("���� �Է���(0~9)");
//			inputdata = Integer.parseInt(sc.nextLine());
//		}while(inputdata >= 10); //������ true �̸� do ���� ��� ����
//		//while ���� ���� true �� ���´ٸ� do{}�� ��� �ݺ��ض�
//		//Ż���� inputdata ���� 0~9 �´ٸ� ���� false ��ȯ... ���̻� �������� ����
//		System.out.println("����� �Է��� ���ڴ� : "+ inputdata);
		
		
		
		
		
		//A~Z
		int alpha = 65; 
		for( alpha =65 ; alpha<91 ; alpha++) {
			System.out.println((char)(alpha));
		}
		
		//1~100  ���� 10��10��

		for (int s = 1; s <= 100; s++) {
			System.out.printf("%d\t",s); 
			if(s%10 ==0) {
				System.out.println();
			}
		}
		
		
		//1���� 20������ ���� �߿��� 2�Ǵ� 3�� ����� �ƴ� ���� ������ ���ϴ� ���α׷��� �ۼ��ϼ���.
		int sum5 =0;
		for(int i1 = 1; i1 <=20; i1++) {
			if(i1%2 !=0 && i1%3 !=0) {
				sum +=i1;
		}
		}
		System.out.println("2�Ǵ� 3�� ����� �ƴ� ���� ����:"+sum);
		//2���� �ֻ����� �������� ���� ���� 6�� �Ǵ� ��� ����� ���� ����ϴ� ���α׷��� �ۼ��ϼ���.
		int j1 = 0;
		int k1 = 0;
		for(j1 = 1; j1<=6;j1++) {
			for (k1 =1; k1<=6; k1++) {
				if(j1 + k1 == 6) {
					System.out.println("�ֻ���1�� �� : "+j1 + "�ֻ���2�� ��: "+ k1);
				}
			}
		}

		
		
		//���������� ���α׷�
		int user = 0;
        int com;
        Scanner s= new Scanner(System.in);
        System.out.println("����: 1, ����: 2, ��: 3");
        user = Integer.parseInt(s.nextLine());
        com = ((int)(Math.random()*3)+1);
        if(user == com) {
            System.out.println("�����ϴ�");
        }else if(user==1 && com==2 || user ==2 && com==3 || user == 3 && com==1) {
            System.out.println("��ǻ�� �¸�");
        }else if(user==1 && com==3 || user ==2 && com==1 || user == 3 && com==2) {
            System.out.println("����� �¸�");
        }
		
        
		
        
        
		
		
	

	}
	}



