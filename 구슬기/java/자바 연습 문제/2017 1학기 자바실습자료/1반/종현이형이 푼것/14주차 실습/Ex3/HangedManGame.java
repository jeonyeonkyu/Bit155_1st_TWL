import java.util.Scanner;
import java.util.Random;
public class HangedManGame extends Words {
	
	Random rn = new Random();
	Scanner sc = new Scanner(System.in);

	Words w = new Words();
	
	public void start() {
		// TODO Auto-generated method stub

			String question = "";
			String user_question = "";
			String Char = "";
			System.out.println("===핵맨게임===");
			System.out.println("---총 15번의 기회가 있습니다---");

			int number = rn.nextInt(10);
			question = w.words[number];

			for (int i = 0; i < question.length(); i++) {
				user_question = user_question + "_";
			}

			for (int i = 15; i > 0 ; i--) {
				System.out.print("(남은 기회 : "+ i+ "번)");
				String temp = "";
				System.out.println(user_question);
				System.out.print("단어를 입력하세요 : ");
				Char = sc.next();
				for (int y = 0; y < question.length(); y++) {
					if (Char.equals(question.charAt(y) + "")) {
						temp = temp + Char;
					} else {
						temp = temp + user_question.charAt(y);
					}
				}

				user_question = temp;
				if (question.equals(user_question)) {
					System.out.println(user_question + "정답입니다.");
					return;
				}
			}
			System.out.println(user_question + "정답이 아닙니다.");

		}
	}
