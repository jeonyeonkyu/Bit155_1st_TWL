import java.util.Scanner;

import kr.or.bit.Sofa;



public class Ex20_Program {
	//상단에는 ..일반적으로 변수를 만듦( 고유, 상태, 부품(참조:클래스))
	static Scanner sc = new Scanner(System.in); //부품(참조:클래스)
	
	//기능 
	static void option1() {
		System.out.println("색상 "); 
	}
	static void option2() {
		System.out.println("색상 ,다리추가 ");
	}
	static void option3() {
		System.out.println("색상, 다리추가, 가죽변경 ");
	}
	static void option4() {
		System.out.println("색상, 다리추가 , 가죽변경, 스툴추가 ");
	}
	
	
	static int displayMenu() {
		System.out.println("**************");
		System.out.println("****소파소파****");
		System.out.println("1.소파 +컬러변경");
		System.out.println();
		System.out.println("2.소파 +컬러변경 +다리추가");
		System.out.println();
		System.out.println("3.소파 +컬러변경 +다리추가 +가죽변경");
		System.out.println();
		System.out.println("4.소파 +컬러변경 +다리추가 +가죽변경 + 스툴추가");
		System.out.println();
		
		
		
		
		int menu = 0;
		
		
		//실행 : 사용자가 1부터 4까지 번호중에서 하나를 선택한것.(while 문 을 나온다는 것은)
		
		return menu;
	}
	
	public static void main(String[] args) {
		//Ex11_do_while_Menu ex11 = new Ex11_do_while_Menu();
		
		while(true) {
			switch(Ex20_Program.displayMenu()) {
			case 1: option1();
				break;
			case 2: option2();
				break;
			case 3: option3();
				break;	
			case 4: option4();
				
			}
			return;
			
		}

	}

}
