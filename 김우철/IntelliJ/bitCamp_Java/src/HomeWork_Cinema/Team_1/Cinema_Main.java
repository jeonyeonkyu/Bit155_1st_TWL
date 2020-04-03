package HomeWork_Cinema.Team_1;
public class Cinema_Main {

	public static void main(String[] args) {
		Cinema cine = new Cinema();
		
		while(true) {
			switch(cine.CineMain()) {
			case 1: cine.printSeatsInfo();
				break;
			case 2: cine.seatChoice();
				break;
			case 3: cine.seatCancle();
				break;
			case 4: System.out.println("���α׷��� �����մϴ�.");
				return;

			}
		}


	}

}
