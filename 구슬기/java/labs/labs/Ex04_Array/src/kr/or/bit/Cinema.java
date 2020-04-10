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
			case "2": // 프로그램 종료 : return (함수 탈출), System.exit(0), 라벨 값
				System.out.println("Good Luck^^");
				// break 하게되면 라벨 꽂아놓은 곳에서부터 다시 돈다. 원래는 스위치 탈출하는 브레이크하면 와일문을 빠진다. 굉장히 특수한 문법임.(라벨
								// 이름은 상관없음)
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
		System.out.println("*1. 영화예매하기 ^^****");
		System.out.println("*2. 예ㅎ매  안해여 ^^!***");
		System.out.println("******************");
		System.out.println("원하는 작업 번호를 입력하세요:");
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
				System.out.printf("[%s]",seat[i][j].equals("___") ? "자리":"예매");
			}
			System.out.println();
		}
	}
	

}
