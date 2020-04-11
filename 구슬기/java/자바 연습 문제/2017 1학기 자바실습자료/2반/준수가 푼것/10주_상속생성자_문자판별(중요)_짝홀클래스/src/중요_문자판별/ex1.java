package Áß¿ä_¹®ÀÚÆÇº°;
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
			System.out.println("¹®ÀÚ¿­ ÀÔ·Â : ");
			line = sc.next();
			String[] strArr = line.split("");
			for(int i=0;i<strArr.length;i++){
				if(strArr[i].matches("^[¤¡-¤¾°¡-ÆR]*$")){
				}else if(strArr[i].matches("^[a-zA-Z]*$")){
				}else if(strArr[i].matches("^[0-9]*$")){
				}else{
					System.out.println("ÇÁ·Î±×·¥À» Á¾·áÇÕ´Ï´Ù.");
					flag=false;
					break;
				}
			}
			if(!flag)break;
			System.out.print("¾ÏÈ£È­ °á°ú : ");
			for(int i=0;i<strArr.length;i++){
				if(strArr[i].matches("^[¤¡-¤¾°¡-ÆR]*$")){
					out.encryption(strArr[i]);
				}else if(strArr[i].matches("^[a-zA-Z]*$")){
					out.encryption(strArr[i]);
				}else if(strArr[i].matches("^[0-9]*$")){
					out.encryption(Integer.parseInt(strArr[i]));
				}else{
					System.out.println("ÇÁ·Î±×·¥À» Á¾·áÇÕ´Ï´Ù.");
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
		}else if(a.matches("^[¤¡-¤¾°¡-ÆR]*$")){
			System.out.print(0);
		}
	}
}