package 계산_포함하는수_스택;
import java.util.Scanner;


public class 스택 {
	public int index=0;
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		while(true){
			System.out.println("현재 스택의 크기는 " + size +" 입니다.");
			System.out.println("메뉴");
			System.out.println("1. Push, 2. Pop, 3. 종료");
			int i = sc.nextInt();
			STK save = new STK();
			int[100] stack;
			
			int[] st;
			switch(i){
				case 1 :
					System.out.println("숫자 입력");
					int number = sc.nextInt();
					st = save.Push(number);
					break;
				case 2 :
					st = save.Pop();
					break;
				case 3 :
					break;
				default :
					System.out.println("잘못 입력하셨습니다.");
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

