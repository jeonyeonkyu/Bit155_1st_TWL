package ���������;
import java.util.Scanner;
import java.util.Random;


public class Ex2 {
	public static void main(String[] args){
		Scanner sc = new Scanner(System.in);
		Random rd = new Random();
		int a  = rd.nextInt(2)+1;
		int b  = rd.nextInt(2)+1;
		//1 int 2 string
		System.out.println("Main Process Class ������ ����");
		System.out.println("�����Դϴ�.");
		System.out.println(" �Է¹�� : 3 + 3");
		System.out.println("�Է¹ٶ�!!");
		String line = sc.nextLine();
		// split �� ����  �������� ����, ���ڿ� �ڸ���
		// �⺻ ����
		String[] strArr = line.split(" ");
		//�����°� ����
		//�ǿ��ܻ� �տ��ִ� ���� => ��Ʈ�� ���� ��Ʈ���� ���� ==> 1 or 2
		//�� 4���� ��� int int, int str, str int, str str
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
			System.out.println("���� ���� �߸� �Է��ϼ̽��ϴ�.");
		}
	}
}




