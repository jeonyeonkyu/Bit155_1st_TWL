package ���_��Ǫ��_���̷ο�;
import java.util.Random;


public class ��ä���Ǫ��_Ŭ���� {
	public static void main(String[] args){
		Filler plus = new Filler();
		Drainer minus = new Drainer();
		Jar wt = new Jar();
		boolean flag=false;
		int count = 0;
		
		System.out.println("== �� ä���&Ǫ�� ����==");
		while(!flag){
			count++;
			System.out.println(count+ "��° ��");
			plus.fillWater();
			minus.drainWater();
			wt.printAmount();
			System.out.println(count+ "��° �� ����!");
			if(Jar.water>=100){
				System.out.println("## ���� ä��� ���� �¸��Ͽ����ϴ�. ##");
				flag=true;
			}
			else if(Jar.water<=0){
				System.out.println("## ���� Ǫ�� ���� �¸��Ͽ����ϴ�. ##");
				flag=true;
			}
		}
	}
}


class Jar{
	static int water = 50;
	
	public void printAmount(){
		System.out.println("���� ���� ���� "+water+"���� �Դϴ�.");
	}
}

class Filler{
	Random rd = new Random();
	void fillWater(){
		int watering = rd.nextInt(10)+1;
		System.out.println(watering+"������ ���� ä�����ϴ�...");
		Jar.water += watering;
	}
}

class Drainer{
	Random rd = new Random();
	void drainWater(){
		int watering = rd.nextInt(10)+1;
		System.out.println(watering+"������ ���� �����ϴ�...");
		Jar.water -= watering;
	}
}

