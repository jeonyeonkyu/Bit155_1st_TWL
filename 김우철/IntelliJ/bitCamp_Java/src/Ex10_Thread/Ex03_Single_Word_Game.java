package Ex10_Thread;

import javax.swing.JOptionPane;

//�ܾ� ���߱� ����
//������ ����
//���� �ð� ... �ð� ..�귯
//���� ���߾ ....
public class Ex03_Single_Word_Game {
	public static void main(String[] args) {
		String inputdata = JOptionPane.showInputDialog("���� �Է��ϼ���");
		System.out.println("�Է°� : " + inputdata);
		timer();

	}
	static void timer() {
		for(int i  = 10 ; i > 0 ; i--) {
			try {
				System.out.println("���� �ð� : " + i);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}

}
