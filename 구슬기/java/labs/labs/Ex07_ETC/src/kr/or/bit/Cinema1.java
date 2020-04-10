package kr.or.bit;

import java.util.Scanner;

public class Cinema1 {
	private String[][] seat;
	private Scanner sc; // �޴� ����
	// Scanner sc; sc ������ �ƹ��͵� �����ϰ������ʴ� null ���� default ������ ��������� �ʱ�ȭ�ʿ�
	// NullPointerException �߻����� : �޸� �Ҵ��� ���� ���� ���¿��� �ʵ� �Ǵ� �޼ҵ带 �������� �� �߻��ϴ� ����

	private String name; //private ������, �̰� ��� �������� ���°�
	
	// default ������
	public Cinema1() {
		this(3, 5);
	}

	// �ó׸� ������ ���Ƿ� ����� ������
	public Cinema1(int num1, int num2) {
		sc = new Scanner(System.in);
		seat = new String[num1][num2];
		for (int i = 0; i < seat.length; i++) {
			for (int j = 0; j < seat[i].length; j++) {
				seat[i][j] = (i + 1) + "-" + (j + 1);
			}
		}
	}
	
	// 1. �¼� ��Ȳ
	private void seatPrint() {
		System.out.println("***********�¼� ��ġ��***********");
		for (int i = 0; i < this.seat.length; i++) {
			for (int j = 0; j < this.seat[i].length; j++) {
				System.out.printf("[%s]",
						this.seat[i][j].equals((i + 1) + "-" + (j + 1)) ? (i + 1) + "-" + (j + 1) : "����");
			}
			System.out.println();
		}
		System.out.println("******************************");
	}

	// 2. �����ϱ�
	private void reserveSeat() {
		//String name; ��ü���� �Ẹ���� ��� �ּ�
		int col, row;
		for (int i = 0; i < seat.length; i++) {
			for (int j = 0; j < seat[i].length; j++) {
				System.out.printf("[%s]", seat[i][j].equals((i+1)+"-"+(j+1)) ? (i+1)+"-"+(j+1) : "����");
			}
			System.out.println();
		}
		do {
			try {
				System.out.print("���ϴ� ���� �����ϼ���: ");
				col = Integer.parseInt(sc.nextLine());
				System.out.print("���ϴ� ���� �����ϼ���: ");
				row = Integer.parseInt(sc.nextLine());
				System.out.print("�����ڸ�: ");
				name = sc.next(); //���⿡ �ƹ��͵� �Է� �� �ص� ������ �Ǵ� �� ����
				
//				try {
//					
//					char checkname;
//					Loop1: for(int i=0; i<name.length(); i++) {
//						checkname = name.charAt(i);
//						if (checkname>=33 && checkname<=47) {
//							System.out.println("Ư�����ڴ� �Է����� ������.");
//							break Loop1;	
//				}
				// �̸��̾ƴ� ���ڳ� �̻��� ���ڰ� ������ �ٽ� �Է��ϰԲ� �����ϴ� ���????

				// 33-47, 58-64, 91-96, 123-126 ����
				
				// nextLine??? nextInt() �޼ҵ� ������ nextLine() �޼ҵ带 �����Ϸ��� �Ҷ�
				// nextLine()�޼ҵ尡 �׳� �Ѿ������ ������ ���ܳ���(������???)
				if (seat[col - 1][row - 1].equals(col + "-" + row)) { // �ڸ��� ��������� ��������
					seat[col - 1][row - 1] = name;
					System.out.println(col + "��" + row + "�� �¼��� ����Ǿ����ϴ�");
					break; // ����� �ݺ����� �������� �� .. while���� ��������
				} else {
					System.out.println("�̹� ����� �¼��Դϴ�.");
				}
			} catch (ArrayIndexOutOfBoundsException e) {
				System.out.println("�ش� ��� ���� ��ȭ�� �¼��� �����ϴ�...�ٽ��Է��ϼ���");
			} catch (Exception e) { // try �������� �߻��ϴ� ���ܸ� ó���� (ex. col �� AAA �̷� ���ڰ��� ���� catch ���� ���ܸ� ó����)
				System.out.println("�߸��� ���� �ԷµǾ����ϴ�.... �ٽ� �Է��ϼ���");
			}
		} while (true);
	}

