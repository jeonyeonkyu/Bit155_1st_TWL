/*
 * 
 * ************************************************************************
 * 
 * 
 동기화 (한번에 한사람만 편하게 화장실쓰게하고 싶은 것)
 한강 고수부지 화장실(공유자원) : 여러개의 스레드가 동시에 접근 가능한 자원 ... 
 
 화장실 1개, 사람 10명 ( Thread 10개)
 
 
반대되는건 
 한강 비빔밥 축제 : 동시접근 허용 
  
  객체 :LOCK
  함수 :LOCK 
   
  보통객체가 갖고있는 특정함수에 LOCK 을 자주건다.  이걸 [동기화]한다고 함
 */

class Wroom{
	
	synchronized void openDoor(String name){
		System.out.println(name + "님 화장실 입장 ^^");
		for(int i =0;i<100; i++) {
			System.out.println(name + "사용: "+ i);
		if(i ==10){
			System.out.println(name + "님 끙~~");
		}
		}
		System.out.println("시원하다 ^^!");
	}
}

class User extends Thread{
	Wroom wr; //화장실을 가질수 있게 해줌..화장실사용하니까 주소를 갖고있다. 
	String who;
	
	User(String name, Wroom w){
		this.who = name;
		this.wr = w;
	}
	@Override
	public void run() { //화장실 입장
		wr.openDoor(this.who);
	}
	
}

public class Ex10_Sync_Thread {
	public static void main(String[] args) {
		//한강 둔치 의 화장실 1개
		Wroom w = new Wroom();
		
		//사람들
		User kim = new User("김씨",w);
		User park = new User("박씨",w);
		User lee = new User("이씨",w);
		
		//사람들 배가아파요~
		kim.start();
		park.start();
		lee.start();  //누가 먼저 도착할지는 알 수 없다.
		
		//이렇게 할 경우에는 누군가 먼저 공유자원에 접근하면 락 기능이 없어서 셋이 동시에 사용하게 된다.
		//synchronized  를 걸면 다른 사람들이 못 들어온다. synchronized void openDoor(String name){}   

	}

}
