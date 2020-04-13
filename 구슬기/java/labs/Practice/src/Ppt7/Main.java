package Ppt7;
import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		Process process = new Process();
		
		while(true){
			System.out.println("계산할 수식 입력");
			String str = sc.nextLine();
			String[] strArr = str.split(" ");
			String key = strArr[1];
			String num1 = strArr[0];
			String num2 = strArr[2];	
			
			if (key.equals("+")) {
				int result = process.plus(Integer.parseInt(num1), Integer.parseInt(num2));
				System.out.println(num1+"+"+num2+"="+result);
			}else if (key.equals("-")) {
				int result = process.minus(Integer.parseInt(num1), Integer.parseInt(num2));
				System.out.println(num1+"-"+num2+"="+result);
			}else if (key.equals("*")) {
				int result = process.multiply(Integer.parseInt(num1), Integer.parseInt(num2));
				System.out.println(num1+"*"+num2+"="+result);
			}else if (key.equals("/")) {
				float result = process.division(Integer.parseInt(num1), Integer.parseInt(num2));
				System.out.println(num1+"/"+num2+"="+result);
			}else{
				System.out.println("연산 값 잘 못 입력");
				break;
			}
		}
	}
}
