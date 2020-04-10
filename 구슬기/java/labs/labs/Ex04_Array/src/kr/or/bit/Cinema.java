package kr.or.bit;

import java.util.Scanner;

public class Cinema {
	private int[][] seats;
	private Scanner scanner;
	
	public void selectMovie() {
		while (true) {
			String res =showMainOpen(scanner);
			switch (res) {
			case "1":
				
					showSeat();
				
				break;
			case "2": // ���α׷� ���� : return (�Լ� Ż��), System.exit(0), �� ��
				System.out.println("Good Luck^^");
				// break �ϰԵǸ� �� �ȾƳ��� ���������� �ٽ� ����. ������ ����ġ Ż���ϴ� �극��ũ�ϸ� ���Ϲ��� ������. ������ Ư���� ������.(��
								// �̸��� �������)
			default:
				System.out.println("Not in Operation~~");
				break;
			}
		}
		
	}
	
	private String showMainOpen(Scanner sc) {
		System.out.println("******************");
		System.out.println("***Cinema ccccc***");
		System.out.println("******************");
		System.out.println("*1. ��ȭ�����ϱ� ^^****");
		System.out.println("*2. ������  ���ؿ� ^^!***");
		System.out.println("******************");
		System.out.println("���ϴ� �۾� ��ȣ�� �Է��ϼ���:");
		String res = sc.nextLine();
		return res;
		
	}
	
	private void showSeat() {
		String[][] seat = new String[3][5];
		for(int i = 0 ; i < seat.length; i++) {
			for(int j = 0 ; j < seat[i].length ; j++ ) {
				seat[i][j] ="___";
			}
		}
		for(int i = 0 ; i < seat.length; i++) {
			for(int j = 0 ; j < seat[i].length ; j++ ) {
				System.out.printf("[%s]",seat[i][j].equals("___") ? "�ڸ�":"����");
			}
			System.out.println();
		}
	}
	

}
