package ���_��Ǫ��_���̷ο�;
import java.util.Random;
import java.util.Scanner;

public class ���̷ο����_Ŭ���� {
	public static void main(String[] args){
		HighLowGame game = new HighLowGame();
		System.out.println("---High Low Game Start---");
		int Cnum=game.setComNumber();
		System.out.println("��ǻ�� ���ڰ� �����Ǿ����ϴ�.");
		
		boolean flag = false;
		
		while(!flag){
			int usernum;
			usernum= game.setUserNumber();
			flag = game.compareUserToCom(usernum);
		}
	}

}


class HighLowGame{
	Random rd = new Random();
	Scanner sc = new Scanner(System.in);
	static int count=0;
	static int Cnum;
	static int setnum;
	void startgame(){
		
	}
	public int setComNumber(){
		Cnum= rd.nextInt(100)+1;
		return Cnum; 
	}
	public int setUserNumber(){
		count ++;
		System.out.print("����� ���� �Է� : ");
		setnum = sc.nextInt();
		return setnum;
	}
	public boolean compareUserToCom(int num1){
		if(num1==Cnum){
			endGame();
			return true;
		}
		else{
			if(num1>Cnum){
				System.out.println(num1 + "���� ���� �����Դϴ�.");
			}
			else{
				System.out.println(num1 + "���� ū �����Դϴ�.");
			}
			return false;
		}
	}
	
	void endGame(){
		System.out.println(setnum + "�����Դϴ�.");
		System.out.println(count + "��°�� ���߼̽��ϴ�.");
	}
}