package �߿�_�����Ǻ�;
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
			System.out.println("���ڿ� �Է� : ");
			line = sc.next();
			String[] strArr = line.split("");
			for(int i=0;i<strArr.length;i++){
				if(strArr[i].matches("^[��-����-�R]*$")){
				}else if(strArr[i].matches("^[a-zA-Z]*$")){
				}else if(strArr[i].matches("^[0-9]*$")){
				}else{
					System.out.println("���α׷��� �����մϴ�.");
					flag=false;
					break;
				}
			}
			if(!flag)break;
			System.out.print("��ȣȭ ��� : ");
			for(int i=0;i<strArr.length;i++){
				if(strArr[i].matches("^[��-����-�R]*$")){
					out.encryption(strArr[i]);
				}else if(strArr[i].matches("^[a-zA-Z]*$")){
					out.encryption(strArr[i]);
				}else if(strArr[i].matches("^[0-9]*$")){
					out.encryption(Integer.parseInt(strArr[i]));
				}else{
					System.out.println("���α׷��� �����մϴ�.");
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
		}else if(a.matches("^[��-����-�R]*$")){
			System.out.print(0);
		}
	}
}