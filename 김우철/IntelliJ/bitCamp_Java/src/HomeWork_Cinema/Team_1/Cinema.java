package HomeWork_Cinema.Team_1;

import java.util.Scanner;

public class Cinema {
//	����
	private String[][] seats;
	private Scanner scanner;
	
//	������
	public Cinema(){
		seats = new String[3][5];
		scanner = new Scanner(System.in);
		this.seatsReset();
	}
	
	
//	���
	
	public String[][] getSeats() {
		return seats;
	}
	public void setSeats(String[][] seats) {
		this.seats = seats;
	}
	
	//����
	public int CineMain() {
		System.out.println("*====================*");
		System.out.println("*    ��ȭ �¼� ���� ���α׷�    *");
		System.out.println("*====================*");
		System.out.println("  1. ���� ��Ȳ ��ȸ  ");
		System.out.println("  2. �¼� �����ϱ�  ");
		System.out.println("  3. ���� ����ϱ�  ");
		System.out.println("  4. ���α׷� ����  ");
		System.out.println("*====================*");
		
		int menu = 0;
		do {
			try {

				menu = Integer.parseInt(scanner.nextLine());
				if (menu >=1 && menu <= 4) {
					break;
				}else {
					throw new Exception("�޴� ��ȣ�� �߸� �Է��ϼ̽��ϴ�.");
				}
			}  catch(Exception e) {
				System.out.println(e.getMessage());
				System.out.println("�޴� ���� ���� �߻�");
				System.out.println("1 ~ 4 ������ ���ڸ� �Է��ϼ���.");
			}
		} while (true);
		return menu;
	}
	
	
	//����
	public void seatChoice() {
		System.out.printf("\n\n");
		String name;
   choice : do {
			do {
				try {					
			System.out.println("������ �̸��� �Է����ּ���."); 
			name = scanner.nextLine();
			
			 for(String[] col : this.seats) {
				for(String value : col) {
					if(value.equals(name)) {
						throw new Exception("�ش� �����ڸ����� �ߺ��� ���ų����� �ֽ��ϴ�.");
					}
				}
			 }
			 break;
				}catch(Exception e) {
					System.out.println(e.getMessage());
					System.out.println("������ �̸��� �ٽ� �Է��ϼ���.");
				}
			}while(true);
			

			
			do {
				try {	
					
					System.out.println("�����Ͻ� ���� �Է����ּ���. (1~3�� �� ����)");
					int col = (Integer.parseInt(scanner.nextLine()))-1;
					
					System.out.println("�����Ͻ� ���� �Է����ּ���.(1~5�� �� ����)");
					int row = (Integer.parseInt(scanner.nextLine()))-1;
			
					if(this.seats[col][row].equals("______")) {
						this.seats[col][row] = name;
						System.out.printf("%d�� %d�� %s�Կ��� ���� �����Ͽ����ϴ�.\n\n", col+1, row+1, name);
						break choice;
					}else {
						throw new Exception("�̹� ����� �¼��Դϴ�.");
					} 
				}catch(Exception e) {
					System.out.println(e.getMessage());
					System.out.println("�¼� ���� ���� �߻�. �¼��� �ٽ� �������ּ���.");
				}
			}while(true);
			
			
		}while(true);
		
		
	}

	
	//����
	public void seatsReset() {
		for(int i = 0; i < this.seats.length; i++) {
			for(int j = 0; j < this.seats[i].length; j++) {
				this.seats[i][j] = "______";
			}
		}
	}
	
	//�¼�����
	public void printSeatsInfo() {
		System.out.printf("\n\n");
		for(String[] col : this.seats) {
			for(String value : col) {
				if(value.equals("______")) {
					System.out.printf("[%s]", "���� ����");
				}else {
					System.out.printf("[%s]", "���� �Ϸ�");
				}
			}
			System.out.println();
		}
		System.out.printf("\n\n");
	}
	
	//�������
	public void seatCancle() {

		System.out.println("����ϰ� ���� �¼��� �����ڸ��� �Է����ּ���.");
		String cancleName = scanner.nextLine();
		
		for(String[] col : this.seats) {
			for(String value : col) {
				if(value.equals(cancleName)) {
					value = "______";
					System.out.printf("\n%s���� ������ ��ҵǾ����ϴ�.\n", cancleName);
					return;
				}
			}
		}
		System.out.printf("\n%s���� ���ų����� �����ϴ�.\n", cancleName);
	}
	
	
}
