import java.util.Scanner;
public class ReservationSeat {
	
	Boolean isRun = true;
	Theater theater;
	int choice;
	int choiceT;
	String seat[];
	Scanner sc = new Scanner(System.in);
	
	public void Reservationseat(){
		
		System.out.println(" === �¼� ���� ���α׷� ===");
		
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
		default : System.out.println("�߸����Է��Դϴ�.");
	}
		//info();
		
	}

	public void programEnd(){
		System.out.println("���α׷��� �����մϴ�.");
		isRun = false;
	}
	
	public int info(){
		System.out.println("1. ��ȭ�� ����");
		System.out.println("2. �¼� ����");
		System.out.println("3. �¼� Ȯ��");
		System.out.println("4. ����  ");
		System.out.print("�޴��� ������ �ּ��� : ");
		choice = sc.nextInt();
		
		return choice;
		
		
	}
	
	public void choiceTheater(){
		
		System.out.print("1.�ް��ڽ� ");
		System.out.print("2.CGV ");
		System.out.println("3.�Ե��ó׸� ");
		System.out.print("��ȭ���� �������ּ��� : ");
		choiceT = sc.nextInt();
		
		switch(choiceT){
		
		case 1 : theater = new Megabox();
			     break;
		case 2 : theater = new CGV();
					break;
		case 3 : theater = new Lottecinema();
					break;
		default : System.out.println("�߸����Է��Դϴ�.");
		}
		
	}
	public void reserve(){
		
		System.out.print("�¼��� ������ �ּ���.(A-C,1-5)");
		seat = sc.next().split(",");
		theater.chRow = seat[0].charAt(0);
		theater.iCol = Integer.parseInt(seat[1]);
		theater.reserveSeat(theater.chRow,theater.iCol);		
		
		//�¼��Է� �� Theater
	}


}

