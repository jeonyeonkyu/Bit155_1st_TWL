package ¦ȦŬ����;
import java.util.Random;
public class ex3 {
	public static void main(String[] args){
		int[] a = new int[10];
		Random rd = new Random();
		evenNumber num = new evenNumber();

		System.out.println("Ȧ / ¦ �Ǻ�");
		for(int i=0; i<10; i++){
			a[i] = rd.nextInt(100)+1;
			num.process(a[i]);
		}
	}
}


class oddNumber{
	//Ȧ�� ���
	public void printInfo(int num){
		System.out.println(num + " : " + "Ȧ�� �Դϴ�.");
	}
}

class evenNumber extends oddNumber{
	public evenNumber(){
	}
	//Ȧ¦ �Ǻ�
	public void process (int num){
		if(num%2==0){
			printInfo(num);
		}else{
			super.printInfo(num);
		}
	}
	public void printInfo(int num){
		System.out.println(num + " : " + "¦�� �Դϴ�.");
	}
}
