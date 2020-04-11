package 계산_물푸기_하이로우;
import java.util.Scanner;
public class 계산_클래스 {
	public static void main(String[] args){
		Scanner sc = new Scanner(System.in);
		Plus pc1 = new Plus();
		Minus pc2 = new Minus();
		Multiplication pc3 = new Multiplication();
		Division pc4 = new Division();
		while(true){
			System.out.println("계산 할 수식 입력 (Ex 3 + 3)");
			String str = sc.nextLine();
			
			// split 안 문자  기준으로 나뉨, 문자열 자르기
			// 기본 제공
			String[] strArr = str.split(" ");
			
			int num1= Integer.parseInt(strArr[0]);
			int num2= Integer.parseInt(strArr[2]);
			if(strArr[1].equals("+")){
				pc1.setValue(num1, num2);
				System.out.println(str +
						" = " + pc1.calculate());
			}else if(strArr[1].equals("-")){
				pc2.setValue(num1, num2);
				System.out.println(str +
						" = " +pc2.calculate());
			}else if(strArr[1].equals("*")){
				pc3.setValue(num1, num2);
				System.out.println(str +
						" = " + pc3.calculate());
			}else if(strArr[1].equals("/")){
				pc4.setValue(num1, num2);
				System.out.println(str +
						" = " + pc4.calculate());
			}else{
				System.out.println("연산 값을 잘못 입력하셨습니다.");
				break;
			}
		}
	}
}

class Plus{
	int num1,num2;
	public void setValue(int num3,int num4){
		num1=num3;
		num2=num4;
	}
	public int calculate(){
		int result = num1+num2;
		return result;
	}
}
class Minus{
	int num1,num2;
	public void setValue(int num3,int num4){
		num1=num3;
		num2=num4;
	}
	public int calculate(){
		int result = num1-num2;
		return result;
	}
}
class Multiplication{
	int num1,num2;
	public void setValue(int num3,int num4){
		num1=num3;
		num2=num4;
	}
	public int calculate(){
		int result = num1*num2;
		return result;
	}
}
class Division{
	int num1,num2;
	public void setValue(int num3,int num4){
		num1=num3;
		num2=num4;
	}
	public int calculate(){
		int result = num1/num2;
		return result;
	}
}


/*int result;

public int minus(int a,int b){
	result= a-b;
	return result;
}
public int multiply(int a,int b){
	result= a*b;
	return result;
}
public double division(int a,int b){
	double result1= a/b;
	return result1;
}*/