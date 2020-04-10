package kr.or.bit;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;

public class Customer {

	Scanner scanner = new Scanner(System.in);

	private String customId;
	private String customPwd; // int > String 변경
	private ArrayList<Reservation> reservation; // 예매 - 안되면 함수로..... public List<Reservation> reservation(){return
												// null};
	int row, col; // 좌석의 열과행
	String showDate; // 날짜선택

	public Customer() {

	}

	public Customer(String customId, String customPwd) {
		this.customId = customId;
		this.customPwd = customPwd;
	}// Customer End

	public void reserve(Admin admin) { // 예매함수(Admin타입으로 파라미터를받음)

		// Reservation reservation = new Reservation();

		Loop: while (true) {

			System.out.println("어떤 공연을 예매할까요?");
			System.out.println("1.발레");
			System.out.println("2.연주회");
			System.out.println("3.오페라");
			System.out.println("0.뒤로가기");
			System.out.print("원하는 메뉴 번호를 입력하세요>> ");

			String selection = scanner.nextLine().trim();
			switch (selection) {

			case "1": // 발레 선택

				System.out.println("날짜를 선택하세요:(4.1)(4.4) ");
				showDate = scanner.nextLine().trim();

				if (showDate.equals("4.1")) {
					for (int i = 0; i < admin.showselection.showList.size(); i++) {

						if (admin.showselection.showList.get(i).getShowDate().equals(showDate)) {
							while (true) {
								admin.showselection.showList.get(i).seatInfo();
								System.out.println("1~4 중 원하는 행: "); // 행 입력
								row = Integer.parseInt(scanner.nextLine()) - 1;
								System.out.println("1~5 중 원하는 열: ");
								col = Integer.parseInt(scanner.nextLine()) - 1; // 열입력

								// 예약하려는 좌석이 비어있으면 해당좌석을 자리가없다고 표현함
								if (admin.showselection.showList.get(i).seat[row][col].equals("____")) {
									admin.showselection.showList.get(i).seat[row][col] = "자리없음";
									System.out.printf("[%d]행 [%d]열 예약에 성공하셨습니다\n", row + 1, col + 1);
									break Loop;
								} else {
									System.out.println("이미 예약 되었습니다. 다시 선택해 주세요");
								}
							}
						}
					} // for문 끝

					// 4.1 입력시 for문을 돌았는데 4.1일 발레공연이 없을때 메세지 출력
					System.out.println("4.1 발레공연은 아직 개설이 안되었습니다..");
				} // if구문의 마지막

				else if (showDate.equals("4.4")) {
					for (int i = 0; i < admin.showselection.showList.size(); i++) {

						if (admin.showselection.showList.get(i).getShowDate().equals(showDate)) {
							while (true) {
								admin.showselection.showList.get(i).seatInfo();
								System.out.println("1~4 중 원하는 행: "); // 행 입력
								row = Integer.parseInt(scanner.nextLine()) - 1;
								System.out.println("1~5 중 원하는 열: ");
								col = Integer.parseInt(scanner.nextLine()) - 1; // 열입력

								// 예약하려는 좌석이 비어있으면 해당좌석을 자리가없다고 표현함
								if (admin.showselection.showList.get(i).seat[row][col].equals("____")) {
									admin.showselection.showList.get(i).seat[row][col] = "자리없음";
									System.out.printf("[%d]행 [%d]열 예약에 성공하셨습니다\n", row + 1, col + 1);
									break Loop;
								} else {
									System.out.println("이미 예약 되었습니다. 다시 선택해 주세요");
								}
							}
						}
					} // for문 끝

					// 4.2 입력시 for문을 돌았는데 4.2일 발레공연이 없을때 메세지 출력
					System.out.println("4.4  발레공연은 아직 개설이 안되었습니다..");
				} // if 구문 마지막

				else {
					System.out.println("날짜를 제대로 입력해주세요...");
				}

//				System.out.println("날짜를 선택하세요: ");
//				//날짜 선택 로직 들어갈 자리 4.2
//				System.out.println("===========좌석현황표===========");
//				//admin.showselection.showList.get(0).getSeat();
//				//임의 index
//				System.out.println("좌석선택:");
//				
//				
//				
//				int a = (int)(Math.random()*100000)+900000;
//				reservation.add(new Reservation(customId,"23",20000,a));
//				//reservation.get(0).setNum(a);
//				//여기서 index 어떻게...?
//				
//				System.out.println("예매정보 출력:"+reservation.get(0).toString());		
//				System.out.println("예매가 완료되었습니다. [예매번호: ");

//				int a = reservation.getPrice();
//				int b = admin.getTotalBalance();
//				System.out.println(b += a);
//				

				break;

			case "2": // 음악회 공연선택시
				System.out.println("날짜를 선택하세요:(4.2)(4.6)");
				showDate = scanner.nextLine().trim();

				if (showDate.equals("4.2")) {
					for (int i = 0; i < admin.showselection.showList.size(); i++) {

						if (admin.showselection.showList.get(i).getShowDate().equals(showDate)) {
							while (true) {
								admin.showselection.showList.get(i).seatInfo();
								System.out.println("1~4 중 원하는 행: "); // 행 입력
								row = Integer.parseInt(scanner.nextLine()) - 1;
								System.out.println("1~5 중 원하는 열: ");
								col = Integer.parseInt(scanner.nextLine()) - 1; // 열입력

								// 예약하려는 좌석이 비어있으면 해당좌석을 자리가없다고 표현함
								if (admin.showselection.showList.get(i).seat[row][col].equals("____")) {
									admin.showselection.showList.get(i).seat[row][col] = "자리없음";
									System.out.printf("[%d]행 [%d]열 예약에 성공하셨습니다\n", row + 1, col + 1);
									break Loop;
								} else {
									System.out.println("이미 예약 되었습니다. 다시 선택해 주세요");
								}
							}
						}
					} // for문 끝

					System.out.println("4.2 음악회공연은 아직 개설이 안되었습니다..");
				} // if구문의 마지막

				else if (showDate.equals("4.6")) {
					for (int i = 0; i < admin.showselection.showList.size(); i++) {

						if (admin.showselection.showList.get(i).getShowDate().equals(showDate)) {
							while (true) {
								admin.showselection.showList.get(i).seatInfo();
								System.out.println("1~4 중 원하는 행: "); // 행 입력
								row = Integer.parseInt(scanner.nextLine()) - 1;
								System.out.println("1~5 중 원하는 열: ");
								col = Integer.parseInt(scanner.nextLine()) - 1; // 열입력

								// 예약하려는 좌석이 비어있으면 해당좌석을 자리가없다고 표현함
								if (admin.showselection.showList.get(i).seat[row][col].equals("____")) {
									admin.showselection.showList.get(i).seat[row][col] = "자리없음";
									System.out.printf("[%d]행 [%d]열 예약에 성공하셨습니다\n", row + 1, col + 1);
									break Loop;
								} else {
									System.out.println("이미 예약 되었습니다. 다시 선택해 주세요");
								}
							}
						}
					} // for문 끝

					System.out.println("4.6 음악회공연은 아직 개설이 안되었습니다..");
				} // if 구문 마지막

				else {
					System.out.println("날짜를 제대로 입력해주세요...");
				}
				break;
			case "3": // 오페라 공연 선택시
				System.out.println("날짜를 선택하세요:(4.3)(4.5)(4.7) ");
				showDate = scanner.nextLine().trim();

				if (showDate.equals("4.3")) {
					for (int i = 0; i < admin.showselection.showList.size(); i++) {

						if (admin.showselection.showList.get(i).getShowDate().equals(showDate)) {
							while (true) {
								admin.showselection.showList.get(i).seatInfo();
								System.out.println("1~4 중 원하는 행: "); // 행 입력
								row = Integer.parseInt(scanner.nextLine()) - 1;
								System.out.println("1~5 중 원하는 열: ");
								col = Integer.parseInt(scanner.nextLine()) - 1; // 열입력

								// 예약하려는 좌석이 비어있으면 해당좌석을 자리가없다고 표현함
								if (admin.showselection.showList.get(i).seat[row][col].equals("____")) {
									admin.showselection.showList.get(i).seat[row][col] = "자리없음";
									System.out.printf("[%d]행 [%d]열 예약에 성공하셨습니다\n", row + 1, col + 1);
									break Loop;
								} else {
									System.out.println("이미 예약 되었습니다. 다시 선택해 주세요");
								}
							}
						}
					} // for문 끝

					System.out.println("4.3 오페라공연은 아직 개설이 안되었습니다..");
				} // if구문의 마지막

				else if (showDate.equals("4.5")) {
					for (int i = 0; i < admin.showselection.showList.size(); i++) {

						if (admin.showselection.showList.get(i).getShowDate().equals(showDate)) {
							while (true) {
								admin.showselection.showList.get(i).seatInfo();
								System.out.println("1~4 중 원하는 행: "); // 행 입력
								row = Integer.parseInt(scanner.nextLine()) - 1;
								System.out.println("1~5 중 원하는 열: ");
								col = Integer.parseInt(scanner.nextLine()) - 1; // 열입력

								// 예약하려는 좌석이 비어있으면 해당좌석을 자리가없다고 표현함
								if (admin.showselection.showList.get(i).seat[row][col].equals("____")) {
									admin.showselection.showList.get(i).seat[row][col] = "자리없음";
									System.out.printf("[%d]행 [%d]열 예약에 성공하셨습니다\n", row + 1, col + 1);
									break Loop;
								} else {
									System.out.println("이미 예약 되었습니다. 다시 선택해 주세요");
								}
							}
						}
					} // for문 끝

					System.out.println("4.5 오페라공연은 아직 개설이 안되었습니다..");
				} // if 구문 마지막

				else if (showDate.equals("4.7")) {
					for (int i = 0; i < admin.showselection.showList.size(); i++) {

						if (admin.showselection.showList.get(i).getShowDate().equals(showDate)) {
							while (true) {
								admin.showselection.showList.get(i).seatInfo();
								System.out.println("1~4 중 원하는 행: "); // 행 입력
								row = Integer.parseInt(scanner.nextLine()) - 1;
								System.out.println("1~5 중 원하는 열: ");
								col = Integer.parseInt(scanner.nextLine()) - 1; // 열입력

								// 예약하려는 좌석이 비어있으면 해당좌석을 자리가없다고 표현함
								if (admin.showselection.showList.get(i).seat[row][col].equals("____")) {
									admin.showselection.showList.get(i).seat[row][col] = "자리없음";
									System.out.printf("[%d]행 [%d]열 예약에 성공하셨습니다\n", row + 1, col + 1);
									break Loop;
								} else {
									System.out.println("이미 예약 되었습니다. 다시 선택해 주세요");
								}
							}
						}
					} // for문 끝

					System.out.println("4.7 오페라공연은 아직 개설이 안되었습니다..");
				} // if 구문 마지막

				else {
					System.out.println("날짜를 제대로 입력해주세요...");
				}
				break;

			case "0": // showCustomerMenu(사용자 메인 메뉴)로 돌아가기
				break Loop;

			default:
				break;
			}
		}
	}

	public void checkReserve() { // 예약 확인
		Loop1: for (int i = 0; i < reservation.size(); i++) {
			if (reservation.get(i).getCustomId().equals(customId)) {
				System.out.println("======예매 내역======");
				System.out.printf("예매번호 \t 공연종류 \t 날짜 및 시간 \t 좌석");
				System.out.printf("%d \t %s \t %d \t %d", reservation.get(i).getNum(), reservation.get(i),
						reservation.get(i).getDate(), reservation.get(i));
			} else {
				System.out.println("예매 내역이 없습니다.");
				break Loop1;
			}
		}
	}// checkReserve() End

	private void cancelReserve() { // 예약 취소

	}// cancelReserve()End

	private void delCustom() {// 계정 삭제

	}// delCustom() End

	public String getCustomId() {
		return customId;
	}

	public String getCustomPwd() {
		return customPwd;
	}

	public ArrayList<Reservation> getReservation() {
		return reservation;
	}

}// Customer End
