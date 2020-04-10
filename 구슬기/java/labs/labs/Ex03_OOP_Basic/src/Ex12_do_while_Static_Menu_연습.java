import java.util.Scanner;

//오늘 점심 메뉴는 주제...

public class Ex12_do_while_Static_Menu_연습 {
	//상단에는 ..일반적으로 변수를 만듦( 고유, 상태, 부품(참조:클래스))
	static Scanner sc = new Scanner(System.in); //부품(참조:클래스)
	
	//기능 
	static void inputRecord() {
		System.out.println(" 편의점"); 
	}
	static void deleteRecord() {
		System.out.println(" 분식집 ");
	}
	static void sortRecord() {
		System.out.println(" 삼겹살");
	}
	
	
	static int displayMenu() {
		System.out.println("******************");
		System.out.println("****오늘 메뉴선정****");
		System.out.println("1.0~ 4999원");
		System.out.println();
		System.out.println("2.5000~ 9999원 ");
		System.out.println();
		System.out.println("3.10000원 이상");
		System.out.println();
		System.out.println("4.프로그램 종료");
		System.out.println();
		
		
		
	 int menu = 0;
		do {  //do while 은 내가 원하는 값을 입력받을때까지 계속 돌린다. 
			try {
				System.out.println("금액을 입력하세요");
				menu = Integer.parseInt(sc.nextLine());
			if(0<= menu && menu > 5000 ) {
				break; //while 문 탈출(1<=menu <=4)
			}else if(5000<= menu && menu < 10000) {
				break;
			}else if(menu > 10000 ) {
				break;
			}else {
				//1보다 작거나 4보다 큰 값이 들어와도 프로그램적인 오류 아님. 
				//나는 오류로 보겠다(오류 사용자 강제)
				//System.out.println("잘못 입력 하셨습니다.");
				throw new Exception("금액이 잘못 되었습니다");
				
				//원래는 오류가 나면 죽는 프로그램인데
				//죽지말고 일단 흘러가라고 하는것이 예외처리 이다. 예외를 해결하는게 아니다.
				
			}
				
			}catch(Exception e){
				System.out.println(e.getMessage());  //"메뉴 선택 번호가 잘못 되었습니다" 이걸 출력하기위한함수다
				System.out.println("금액 문제 발생");
				System.out.println("메뉴 1~4번까지 입력");
				
			}
			
			
			
			
		}while(true); 
		
		//실행 : 사용자가 1부터 4까지 번호중에서 하나를 선택한것.(while 문 을 나온다는 것은)
		
		return menu;
	}
	///////////////////////////////////////////////////////////////////////////////////
	
	
	public static void main(String[] args) {
		//Ex11_do_while_Menu ex11 = new Ex11_do_while_Menu();
		
		while(true) {
			switch(Ex12_do_while_Static_Menu_연습.displayMenu()) {
			case 1 : inputRecord();
				break;
			case 2: deleteRecord();
				break;
			case 3: sortRecord();
				break;
			case 4: System.out.println("프로그램 종료");
			      //return;  // main 종료
			System.exit(0);  //프로그램 을 강제 종료(kill)
				
			}
		}
		

	}

}

