package 문자열문자편집기_진수계산기_arrays클래스;

import java.util.Scanner;

public class 문자열문자편집기 {
	public static void main(String[] args){
		Managerplay mp = new Managerplay();
	}
}

class Managerplay{
	public Managerplay(){
		player();
	}
	private void player(){
		System.out.println("=====문자 편집기=====");
		Scanner sc = new Scanner(System.in);
		StringManager strm = new StringManager();
		while(true){
			System.out.println("모드를 선택하시오(1 = 입력모드 / 2 = 출력모드 / 3 = 종료)");
			int i = sc.nextInt();
			if(i==3){
				System.out.println("시스템을 종료합니다.");
				break;
			}else if(i==1){
				strm.InputString();
			}else if(i==2){
				strm.PrintString();
			}else{
				System.out.println("장난치지 마세요!");
			}
		}
	}
}
class StringManager{
	private static Scanner sc = new Scanner(System.in); 
	static StringBuffer str = new StringBuffer();
	void InputString(){
		//여기서 sc.nextInt 하고 Line하면 에러! sc객체에 Int 값을 flush로 지워줘야함
		System.out.println("문자를 입력하시오 !");
		str.append(sc.nextLine()+"\n");
	}
	void PrintString(){
		System.out.println(str);
	}
}
