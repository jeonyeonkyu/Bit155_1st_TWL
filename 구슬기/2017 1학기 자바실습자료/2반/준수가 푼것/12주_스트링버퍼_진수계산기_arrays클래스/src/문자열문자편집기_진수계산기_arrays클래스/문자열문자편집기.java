package ���ڿ�����������_��������_arraysŬ����;

import java.util.Scanner;

public class ���ڿ����������� {
	public static void main(String[] args){
		Managerplay mp = new Managerplay();
	}
}

class Managerplay{
	public Managerplay(){
		player();
	}
	private void player(){
		System.out.println("=====���� ������=====");
		Scanner sc = new Scanner(System.in);
		StringManager strm = new StringManager();
		while(true){
			System.out.println("��带 �����Ͻÿ�(1 = �Է¸�� / 2 = ��¸�� / 3 = ����)");
			int i = sc.nextInt();
			if(i==3){
				System.out.println("�ý����� �����մϴ�.");
				break;
			}else if(i==1){
				strm.InputString();
			}else if(i==2){
				strm.PrintString();
			}else{
				System.out.println("�峭ġ�� ������!");
			}
		}
	}
}
class StringManager{
	private static Scanner sc = new Scanner(System.in); 
	static StringBuffer str = new StringBuffer();
	void InputString(){
		//���⼭ sc.nextInt �ϰ� Line�ϸ� ����! sc��ü�� Int ���� flush�� ���������
		System.out.println("���ڸ� �Է��Ͻÿ� !");
		str.append(sc.nextLine()+"\n");
	}
	void PrintString(){
		System.out.println(str);
	}
}
