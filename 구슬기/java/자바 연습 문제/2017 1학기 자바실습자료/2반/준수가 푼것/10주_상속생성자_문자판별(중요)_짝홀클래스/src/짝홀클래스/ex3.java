package Â¦È¦Å¬·¡½º;
import java.util.Random;
public class ex3 {
	public static void main(String[] args){
		int[] a = new int[10];
		Random rd = new Random();
		evenNumber num = new evenNumber();

		System.out.println("È¦ / Â¦ ÆÇº°");
		for(int i=0; i<10; i++){
			a[i] = rd.nextInt(100)+1;
			num.process(a[i]);
		}
	}
}


class oddNumber{
	//È¦¼ö Ãâ·Â
	public void printInfo(int num){
		System.out.println(num + " : " + "È¦¼ö ÀÔ´Ï´Ù.");
	}
}

class evenNumber extends oddNumber{
	public evenNumber(){
	}
	//È¦Â¦ ÆÇº°
	public void process (int num){
		if(num%2==0){
			printInfo(num);
		}else{
			super.printInfo(num);
		}
	}
	public void printInfo(int num){
		System.out.println(num + " : " + "Â¦¼ö ÀÔ´Ï´Ù.");
	}
}
