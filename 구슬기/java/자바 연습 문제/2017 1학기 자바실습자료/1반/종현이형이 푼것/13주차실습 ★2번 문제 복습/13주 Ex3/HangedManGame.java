import java.util.Scanner;
import java.util.Random;
public class HangedManGame extends Words {
	
	Random rn = new Random();
	Scanner sc = new Scanner(System.in);

	Words w = new Words();
	
	String[] words = {"java", "import", "class", "public", "private", 
			"overloading", "method", "inheritance", "encapsulation","polymorphism"};

	public void start() {
		// TODO Auto-generated method stub

			String question = "";
			String user_question = "";
			String Char = "";
			System.out.println("===�ٸǰ���===");
			System.out.println("---�� 15���� ��ȸ�� �ֽ��ϴ�---");

			int number = rn.nextInt(10);
			question = words[number];

			for (int i = 0; i < question.length(); i++) {
				user_question = user_question + "_";
			}

			for (int i = 15; i > 0 ; i--) {
				System.out.print("(���� ��ȸ : "+ i+ "��)");
				String temp = "";
				System.out.println(user_question);
				System.out.print("�ܾ �Է��ϼ��� : ");
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
					System.out.println(user_question + "�����Դϴ�.");
					return;
				}
			}
			System.out.println(user_question + "������ �ƴմϴ�.");

		}
	}
