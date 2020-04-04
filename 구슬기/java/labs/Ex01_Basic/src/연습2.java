import java.util.Scanner;

public class 연습2 {

	public static void main(String[] args) {

		for (int i = 2; i <= 9; i++) {
			for (int j = 1; j <= 9; j++) {
				System.out.printf("[%d]*[%d]=[%d]\t", i, j, i * j);
			}
			System.out.println();
		}

		for (int i = 2; i <= 9; i++) {
			for (int j = 1; j <= 9; j++) {
				System.out.printf("[%d]*[%d]=[%d]\t", i, j, i * j);
			}
			System.out.println();
		}

		System.out.println();

		// Today Point : break(탈출) , continue(스킵 skip > 아래구문을 )

		for (int i = 2; i <= 9; i++) {
			for (int j = 1; j <= 9; j++) {
				if (j == i) {
					break;
				}
				System.out.printf("%s", "*");
			}
			System.out.println();
		}

		for (int i = 2; i <= 9; i++) {
			for (int j = 1; j < i; j++) {
				System.out.printf("*");
			}
			System.out.println();
		}
		
		
		for (int i = 0; i<=5; i++) {
			for(int j = 5; j > 0 ; j--) {
				if(j>i) {
					System.out.printf(" ");
				}else {
					System.out.printf("*");
				}
				
			}
			System.out.println();
		}
		
		
		
		for(int i = 0;i <5;i++) {
			for(int j = 5; i<j ; j--) {
				System.out.printf("*");
			}
			System.out.println();
		}
		System.out.println();
		
		
		for(int i = 0;i <5;i++) {
			for(int j = 5; i<j ; j--) {
				System.out.printf("*");
			}
			System.out.println();
		}
		System.out.println();
		


		//사칙 연산 계산기
		int input1 = 0;
		int input2 = 0;
		int result = 0;
		String opr = "";
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("숫자입력:");
		input1 = Integer.parseInt(sc.nextLine());
		
		System.out.print("연산기호입력 (+,-,*,/,)");
		opr = sc.nextLine();
		
		System.out.print("숫자입력:");
		input2 = Integer.parseInt(sc.nextLine());
		
		if(opr.equals("+")) {
			result = input1 + input2;
		}else if(opr.equals("-")){
			result = input1 - input2;
		}else if(opr.equals("*")){
			result = input1 * input2;
		}else if(opr.equals("/")) {
			result = input1 / input2;
		}else {
			System.out.println("잘못 입력하셨습니다.");
		}
		System.out.printf("%d %s %d = %d",input1,opr,input2,result);

		
		//      서울랜드동물원에놀러갔습니다. 동물원요금이5세미만은무료,  5 -11세까지2500원 ,12 부터는5000원입니다.
//		화면에서 나이를 입력받아 요금을 계산하여 출력하는 프로그램을 작성하시오.
//		출력예시
//		>나이를입력하세요:   
//	    3입장료는무료입니다.
//	        나이를입력하세요:   
//	    7입장료는2500원입니다.
//	        나이를입력하세요:   
//	    22입장료는5000원입니다.
		
		//서울랜드 동물원
		int age = 0;
		
		age = Integer.parseInt(sc.nextLine());
		
		if(age <5) {
			System.out.println("입장료는 2500 입니다.");
		}else if(age <=11) {
			System.out.println("입장료는5000 입니다.");
		}else {
			System.out.println("입장료는 무료 입니다.");
		}
		
	}
	

}
