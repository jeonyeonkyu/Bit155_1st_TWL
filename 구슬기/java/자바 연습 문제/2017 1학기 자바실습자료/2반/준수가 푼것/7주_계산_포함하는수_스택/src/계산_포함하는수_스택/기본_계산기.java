package 계산_포함하는수_스택;
import java.util.Scanner;

public class 기본_계산기 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("==계산기==");
		Scanner sc = new Scanner(System.in);
		Process PC = new Process();
		while(true){
				System.out.println("계산 할 수식 입력 (Ex 3 + 3)");
				String str = sc.nextLine();
				// split 안 문자  기준으로 나뉨, 문자열 자르기
				// 기본 제공
				String[] strArr = str.split(" ");
				
//테스트				for(int i= 0 ; i<strArr.length ; i++){
//					System.out.println(strArr[i]);
//				}
				// equals랑 문자열 자체 비교, ==는 문자의 주소 비교
				// 기본 제공
				int num1= Integer.parseInt(strArr[0]);
				int num2= Integer.parseInt(strArr[2]);
				if(strArr[1].equals("+")){
					//Integer 클래스 사용 Integer.paraseInt(문자열) 문자열 int 반환
					System.out.println(str +
							" = " + PC.plus(num1,num2));
				}else if(strArr[1].equals("-")){
					System.out.println(str +
							" = " + PC.minus(num1,num2));
				}else if(strArr[1].equals("*")){
					System.out.println(str +
							" = " + PC.multiply(num1,num2));
				}else if(strArr[1].equals("/")){
					System.out.println(str +
							" = " + PC.division(num1,num2));
				}else{
					break;
				}
		}
				
		
//	System.out.println(PC.plus(a,b));		
				
	}
}
