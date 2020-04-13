package 계산_물푸기_하이로우;
import java.util.Random;
import java.util.Scanner;

public class 하이로우게임_클래스 {
	public static void main(String[] args){
		HighLowGame game = new HighLowGame();
		System.out.println("---High Low Game Start---");
		int Cnum=game.setComNumber();
		System.out.println("컴퓨터 숫자가 결정되었습니다.");
		
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
		System.out.print("사용자 숫자 입력 : ");
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
				System.out.println(num1 + "보다 작은 숫자입니다.");
			}
			else{
				System.out.println(num1 + "보다 큰 숫자입니다.");
			}
			return false;
		}
	}
	
	void endGame(){
		System.out.println(setnum + "정답입니다.");
		System.out.println(count + "번째에 맞추셨습니다.");
	}
}