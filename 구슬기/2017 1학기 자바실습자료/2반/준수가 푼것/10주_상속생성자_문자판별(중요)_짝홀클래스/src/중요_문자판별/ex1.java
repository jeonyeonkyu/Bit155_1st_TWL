package 중요_문자판별;
import java.util.Scanner;
import java.util.*;
public class ex1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		
		Encryption out = new Encryption();
		boolean flag=true;
		String line;
		while(flag){
			System.out.println("문자열 입력 : ");
			line = sc.next();
			String[] strArr = line.split("");
			for(int i=0;i<strArr.length;i++){
				if(strArr[i].matches("^[ㄱ-ㅎ가-힣]*$")){
				}else if(strArr[i].matches("^[a-zA-Z]*$")){
				}else if(strArr[i].matches("^[0-9]*$")){
				}else{
					System.out.println("프로그램을 종료합니다.");
					flag=false;
					break;
				}
			}
			if(!flag)break;
			System.out.print("암호화 결과 : ");
			for(int i=0;i<strArr.length;i++){
				if(strArr[i].matches("^[ㄱ-ㅎ가-힣]*$")){
					out.encryption(strArr[i]);
				}else if(strArr[i].matches("^[a-zA-Z]*$")){
					out.encryption(strArr[i]);
				}else if(strArr[i].matches("^[0-9]*$")){
					out.encryption(Integer.parseInt(strArr[i]));
				}else{
					System.out.println("프로그램을 종료합니다.");
					flag=false;
				}
			}
			System.out.println();
		}
		
		
		
	}

}



class Encryption{
	
	public void encryption(int i){
		System.out.print(1);
	}
	public void encryption(String a){
		if(a.matches("^[a-zA-Z]*$")){
			System.out.print(2);
		}else if(a.matches("^[ㄱ-ㅎ가-힣]*$")){
			System.out.print(0);
		}
	}
}