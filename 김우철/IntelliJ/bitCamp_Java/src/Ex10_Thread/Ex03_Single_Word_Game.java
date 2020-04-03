package Ex10_Thread;

import javax.swing.JOptionPane;

//단어 맞추기 게임
//구구단 게임
//일정 시간 ... 시간 ..흘러
//문제 맞추어서 ....
public class Ex03_Single_Word_Game {
	public static void main(String[] args) {
		String inputdata = JOptionPane.showInputDialog("값을 입력하세요");
		System.out.println("입력값 : " + inputdata);
		timer();

	}
	static void timer() {
		for(int i  = 10 ; i > 0 ; i--) {
			try {
				System.out.println("남은 시간 : " + i);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}

}
