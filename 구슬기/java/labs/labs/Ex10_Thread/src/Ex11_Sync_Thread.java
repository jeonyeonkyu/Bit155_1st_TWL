//은행 계좌를 하나 가지고 있다.
//은행 계좌를 통해 입금 출금 업무를 한다.

//친구 3명이 똑같은 카드를 3장 복제
//동시에 출금하기 ( 같은 계좌에서)

//통장 1000 만원있음
//ATM 기기 출금 한다고 가정

class Account{
	int balance = 1000; //잔액 정보
	
	//누군가 한명이라도 먼저 withDraw  에 들어오면 작업이 끝날때까지 LOCK 를 걸어두기
	//synchronized
	
	synchronized void withDraw(int money) {
		System.out.println("고객: "+ Thread.currentThread().getName()); //현재 작동하는 쓰레드의 이름
		System.out.println("현재 잔액 : "+ this.balance);
		
		if(this.balance >=money) {
			try {
				Thread.sleep(1000); //인출( 사용자 인증, 비번...시간이 걸린다.)
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			this.balance -= money;
		}
		System.out.println("인출금액: "+money);
		System.out.println("인출 후 잔액: "+ this.balance);
	}
}

class Bank implements Runnable{
	Account acc = new Account(); //은행은 계좌를 가지고 있다.
	

	@Override
	public void run() {
		while(acc.balance >0) {
			int money = ((int)(Math.random()*3)+1)*100;
			acc.withDraw(money);  //랜덤하게 나온 100,200,300 을 1000에서 뺀다. 
		}
		
	}
	
}
public class Ex11_Sync_Thread {
	public static void main(String[] args) {
		Bank bank = new Bank();  //은행을 만들고  ..은행은 1개임. 
		
		Thread th = new Thread(bank,"park"); //주소를 넣어줌
		Thread th2 = new Thread(bank,"kim");
		Thread th3 = new Thread(bank,"lee");
		
		th.start(); //run()동작됨
		th2.start();
		th3.start();
		
		

	}

}
