import java.util.Scanner;

public class Calculator {

	int iNum1, iNum2;
	char op;
	Scanner sc = new Scanner(System.in);
	boolean isRun = true;
	int result;
	
	public Calculator(){
			System.out.println("=====계산기=====");
			
	}
	public void info(){
		while (isRun == true){
		System.out.println("계산할 정수와 연산자를 다음 예와 같이 입력하시오.");
		System.out.print("예) 12 + 4 (띄어쓰기로 구분 할 것)");
		
		analisys(null);
		}
	}
	
	public void analisys(String mFormula){
		
		iNum1 = sc.nextInt();
		op = sc.next().charAt(0);
		iNum2 = sc.nextInt();
		
		if(op == '+'){
		addition(iNum1, op, iNum2);

		}
		else if(op == '-'){
		subtraction(iNum1, op, iNum2);
		}	
		else if(op == '*'){
		multiplication(iNum1, op, iNum2);
		}
		else if(op == '/'){
		division(iNum1, op, iNum2);
		}
		else if(op == '=' ){
			error(1);	
		}
		else if(op == 'ㅊ'){
			error(1);
		}
		else if (iNum2 == 0){
			error(2);
		}
		else if (op == 'c'){
			end(iNum1, op, iNum2);
		}
		else{
			error(0);
		}
	}

		
		
	
	public void addition(int iNum1, char op, int iNum2){
		
		result = iNum1 + iNum2;
		System.out.println(iNum1+"+"+iNum2+ "=" +result);
		
	}
	public void subtraction(int iNum1, char op, int iNum2){
		result = iNum1 - iNum2;
		System.out.println(iNum1+"-"+iNum2+ "=" +result);
	}
	public void multiplication(int iNum1, char op, int iNum2){
		result = iNum1 * iNum2;
		System.out.println(iNum1+"*"+iNum2+ "=" +result);
	}	
	
	public void division(int iNum1, char op, int iNum2){
		result = iNum1 / iNum2;
		System.out.println(iNum1+"/"+iNum2+ "=" +result);
	}
	public void end(int iNum1, char op, int iNum2) {
			isRun = false;
			System.out.println("계산기를 종료합니다.");
	}
	

	public void error(int errorCode) {
	
		switch (errorCode){
		
		case 0 : 
					System.out.println("형식에 맞게 다시 입력하시오.");
		case 1 :
					System.out.println("연산자를 잘못 입력하였습니다.");
		case 2 :	
					System.out.println("0으로 나눌 수 없습니다.");
		}
		
	
	}
}
