import java.util.Scanner;

public class 연습3 {

	public static void main(String[] args) {
		int a  = 0;
		int b = 0;
		int result = 0;
		String opr = "";
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("숫자입력:");
		a = Integer.parseInt(sc.nextLine());
		
		System.out.print("연산기호 입력(+,-,*,/):");
		opr = sc.nextLine();
		
		System.out.print("숫자입력:");
		b = Integer.parseInt(sc.nextLine());
		
		if(opr.equals("+")) {
			result = a + b;
		}else if(opr.equals("-")) {
			result = a - b;
		}else if(opr.equals("*")){
			result = a * b;
		}else if(opr.equals("/")) {
			result = a / b;
		}else {
			System.out.println("잘못된 입력입니다.");
			return; // 다른 것을 입력하면  그 함수를 빠져나온다.
		}
		System.out.printf("%d %s %d = %d",a,opr,b,result);
	}

}
