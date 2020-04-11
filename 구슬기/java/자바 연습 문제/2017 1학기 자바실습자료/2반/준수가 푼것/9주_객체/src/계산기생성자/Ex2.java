package 계산기생성자;
import java.util.Scanner;
import java.util.Random;


public class Ex2 {
	public static void main(String[] args){
		Scanner sc = new Scanner(System.in);
		Random rd = new Random();
		int a  = rd.nextInt(2)+1;
		int b  = rd.nextInt(2)+1;
		//1 int 2 string
		System.out.println("Main Process Class 생성자 생성");
		System.out.println("계산기입니다.");
		System.out.println(" 입력방식 : 3 + 3");
		System.out.println("입력바람!!");
		String line = sc.nextLine();
		// split 안 문자  기준으로 나뉨, 문자열 자르기
		// 기본 제공
		String[] strArr = line.split(" ");
		//나누는거 맞음
		//피연잔사 앞에있는 숫자 => 인트로 줄지 스트링을 줄지 ==> 1 or 2
		//총 4가지 경우 int int, int str, str int, str str
		if(a==1 && b==1){
			System.out.println("value1 : int, value2 : int");
			Calc cal = new Calc(Integer.parseInt(strArr[0]),strArr[1],Integer.parseInt(strArr[2]));
		}else if(a==1 && b==2){
			System.out.println("value1 : int, value2 : String");
			Calc cal = new Calc(Integer.parseInt(strArr[0]),strArr[1],strArr[2]);
		}else if(a==2 && b==1){
			System.out.println("value1 : String, value2 : int");
			Calc cal = new Calc(strArr[0],strArr[1],Integer.parseInt(strArr[2]));
		}else{
			System.out.println("value1 : String, value2 : String");
			Calc cal = new Calc(strArr[0],strArr[1],strArr[2]);
		}
	}

}


class Calc{
	int num1;
	String mid;
	int num2;
	Calc(int a,String b,int c){
		this.num1=a;
		mid=b;
		this.num2=c;
		print();
	}
	Calc(int a,String b,String c){
		this.num1=a;
		mid=b;
		this.num2=Integer.parseInt(c);
		print();
	}
	Calc(String a,String b,int c){
		this.num1=Integer.parseInt(a);
		mid=b;
		this.num2=c;
		print();
	}
	Calc(String a,String b,String c){
		this.num1=Integer.parseInt(a);
		mid=b;
		this.num2=Integer.parseInt(c);
		print();
	}
	private void print(){
		if(mid.equals("+")){
			int result = num1+num2;
			System.out.println("(value1 : "+num1+")"+ mid + "(value2 : " +num2+")"
					+ " = " + result);
		}else if(mid.equals("-")){
			int result = num1-num2;
			System.out.println("(value1 : "+num1 + mid + "(value2 : " +num2+")"
					+ " = " + result);
		}else if(mid.equals("*")){
			int result = num1*num2;
			System.out.println("(value1 : "+num1 + mid + "(value2 : " +num2+")"
					+ " = " + result);
		}else if(mid.equals("/")){
			int result = num1/num2;
			System.out.println("(value1 : "+num1 + mid + "(value2 : " +num2+")"
					+ " = " + result);
		}else{
			System.out.println("연산 값을 잘못 입력하셨습니다.");
		}
	}
}




