import java.util.Scanner;

import kr.or.bit.Sofa;



public class Ex20_Program {
	//��ܿ��� ..�Ϲ������� ������ ����( ����, ����, ��ǰ(����:Ŭ����))
	static Scanner sc = new Scanner(System.in); //��ǰ(����:Ŭ����)
	
	//��� 
	static void option1() {
		System.out.println("���� "); 
	}
	static void option2() {
		System.out.println("���� ,�ٸ��߰� ");
	}
	static void option3() {
		System.out.println("����, �ٸ��߰�, ���׺��� ");
	}
	static void option4() {
		System.out.println("����, �ٸ��߰� , ���׺���, �����߰� ");
	}
	
	
	static int displayMenu() {
		System.out.println("**************");
		System.out.println("****���ļ���****");
		System.out.println("1.���� +�÷�����");
		System.out.println();
		System.out.println("2.���� +�÷����� +�ٸ��߰�");
		System.out.println();
		System.out.println("3.���� +�÷����� +�ٸ��߰� +���׺���");
		System.out.println();
		System.out.println("4.���� +�÷����� +�ٸ��߰� +���׺��� + �����߰�");
		System.out.println();
		
		
		
		
		int menu = 0;
		
		
		//���� : ����ڰ� 1���� 4���� ��ȣ�߿��� �ϳ��� �����Ѱ�.(while �� �� ���´ٴ� ����)
		
		return menu;
	}
	
	public static void main(String[] args) {
		//Ex11_do_while_Menu ex11 = new Ex11_do_while_Menu();
		
		while(true) {
			switch(Ex20_Program.displayMenu()) {
			case 1: option1();
				break;
			case 2: option2();
				break;
			case 3: option3();
				break;	
			case 4: option4();
				
			}
			return;
			
		}

	}

}
