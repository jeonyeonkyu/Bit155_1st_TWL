/*
 
 Thread : ���μ������� �ϳ��� �ּ� ���� ����(method)
 >> stack ���� ���� �ȴ�. �������� ���� ������..    multi >>stack �������� �����ϱ�...
 
 Thread �����ϴ� ��� 
 1. Thread Ŭ������ ���-> class Test extends Thread  �̷��� �ϸ� ���ο� ���ÿ� �ö󰡼� ���غ� �ϴ°Ŵ�
    �ݵ�� Thread ������ run() �Լ��� �����ؾ��Ѵ�. 
    >> Thread �Ϲ�Ŭ������ >> ������ ��ü������ �����ϴ�.
    
 2. class Test extends Car implements Runnable  �������̽��� �����Ѵ�. 
    >> �Ϲ� Ŭ���� Thread ���� �ٸ� Ŭ������ ����ϰ� �ִ� ���......
 

 */
class Thread_1 extends Thread{ //Thread �� �߻�Ŭ������ �ƴԿ���  run() �������� �ؾ��Ѵ�.

	@Override
	public void run() { //run() �Լ� �� main �Լ��� ������ ������ �Ѵ�. == ���ο� stack �� ó�� �ö󰡴� �Լ���. 
		for(int i = 0;i<1000;i++) {
			System.out.println("Thread_1: "+ i + this.getName());//getName �� �����尡 �����ִ� �ڿ�
		}
		System.out.println("Thread_1 run() END");
	}
	
}

class Thread_2 implements Runnable{ //��� ��� ������� �ƴϴ�... �����尡 �ɼ� �ִ� ����� �������...
	//Thread_2�� �ٸ� Ŭ������ �̹� ����ؼ�..
	//class Thread_2 extends Object

	@Override
	public void run() {
		for(int i = 0;i<1000;i++) {
			System.out.println("Thread_2: "+ i );
		}
		System.out.println("Thread_2 run() END");
		
	}
	
}
public class Ex02_Multi_Thread {
	public static void main(String[] args) { //���ε� �ϳ��� �������.
		//1�� 
		Thread_1 th = new Thread_1();
		th.start();// POINT!!!!!   >>  call stack �� ���� �����ϰ� �� stack��  run() �Լ��� �÷�������� �� start() �Ѵ�. 
		
		//2��
		//�� ���� �̷��� �������̽� �����...�̷������� �ұ�? 
		//���� Thread_2�� �ٸ� Ŭ������ �̹� ����ؼ� ���� �ִٸ� ..���߻���� �ȵǱ⶧����..  ���߻�Ӷ����� ���� ����̴�.
		Thread_2 th2 = new Thread_2(); //��� Thread �ϱ��? �ƴϿ���! �����带 �����ؾ� �������.. ��� �׳� �������̽��� ������ Ŭ���� �̴�. 
		Thread thread = new Thread(th2); //Thread ��ü������ th2 �� �־��ش�. �̷��� �ϸ� ������� ����������! 
		thread.start();// POINT!!!!!   >>  call stack �� ���� �����ϰ� �� stack��  run() �Լ��� �÷�������� �� start() �Ѵ�.
		
		
		//main
		for(int i = 0;i<1000;i++) {
			System.out.println("main: "+ i );
		}
		System.out.println("Main END"); //������� ������ ������� ���Ѵ�...  ���� ���� ������ �˼� ����. ��������..Runnable .. �ټ��������� �Ե�����...
		//�������� �Լ��� ���ÿ� ����ɼ��ְ� �ϴ°ǵ�..��� ���ö�� ���� ����.. cpu�� �����ϴ°�..
		//������ �����ߴٰ� ���������� �͵� �ƴ�. 
		//�׷��� ������� �渶������ �����. �������� ���ÿ� ������ ��������...�������� ���� ������...�װ� 1�� ��..
		
		
		//���� ������ 3���� ���� ��� �ִ� ����.  ���� �� �Դٰ��� ���ÿ� ����ȴ�. 

	}

}
