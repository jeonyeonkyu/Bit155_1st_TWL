package ���ڿ�����������_��������_arraysŬ����;
import java.util.Scanner;

public class �������� {
	public static void main(String[] args){
		play strobj = new play();
	}
}
/*
Scanner�� ����Ͽ� �Է�
������ȯ�� �����ϴ� DecimalManager Ŭ���� �ۼ�
�Է¹��� ���ڸ� � ������ ���� ������� 
     Ȯ���ϴ� checkDecimal() �޼ҵ带 ���� ��� �� ���
Integer Ŭ������ �̿��Ͽ� ������, ������, �������������� ��ȯ�Ͽ��� 
�Է��� ������ ȭ��� ���� ��� ������ ������ �����ϵ��� ����
����� �ش��ϴ� ������ ���
���ѷ��� ���(exit�Է� �� ���� )
*/

class play{
	public play(){
		start();
	}
	private void start(){
		Scanner sc = new Scanner(System.in);
		DecimalManager DC = new DecimalManager();
		System.out.println("*** ���� ���� ***");
		System.out.println("������ ��� ���� >> bin 1101 1111");
		System.out.println("������ ��� ���� >> oct 721 12");
		System.out.println("������ ��� ���� >> dec 912 19");
		System.out.println("�������� ��� ���� >> hex 928 ae1");
		System.out.println("���� ���� >> exit");
		while(true){
			System.out.print(">> ");
			String str = sc.nextLine();
			if(str.equals("exit")){
				System.out.println("���α׷��� ���� �մϴ�.");
				break;
			}
			String[] strarr = str.split(" ");
			DC.checkDecimal(strarr);
		}
		System.out.println("*** ���� ���� ***");
	}
}

class DecimalManager{
	//������ȯ ����
	void checkDecimal(String[] str){
		//�Է¹��� ���ڸ� � ������ ���� ������� ���ϰ� ��� �� ���
		if(str.length==3){
			if(str[0].equals("bin")){
				int result = Integer.parseInt(str[1], 2)+Integer.parseInt(str[2], 2);
				System.out.println("���� ��� >> " + Integer.toBinaryString(result));
			}else if(str[0].equals("oct")){
				int result = Integer.parseInt(str[1], 8)+Integer.parseInt(str[2], 8);
				System.out.println("���� ��� >> " + Integer.toOctalString(result));
			}else if(str[0].equals("dec")){
				int result = Integer.parseInt(str[1], 10)+Integer.parseInt(str[2], 10);
				System.out.println("���� ��� >> " + result);
			}else if(str[0].equals("hex")){
				int result = Integer.parseInt(str[1], 16)+Integer.parseInt(str[2], 16);
				System.out.println("���� ��� >> " + Integer.toHexString(result));
				
			}else{
				System.out.println("���� �Է��� ����� ���ּ���.");
			}
		}else{
			System.out.println("�����Դϴ�. �ٽ� �Է����ּ���");
		}
	}
	
}