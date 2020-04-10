import javax.swing.JOptionPane; //원래 자바도...메모장같은거,계산기 ,그림판같은거 만들 수 있다..하지만 더이상지원하지않는다. 이젠 C or C#으로 만든다. 이젠  자바를 배운다==웹을한다. 

//단어 맞추기 게임
//구구단 게임
//일정시간...이 주어지고.. 시간이 지나면 게임이 종료된다.
//문제도 맞춰야한다. 

//시간지나가는 함수
//값 입력하는 함수  두개를 동시에 돌리고싶다.

public class Ex03_Single_Word_Game {
	public static void main(String[] args) {
		String inputdata = JOptionPane.showInputDialog("값을 입력하세요"); //학습용으로는 쓸만하다. 
		System.out.println("입력값: "+ inputdata);
		timer();

	}
	static void timer() {
		for(int i = 10; i>0;i--) {
			try {
				System.out.println("남은시간: "+i);
			} catch (Exception e) {
				System.out.println(e.getMessage());

			}
		}
	}

}
