import javax.swing.JOptionPane;
//�ϼ����Ѻ���.


/*
 
 main�Լ� ������ Thread 2�� ����
1.�ð�(time) �����ϴ� Thread 
2.
 
 */
class WordTime2 extends Thread{

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
class Input extends Thread{
	static String inputdata;

	@Override
	public void run() {
		
		
		 inputdata = JOptionPane.showInputDialog("���� �Է��ϼ���");
		System.out.println("�Է°�: "+ inputdata);

	}
	
}
public class Ex05_WordGame {

	public static void main(String[] args) {
//		WordTime2 timer = new WordTime2();
//		timer.start(); //stack ���� run�÷��δ� �� ����
//		
//		Input w = new Input();
//		w.start();
//		
		while(true){
			WordTime2 timer = new WordTime2();
			timer.start(); //stack ���� run�÷��δ� �� ����
			
			Input w = new Input();
			w.start();
			if(!w.equals(null)) {
//				;
			}
		}


	}
	
}