	// 3. ���� ���� ��ȸ
	private void showMySeat() {	
		//System.out.print("�����ڸ��� �Է��ϼ���: ");
		for (int i = 0; i < seat.length; i++) {
			System.out.print((i + 1) + "��\t");
			for (int j = 0; j < seat[i].length; j++) {
				System.out.print(seat[i][j]+"\t");
			}
			System.out.println();
		}
		
		System.out.println();	
	}
//		System.out.println("�����ڸ� �Է�: ");
//		name = sc.nextLine();
//		for(int i=0; i<seat.length; i++) {
//			for(int j=0; j<seat.length; j++) {
//				if(seat[i][j] == name) {
//					System.out.printf("%s���� �ڸ��� %d�� %�� �Դϴ�.", name, i, j);
//				} else {
//					System.out.println("���ص�");
//				}
//			}
//		}	

	private int col, row;	
	// 4. ���� ���� ���
	private void cancelSeat() { 
		//int col, row;
		int name_count; // ���� �̸��� ������Դ��� Ȯ���ϴ� ������
		name = null; // ������ �̸�
		System.out.print("������ �̸��� �Է��� �ּ���: ");
		name = sc.next();
		name_count = division_name(name);
		if (name_count > 1) { // ���������� �ִٸ�
			System.out.println("���������� �ֽ��ϴ�....");
			System.out.println("�¼� ��ġ���� �����ݴϴ� ... ����� �¼��� �Է��ϼ��� >> ");
			seatPrint();
			System.out.print("���� �����ϼ���:");
			col = sc.nextInt();
			System.out.print("���� �����ϼ���:");
			row = sc.nextInt();
			seat[col - 1][row - 1] = col + "-" + row;
			System.out.println("�¼� ������ ��ҵǾ����ϴ�"); //���⼭ ������ �ڸ��� �Է��ص� �¼� ������ ��ҵƴٰ� ����
		} else if (name_count == 1) {
			for (int i = 0; i < seat.length; i++) {
				for (int j = 0; j < seat[i].length; j++) {
					if (seat[i][j].equals(name)) {
						seat[i][j] = (i + 1) + "-" + (j + 1);
						System.out.println((i + 1) + "�� " + (j + 1) + "�� " + "�¼� ������ ��ҵǾ����ϴ�");
					}
				}
			}
		} else {
			System.out.println("����� �̸��� �����ϴ�...");
		}
	}

	// �������� ���� �޼ҵ�
	private int division_name(String name) {
		int count = 0;
		for (int i = 0; i < seat.length; i++) {
			for (int j = 0; j < seat[i].length; j++) {
				if (this.seat[i][j].equals(name)) {
					count++;
				}
			}
		}
		return count;
	}
	

	// ���ο��� �� �Լ�
	public void showMenu() {
		while (true) {
			Scanner sc = new Scanner(System.in);
			System.out.println("===��ȭ ���� ���α׷�===");
			System.out.println("1.�¼� ��Ȳ");
			System.out.println("2.�����ϱ�");
			System.out.println("3.���� ���� ��ȸ");
			System.out.println("4.���� ���� ���");
			System.out.println("5.���α׷� ����");
			System.out.println("===================");
			System.out.print("1~5�� �ϳ��� �Է��ϼ���:");
			String selectnum = sc.nextLine();
			loop: while (true) {
				switch (selectnum) {
				case "1":
					seatPrint();
					break loop;
				case "2":
					reserveSeat();
					break loop;
				case "3":
					showMySeat();
					break loop;
				case "4":
					cancelSeat();					
					break loop;
				case "5":
					System.out.println("�̿����ּż� �����մϴ�. <���α׷� ����>");
					return;
				default:
					System.out.println("1~5 �� �ϳ��� �Է��ϼ���");
					break loop;
				}
			}
		}
	}
}