//게임 : unit( 유닛)

//unit 공통기능( 이동좌표, 이동, 멈춘다)
//unit 이동 방법은 다르다. (이동방법은 unit 마다 별도의 구현),,, 강제..하고 싶다?
//abstract class 이름 {abstract 이동();}

abstract class Unit{
	int x, y;
	void stop() {
		System.out.println("Unit stop");
	}
	 
	
	//이동 (강제적 오버리이딩(
	abstract void move(int x, int y);  //이게 추상자원
	
}
//Tank
class Tank extends Unit{

	
	
	@Override
	void move(int x, int y) {
		this.x = x;
		this.y = y;
		
		System.out.println("Tank 이동: "+ this.x + ","+ this.y);
	}

	
	
	//Tank가 가지는 특수하고 구체화된  고유한 기능
	void changeMode() {
		System.out.println("탱크 변환 모드");
	}
	



	
	
}

//Marine
class Marine extends Unit{

	@Override
	void move(int x, int y) {
		this.x = x;
		this.y = y;
		System.out.println("Marine 이동: "+ this.x + ","+ this.y);
		
	}
	//특수화 ,구체화
	void stimpack() {
		System.out.println("스팀팩기능");
	}
	
}
//Dropship
class Dropship extends Unit{

	@Override
	void move(int x, int y) {
		this.x = x;
		this.y = y;
		System.out.println("Dropship 이동: "+ this.x + ","+ this.y);
	}
	
	void load() {
		System.out.println("Unit load");
	}
	void unload() {
		System.out.println("Unit unload");
	}
}







public class Ex02_abstract_class {

	public static void main(String[] args) {
		Tank t = new Tank();
		t.move(500, 200);
		t.stop();
		t.changeMode();
		
		Marine m = new Marine();
		m.move(500, 300);
		m.stop();
		m.stimpack();
		
		//1.탱크 3대를 만들고 같은 좌표로 이동시키세요(33.44)                        ///////////이거꼭 다시 해봐야함. 
		
		Tank[] tanklist = {new Tank(),new Tank(),new Tank()};
		for(Tank tank : tanklist) {
			tank.move(33, 44);
		}
		

		//2.여러개의 Unit(Tank 1, Marine 1, Dropship 1)를 같은 좌표로 이동시키세요. 
		//hint 전자제품매장.....
		Unit[] unitlist = {new Tank(),new Marine(),new Dropship()}; //유닛 자식들의 주소를 받았다.부모는 자식타입에 접근이 불가하지만 오버라이드 된거라서 내려버린다.  move 는자식이 갖고 있는 move 다. 
		for(Unit unit :unitlist ) {
			unit.move(111, 222); //부모타입으로 접근하더라도 move가 재정의 되어있으니까 
		}
		
		

	}

}
