package ���_�����ϴ¼�_����;
import java.util.Scanner;


public class ���� {
	public int index=0;
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		while(true){
			System.out.println("���� ������ ũ��� " + size +" �Դϴ�.");
			System.out.println("�޴�");
			System.out.println("1. Push, 2. Pop, 3. ����");
			int i = sc.nextInt();
			STK save = new STK();
			int[100] stack;
			
			int[] st;
			switch(i){
				case 1 :
					System.out.println("���� �Է�");
					int number = sc.nextInt();
					st = save.Push(number);
					break;
				case 2 :
					st = save.Pop();
					break;
				case 3 :
					break;
				default :
					System.out.println("�߸� �Է��ϼ̽��ϴ�.");
			}
		}
	}

}
public class STK{
		public int[] Pop(){
			index--;
		}
		public int[] Push(int number){
			index++;
		}
}

