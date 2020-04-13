import java.util.Scanner;
public class ReservationSeat {
	
	Boolean isRun = true;
	Theater theater;
	int choice;
	int choiceT;
	String seat[];
	Scanner sc = new Scanner(System.in);
	
	public void Reservationseat(){
		
		System.out.println(" === 좌석 예약 프로그램 ===");
		
	}
	
	public void programStart(){
		
		info();

		switch(choice){
		
		case 1 : 		choiceTheater();
						break;

		case 2 :		theater.printWelcom();
						reserve();
						break;
		case 3 :		theater.checkSeat();
						break;
		case 4 :      programEnd();
						break;
		default : System.out.println("잘못된입력입니다.");
	}
		//info();
		
	}

	public void programEnd(){
		System.out.println("프로그램을 종료합니다.");
		isRun = false;
	}
	
	public int info(){
		System.out.println("1. 영화관 선택");
		System.out.println("2. 좌석 예약");
		System.out.println("3. 좌석 확인");
		System.out.println("4. 종료  ");
		System.out.print("메뉴를 선택해 주세요 : ");
		choice = sc.nextInt();
		
		return choice;
		
		
	}
	
	public void choiceTheater(){
		
		System.out.print("1.메가박스 ");
		System.out.print("2.CGV ");
		System.out.println("3.롯데시네마 ");
		System.out.print("영화관을 선택해주세요 : ");
		choiceT = sc.nextInt();
		
		switch(choiceT){
		
		case 1 : theater = new Megabox();
			     break;
		case 2 : theater = new CGV();
					break;
		case 3 : theater = new Lottecinema();
					break;
		default : System.out.println("잘못된입력입니다.");
		}
		
	}
	public void reserve(){
		
		System.out.print("좌석을 선택해 주세요.(A-C,1-5)");
		seat = sc.next().split(",");
		theater.chRow = seat[0].charAt(0);
		theater.iCol = Integer.parseInt(seat[1]);
		theater.reserveSeat(theater.chRow,theater.iCol);		
		
		//좌석입력 및 Theater
	}


}

