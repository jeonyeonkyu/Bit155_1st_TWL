import java.util.Scanner;

public class ���� {

	public static void main(String[] args) {
		// Systme.out.println("Hello World");
		// Ŭ���� >> ���赵
		/*
		 * //������? �����͸� ������ �ִ� ������ �̸� //������ ����Ǵ� ��ġ (scope ��ȿ����) 1. instance variable :
		 * ��ü���� 2. local variable : �������� (�Լ��ȿ��ִ� ����) 3.�Լ��ȿ� if, �� for �� �ȿ� �ִ� ������ ��������
		 * ���ȿ��� ��ȿ 4.static variable : ��������(�ڿ�) : ��ü�� �����ڿ�
		 * 
		 * Ŭ������ ���赵�̴�
		 * 
		 * 
		 */
		String str = "ȫ�浿";
		int age = 100;

		Car c;

		c = new Car();
		System.out.println(c);

		Car c2 = new Car();
		System.out.println(c == c2); // �ּҰ� �ٸ��� false

		long num2 = 100;
		long num3 = 10000000000000L;
		System.out.println(num3);

		long p = 1000000000001L;
		char single = '��';
		System.out.println(single);
		char ch = 'A';
		System.out.println(ch);

		int intch = 'A';
		System.out.println(intch);
		System.out.println("int(ch) : " + ch);

		int ch2 = 65;
		System.out.println((char) ch2);

		int intvalue = 161389656;
		byte bytevalue = (byte) intvalue;
		System.out.println(bytevalue);

		String name = "hello world";
		System.out.println(name);

		String name2 = "�ݰ����ϴپ�" + name;
		System.out.println(name2);

		char sing = '\'';
		System.out.println(sing);

		String name3 = "��\"��\"��";
		System.out.println(name3);

		String str3 = "10";
		String str4 = "100";

		String result = str3 + str4;
		System.out.println(result);

		// C:\temp ȭ�鿡 ����ϼ��� (String ������ �ְ� ȭ�� println ���)

		String str5 = "C:\\temp";
		System.out.println(str5);

		float f = 3.15f;
		float f2 = 1.123456789123456789f;
		System.out.println(f2);

		byte q = (byte) 128;
		System.out.println(q);

		// -----------------Ex04 ����
		/*
		 * ���赵 Ŭ������ 2������ ���� �� ���� 1.main �Լ��� ���� ���赵-��ü������ ���డ���� 2.main �Լ��� ���� ���赵-�����ִ�
		 * ����, ���̺귯�� ���������̶�� ��
		 * 
		 */
		// -----------------Ex05����

		int i = 9;
		int j = 13;
		int result2 = i + j++;
		System.out.println(result2 + "  j :" + j);

		// ������ ��� ������ int �� ��ȯ �� ���˴ϴ�.
		// �Ǽ��� ��� ������ double �� ��ȯ�� ���˴ϴ�.

		byte b = 100;
		byte c3 = 1;
		byte g = (byte) (b + c3); // ��ȣ�� ��ü�� ������ ��ú�ȯ �ؾ���
		int h = b + c3;
		System.out.println("g :" + g + "  h :" + h);

		float num4 = 10.45f;
		int num5 = 20;
		int result5 = (int) (num4 + num5);
		System.out.println(result5);
		float result6 = num4 + num5;
		System.out.println(result6);

		char c4 = '!';
		char c5 = '!';
		int result7 = c4 + c5;
		System.out.println(result7);
		System.out.println((char) result7);

		for (h = 0; h < 10; h++) {
			System.out.println((h) * 2);
		}

		for (g = 0; g < 10; g++) {
			if (g == 5)
				break;
		}
		System.out.println(g);

		int sum = 0;
		sum += 1;
		sum -= 1;
		System.out.println(sum);

		int score = 96;
		String grade = "";
		System.out.println("����� ������ :" + score);
		if (score >= 90) {
			grade = "A";
			if (score >= 95) {
				grade += "+";
			} else {
				grade += "-";
			}
		} else if (score >= 80) {
			grade = "B";
			if (score >= 85) {
				grade += "+";
			} else {
				grade += "-";
			}
		} else if (score >= 70) {
			grade = "C";
			if (score >= 75) {
				grade += "+";
			} else {
				grade += "-";
			}
		} else {
			grade = "F";
		}
		System.out.println("����� ������ : " + grade);

		int data = 70;
		switch (data) {
		case 100:
			System.out.println("100�Դϴ�.");
			break;
		case 90:
			System.out.println("90�Դϴ�.");
			break;
		case 80:
			System.out.println("80�Դϴ�.");
			break;
		case 70:
			System.out.println("70�Դϴ�.");
			break;
		default:
			System.out.println("default");
		}
		
		int month = 2;
		String res = "";
		switch(month) {
		case 1:
		case 3:
		case 5:
		case 7:
		case 8:
		case 10:
		case 12: res= "31";
		      break;
		
		
		case 4:
		case 6:
		case 9:
		case 11:    res= "30";
			break;
		
		case 2:     res= "29";
			
		}
		System.out.println(month + " �̹� ���� �ϼ��� " +res );
		
		
		System.out.println("Math.random() :" + (int)(Math.random()*10+1));
		
		
		int data1 = ((int)(Math.random()*10 +1))*100;
		String msg = "";
		msg += "��÷��ȣ�� :" + data1 + "�̰� ��ǰ��";
		switch(data1) {
		case 1000 : msg+= "Tv";
		case 900:   msg+= " Notebook";
		case 800:   msg += " Airpods";
		case 700:   msg += " E-bookPackage";
		case 600:   msg += " Book";
		break;
		default :   msg += "nothing";
		}
		System.out.println(msg);
		
		
		// -----------------Ex07����
		
		int num = 100;
		System.out.printf("num ���� : %d �Դϴ� \n", num);
		//%d 10���� ������ ���� ����>>d��� �ڸ��� �־��.
		//%f �Ǽ�
		//%s ���ڿ�
		//%c ����
		// \t tab, \n enter
		System.out.printf("num ���� [%d]�Դϴ�. �׸��� [%d]�� �־�� .\n", num , 5555);
		
		
		
		//Ŭ������? � ����� �����ϴ� ��
		Scanner scanner = new Scanner(System.in);
//		int num1 = scanner.nextInt(); //nextInt >> ����
//		int num21 = scanner.nextInt(); //nextFloat >>�Ǽ�
//		                              //��ȣ�ȿ� �Է��ϴ� ���� num1�� �ȴ�
//		System.out.println(num1); 
//		System.out.println(num21);

//		String input = scanner.nextLine(); //��ȣ�ȿ� �Է��ϴ� ������ input�� �ȴ�
//		int num = Integer.parseInt(input);//���ڿ�(input)�� ����(num11)���� ��ȯ
//		
//		String input = scanner.nextLine();
//		String input = "3";
//		int num31 = Integer.parseInt(input);
//		System.out.println(num31);
    
		
		//      Ex_08 ������ ��Ģ �����
		
		
		String opr = "";
		int input_1=0;
		int input_2=0;
		int result8=0;
		Scanner sc = new Scanner(System.in);
		
		System.out.print("�����Է�: ");
		input_1 = Integer.parseInt(sc.nextLine());
				
		System.out.print("�����ȣ(+,-,*,/): ");
		opr = sc.nextLine();
		
		System.out.print("�����Է�: ");
		input_2 = Integer.parseInt(sc.nextLine());
		
		
		if(opr.equals("+")) {
			result8 = input_1 + input_2;			
		}else if(opr.equals("-")) {
			result8 = input_1 + input_2;
		}else if(opr.equals("*")) {
			result8 = input_1 + input_2;
		}else if(opr.equals("/")) {
			result8 = input_1 + input_2;
		}else {
			System.out.println("�������� �ʴ� ������ �Դϴ�");
			
			return;
		}
		System.out.printf("[%d %s %d= %d]" ,input_1,opr,input_2,result8);
		
		
		
	for(int s = 1 ; s <= 10 ; s++) {
			
			for(int v =0 ; v <=9  ; v++) {
				System.out.printf("%d\t",s+v);
			}
			System.out.println();
		}		
	
	//������
	int age2 = 0;
	Scanner sc2 = new Scanner(System.in);
	System.out.print("���̸� �Է��ϼ���");
	age2 = Integer.parseInt(sc2.nextLine());
	
	if(age2 <5) {
		System.out.println("������ 2500 �Դϴ�.");
	}else if(age2 <=11) {
		System.out.println("������5000 �Դϴ�.");
	}else {
		System.out.println("������ ���� �Դϴ�.");
	}
		
		
	
	}

}
