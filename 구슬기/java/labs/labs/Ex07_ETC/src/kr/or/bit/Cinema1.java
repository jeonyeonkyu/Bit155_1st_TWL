package kr.or.bit;

import java.util.Scanner;

public class Cinema1 {
	private String[][] seat;
	private Scanner sc; // 메뉴 선택
	// Scanner sc; sc 변수는 아무것도 참조하고있지않는 null 값이 default 값으로 저장되있음 초기화필요
	// NullPointerException 발생원인 : 메모리 할당을 하지 않은 상태에서 필드 또는 메소드를 참조했을 때 발생하는 에러

	private String name; //private 없었고, 이거 취소 내역에서 빼온거
	
	// default 생성자
	public Cinema1() {
		this(3, 5);
	}

	// 시네마 공간을 임의로 만드는 생성자
	public Cinema1(int num1, int num2) {
		sc = new Scanner(System.in);
		seat = new String[num1][num2];
		for (int i = 0; i < seat.length; i++) {
			for (int j = 0; j < seat[i].length; j++) {
				seat[i][j] = (i + 1) + "-" + (j + 1);
			}
		}
	}
	
	// 1. 좌석 현황
	private void seatPrint() {
		System.out.println("***********좌석 배치도***********");
		for (int i = 0; i < this.seat.length; i++) {
			for (int j = 0; j < this.seat[i].length; j++) {
				System.out.printf("[%s]",
						this.seat[i][j].equals((i + 1) + "-" + (j + 1)) ? (i + 1) + "-" + (j + 1) : "예매");
			}
			System.out.println();
		}
		System.out.println("******************************");
	}

	// 2. 예매하기
	private void reserveSeat() {
		//String name; 객체변수 써보려고 잠깐 주석
		int col, row;
		for (int i = 0; i < seat.length; i++) {
			for (int j = 0; j < seat[i].length; j++) {
				System.out.printf("[%s]", seat[i][j].equals((i+1)+"-"+(j+1)) ? (i+1)+"-"+(j+1) : "예매");
			}
			System.out.println();
		}
		do {
			try {
				System.out.print("원하는 행을 선택하세요: ");
				col = Integer.parseInt(sc.nextLine());
				System.out.print("원하는 열을 선택하세요: ");
				row = Integer.parseInt(sc.nextLine());
				System.out.print("예약자명: ");
				name = sc.next(); //여기에 아무것도 입력 안 해도 예약이 되는 게 문제
				
//				try {
//					
//					char checkname;
//					Loop1: for(int i=0; i<name.length(); i++) {
//						checkname = name.charAt(i);
//						if (checkname>=33 && checkname<=47) {
//							System.out.println("특수문자는 입력하지 마세요.");
//							break Loop1;	
//				}
				// 이름이아닌 숫자나 이상한 문자가 들어오면 다시 입력하게끔 수행하는 방법????

				// 33-47, 58-64, 91-96, 123-126 막기
				
				// nextLine??? nextInt() 메소드 다음에 nextLine() 메소드를 실행하려고 할때
				// nextLine()메소드가 그냥 넘어가버리는 오류가 생겨난다(이유는???)
				if (seat[col - 1][row - 1].equals(col + "-" + row)) { // 자리가 비어있으면 예약을함
					seat[col - 1][row - 1] = name;
					System.out.println(col + "행" + row + "열 좌석에 예약되었습니다");
					break; // 가까운 반복문을 빠져나감 즉 .. while문을 빠져나감
				} else {
					System.out.println("이미 예약된 좌석입니다.");
				}
			} catch (ArrayIndexOutOfBoundsException e) {
				System.out.println("해당 행과 열은 영화관 좌석에 없습니다...다시입력하세요");
			} catch (Exception e) { // try 구문에서 발생하는 예외를 처리함 (ex. col 에 AAA 이런 문자값이 들어가면 catch 에서 예외를 처리함)
				System.out.println("잘못된 값이 입력되었습니다.... 다시 입력하세요");
			}
		} while (true);
	}

	// 3. 예매 내역 조회
	private void showMySeat() {	
		//System.out.print("예약자명을 입력하세요: ");
		for (int i = 0; i < seat.length; i++) {
			System.out.print((i + 1) + "행\t");
			for (int j = 0; j < seat[i].length; j++) {
				System.out.print(seat[i][j]+"\t");
			}
			System.out.println();
		}
		
		System.out.println();	
	}
//		System.out.println("예약자명 입력: ");
//		name = sc.nextLine();
//		for(int i=0; i<seat.length; i++) {
//			for(int j=0; j<seat.length; j++) {
//				if(seat[i][j] == name) {
//					System.out.printf("%s님의 자리는 %d행 %열 입니다.", name, i, j);
//				} else {
//					System.out.println("망해따");
//				}
//			}
//		}	

	private int col, row;	
	// 4. 예매 내역 취소
	private void cancelSeat() { 
		//int col, row;
		int name_count; // 같은 이름이 몇번나왔는지 확인하는 변수명
		name = null; // 예약자 이름
		System.out.print("예약자 이름을 입력해 주세요: ");
		name = sc.next();
		name_count = division_name(name);
		if (name_count > 1) { // 동명이인이 있다면
			System.out.println("동명이인이 있습니다....");
			System.out.println("좌석 배치도를 보여줍니다 ... 취소할 좌석을 입력하세요 >> ");
			seatPrint();
			System.out.print("행을 선택하세요:");
			col = sc.nextInt();
			System.out.print("열을 선택하세요:");
			row = sc.nextInt();
			seat[col - 1][row - 1] = col + "-" + row;
			System.out.println("좌석 예약이 취소되었습니다"); //여기서 엉뚱한 자리를 입력해도 좌석 예약이 취소됐다고 나옴
		} else if (name_count == 1) {
			for (int i = 0; i < seat.length; i++) {
				for (int j = 0; j < seat[i].length; j++) {
					if (seat[i][j].equals(name)) {
						seat[i][j] = (i + 1) + "-" + (j + 1);
						System.out.println((i + 1) + "행 " + (j + 1) + "열 " + "좌석 예약이 취소되었습니다");
					}
				}
			}
		} else {
			System.out.println("예약된 이름이 없습니다...");
		}
	}

	// 동명이인 구별 메소드
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
	

	// 메인에서 쓸 함수
	public void showMenu() {
		while (true) {
			Scanner sc = new Scanner(System.in);
			System.out.println("===영화 예매 프로그램===");
			System.out.println("1.좌석 현황");
			System.out.println("2.예매하기");
			System.out.println("3.예매 내역 조회");
			System.out.println("4.예매 내역 취소");
			System.out.println("5.프로그램 종료");
			System.out.println("===================");
			System.out.print("1~5중 하나를 입력하세요:");
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
					System.out.println("이용해주셔서 감사합니다. <프로그램 종료>");
					return;
				default:
					System.out.println("1~5 중 하나를 입력하세요");
					break loop;
				}
			}
		}
	}
}