import javax.swing.JOptionPane;

//�ð��� ó���ϴ� �Լ��� ������ ������� ���鿹��
class WordTime extends Thread{

	@Override
	public void run() {
		for(int i = 10; i>0;i--) {
			try {
				System.out.println("�����ð�: "+i);
				sleep(1000); //1�ʰ� �ްԽǿ� ���ִٰ� ���Ͷ�.. �ణ�� �����̰� ����� �صд�.
			} catch (Exception e) {
				System.out.println(e.getMessage());

			}
		}
	}
	
}

public class Ex04_Multi_Thread_Word_Game {
	public static void main(String[] args) {
		WordTime timer = new WordTime();
		timer.start(); //stack ���� run�÷��δ� �� ����
		
		String inputdata = JOptionPane.showInputDialog("���� �Է��ϼ���");
		System.out.println("�Է°�: "+ inputdata);

	}

}
