import kr.or.bit.Cinema1;

public class Quiz_Cinema {

	public static void main(String[] args) {
//		Cinema cinema1 = new Cinema(); //default 값 시네마 (좌석 3행 5열) 
//		cinema1.showMenu();
		Cinema1 cinema2 = new Cinema1(5,5); //시네마 공간을 임의적으로 만듬(좌석 5행 5열)
		cinema2.showMenu();
	} // 최종수정본 

}
