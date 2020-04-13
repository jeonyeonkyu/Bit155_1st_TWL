package 계산_물푸기_하이로우;
import java.util.Random;


public class 물채우기푸기_클래스 {
	public static void main(String[] args){
		Filler plus = new Filler();
		Drainer minus = new Drainer();
		Jar wt = new Jar();
		boolean flag=false;
		int count = 0;
		
		System.out.println("== 물 채우기&푸기 게임==");
		while(!flag){
			count++;
			System.out.println(count+ "번째 턴");
			plus.fillWater();
			minus.drainWater();
			wt.printAmount();
			System.out.println(count+ "번째 턴 종료!");
			if(Jar.water>=100){
				System.out.println("## 물을 채우는 팀이 승리하였습니다. ##");
				flag=true;
			}
			else if(Jar.water<=0){
				System.out.println("## 물을 푸는 팀이 승리하였습니다. ##");
				flag=true;
			}
		}
	}
}


class Jar{
	static int water = 50;
	
	public void printAmount(){
		System.out.println("현재 물의 양은 "+water+"리터 입니다.");
	}
}

class Filler{
	Random rd = new Random();
	void fillWater(){
		int watering = rd.nextInt(10)+1;
		System.out.println(watering+"리터의 물을 채웠습니다...");
		Jar.water += watering;
	}
}

class Drainer{
	Random rd = new Random();
	void drainWater(){
		int watering = rd.nextInt(10)+1;
		System.out.println(watering+"리터의 물을 뺐습니다...");
		Jar.water -= watering;
	}
}

