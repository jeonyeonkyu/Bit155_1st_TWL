package 문자열문자편집기_진수계산기_arrays클래스;
import java.util.Scanner;

public class 진수계산기 {
	public static void main(String[] args){
		play strobj = new play();
	}
}
/*
Scanner를 사용하여 입력
진수변환을 관리하는 DecimalManager 클래스 작성
입력받은 숫자를 어떤 진수를 통해 계산할지 
     확인하는 checkDecimal() 메소드를 통해 계산 후 출력
Integer 클래스를 이용하여 이진수, 팔진수, 십진수십육진수 변환하여라 
입력은 오른쪽 화면과 같이 모든 진수의 덧셈이 가능하도록 구현
출력은 해당하는 진수로 출력
무한루프 사용(exit입력 시 종료 )
*/

class play{
	public play(){
		start();
	}
	private void start(){
		Scanner sc = new Scanner(System.in);
		DecimalManager DC = new DecimalManager();
		System.out.println("*** 덧셈 계산기 ***");
		System.out.println("이진수 계산 예시 >> bin 1101 1111");
		System.out.println("팔진수 계산 예시 >> oct 721 12");
		System.out.println("십진수 계산 예시 >> dec 912 19");
		System.out.println("십육진수 계산 예시 >> hex 928 ae1");
		System.out.println("종료 예시 >> exit");
		while(true){
			System.out.print(">> ");
			String str = sc.nextLine();
			if(str.equals("exit")){
				System.out.println("프로그램을 종료 합니다.");
				break;
			}
			String[] strarr = str.split(" ");
			DC.checkDecimal(strarr);
		}
		System.out.println("*** 계산기 종료 ***");
	}
}

class DecimalManager{
	//진수변환 관리
	void checkDecimal(String[] str){
		//입력받은 숫자를 어떤 진수를 통해 계산할지 정하고 계산 후 출력
		if(str.length==3){
			if(str[0].equals("bin")){
				int result = Integer.parseInt(str[1], 2)+Integer.parseInt(str[2], 2);
				System.out.println("덧셈 결과 >> " + Integer.toBinaryString(result));
			}else if(str[0].equals("oct")){
				int result = Integer.parseInt(str[1], 8)+Integer.parseInt(str[2], 8);
				System.out.println("덧셈 결과 >> " + Integer.toOctalString(result));
			}else if(str[0].equals("dec")){
				int result = Integer.parseInt(str[1], 10)+Integer.parseInt(str[2], 10);
				System.out.println("덧셈 결과 >> " + result);
			}else if(str[0].equals("hex")){
				int result = Integer.parseInt(str[1], 16)+Integer.parseInt(str[2], 16);
				System.out.println("덧셈 결과 >> " + Integer.toHexString(result));
				
			}else{
				System.out.println("진수 입력을 제대로 해주세요.");
			}
		}else{
			System.out.println("오류입니다. 다시 입력해주세요");
		}
	}
	
}