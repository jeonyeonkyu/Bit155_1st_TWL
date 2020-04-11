package Ppt7;

import java.util.Scanner;

public class Ppt_7_2_BaseballGame {
	
	public void game() {
		Scanner sc = new Scanner(System.in);
		for(int i = 1;i<4;i++) {
		System.out.println("추측하는 " + i + "번째 숫자를 입력 : ");
		int num = Integer.parseInt(sc.nextLine());
		makeAnswer(num);
		}
	
		
	}
	
	public void makeAnswer(int iRange) {
		int[] ynum = {iRange};
	}
	public void inputAnswer() {
		
	}
	public void checkAnswer() {
		int cnum = (int) (Math.random() * 10 + 1);
		for(int i = 0;i<10;i++) {
			ynum[i] =
		}
	}
	public boolean showResult() {
		return true;
	}
	

}
