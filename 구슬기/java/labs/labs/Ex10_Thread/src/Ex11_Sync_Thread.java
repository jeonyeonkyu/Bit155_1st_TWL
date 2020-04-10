//���� ���¸� �ϳ� ������ �ִ�.
//���� ���¸� ���� �Ա� ��� ������ �Ѵ�.

//ģ�� 3���� �Ȱ��� ī�带 3�� ����
//���ÿ� ����ϱ� ( ���� ���¿���)

//���� 1000 ��������
//ATM ��� ��� �Ѵٰ� ����

class Account{
	int balance = 1000; //�ܾ� ����
	
	//������ �Ѹ��̶� ���� withDraw  �� ������ �۾��� ���������� LOCK �� �ɾ�α�
	//synchronized
	
	synchronized void withDraw(int money) {
		System.out.println("��: "+ Thread.currentThread().getName()); //���� �۵��ϴ� �������� �̸�
		System.out.println("���� �ܾ� : "+ this.balance);
		
		if(this.balance >=money) {
			try {
				Thread.sleep(1000); //����( ����� ����, ���...�ð��� �ɸ���.)
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			this.balance -= money;
		}
		System.out.println("����ݾ�: "+money);
		System.out.println("���� �� �ܾ�: "+ this.balance);
	}
}

class Bank implements Runnable{
	Account acc = new Account(); //������ ���¸� ������ �ִ�.
	

	@Override
	public void run() {
		while(acc.balance >0) {
			int money = ((int)(Math.random()*3)+1)*100;
			acc.withDraw(money);  //�����ϰ� ���� 100,200,300 �� 1000���� ����. 
		}
		
	}
	
}
public class Ex11_Sync_Thread {
	public static void main(String[] args) {
		Bank bank = new Bank();  //������ �����  ..������ 1����. 
		
		Thread th = new Thread(bank,"park"); //�ּҸ� �־���
		Thread th2 = new Thread(bank,"kim");
		Thread th3 = new Thread(bank,"lee");
		
		th.start(); //run()���۵�
		th2.start();
		th3.start();
		
		

	}

}
