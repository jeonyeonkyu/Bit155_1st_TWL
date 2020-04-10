import java.util.Scanner;

public class AdditionProgram {
	boolean isRun = true;
	Scanner sc = new Scanner(System.in);
	
	Calculator cal;
	String[]  strInputs;

	void printInfo(){
		
		System.out.println("이진수 계산 예시 >> bin 1101 1111");
		System.out.println("팔진수 계산 예시 >> oct 721 12");
		System.out.println("십진수 계산 예시 >> dec 912 19");
		System.out.println("십육진수 계산 예시 >> hex 928 ae1");
		System.out.println("종료 예시 >> exit");
		
	}
	public void programStart() {
		// TODO Auto-generated method stub
		String strInput;
		System.out.println("=== 뎃셈 계산기 ===");
		
		printInfo();
		while(isRun){
			System.out.print(">> ");
			strInput = sc.nextLine();
			strInputs = strInput.split(" ");
			
			if(strInput.startsWith("bin")){
				cal = new BinaryCal();
			}
			else if(strInput.startsWith("oct")){
				cal = new OctalCal();
			}
			else if (strInput.startsWith("dec")){
				cal = new Calculator();
			}
			else if( strInput.startsWith("hex")){
				cal = new HexadecimalCal();
			}
			else if (strInput.equals("exit")){
				programEnd();
			}
			else {
				System.out.println("입력오류. 다시 입력하세요");
				
			}
			
			if(strInputs.length == 3)
				procedures();
			
			
			
		}
		
	}
	
	void procedures(){
		
		cal.transNumbers(strInputs[1], strInputs[2] );
		cal.addNumbers();
		System.out.print("덧셈결과 >>");
		cal.printResult();
		
	}
	void programEnd(){
		System.out.println("프로그램을 종료합니다.");
		System.out.println("=== 계산기 종료 ===");
		isRun = false;
	}
	
	
	

}
