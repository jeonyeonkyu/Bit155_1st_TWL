import java.util.Scanner;

//���� ���� �޴��� ����...

public class Ex12_do_while_Static_Menu_���� {
	//��ܿ��� ..�Ϲ������� ������ ����( ����, ����, ��ǰ(����:Ŭ����))
	static Scanner sc = new Scanner(System.in); //��ǰ(����:Ŭ����)
	
	//��� 
	static void inputRecord() {
		System.out.println(" ������"); 
	}
	static void deleteRecord() {
		System.out.println(" �н��� ");
	}
	static void sortRecord() {
		System.out.println(" ����");
	}
	
	
	static int displayMenu() {
		System.out.println("******************");
		System.out.println("****���� �޴�����****");
		System.out.println("1.0~ 4999��");
		System.out.println();
		System.out.println("2.5000~ 9999�� ");
		System.out.println();
		System.out.println("3.10000�� �̻�");
		System.out.println();
		System.out.println("4.���α׷� ����");
		System.out.println();
		
		
		
	 int menu = 0;
		do {  //do while �� ���� ���ϴ� ���� �Է¹��������� ��� ������. 
			try {
				System.out.println("�ݾ��� �Է��ϼ���");
				menu = Integer.parseInt(sc.nextLine());
			if(0<= menu && menu > 5000 ) {
				break; //while �� Ż��(1<=menu <=4)
			}else if(5000<= menu && menu < 10000) {
				break;
			}else if(menu > 10000 ) {
				break;
			}else {
				//1���� �۰ų� 4���� ū ���� ���͵� ���α׷����� ���� �ƴ�. 
				//���� ������ ���ڴ�(���� ����� ����)
				//System.out.println("�߸� �Է� �ϼ̽��ϴ�.");
				throw new Exception("�ݾ��� �߸� �Ǿ����ϴ�");
				
				//������ ������ ���� �״� ���α׷��ε�
				//�������� �ϴ� �귯����� �ϴ°��� ����ó�� �̴�. ���ܸ� �ذ��ϴ°� �ƴϴ�.
				
			}
				
			}catch(Exception e){
				System.out.println(e.getMessage());  //"�޴� ���� ��ȣ�� �߸� �Ǿ����ϴ�" �̰� ����ϱ������Լ���
				System.out.println("�ݾ� ���� �߻�");
				System.out.println("�޴� 1~4������ �Է�");
				
			}
			
			
			
			
		}while(true); 
		
		//���� : ����ڰ� 1���� 4���� ��ȣ�߿��� �ϳ��� �����Ѱ�.(while �� �� ���´ٴ� ����)
		
		return menu;
	}
	///////////////////////////////////////////////////////////////////////////////////
	
	
	public static void main(String[] args) {
		//Ex11_do_while_Menu ex11 = new Ex11_do_while_Menu();
		
		while(true) {
			switch(Ex12_do_while_Static_Menu_����.displayMenu()) {
			case 1 : inputRecord();
				break;
			case 2: deleteRecord();
				break;
			case 3: sortRecord();
				break;
			case 4: System.out.println("���α׷� ����");
			      //return;  // main ����
			System.exit(0);  //���α׷� �� ���� ����(kill)
				
			}
		}
		

	}

}

