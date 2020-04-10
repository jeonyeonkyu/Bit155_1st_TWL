//서로 다른 클래스를 하나의 부모로 묶어주는 역할
//내가 아는 게임의 유닛들과 매치시켜보면 그나마 이해하기 쉽다. 게임에는 다형성이 당연히 들어간다.  게임으로 쓰레드가 좀 어렵다....
//공통점뽑고 양부모(인터페이스 )만들어 보고... 
//

//

interface Irepairable{ //뭐뭐할수있는 
	
	
}


class Unit2{
	int hitpoint; //기본에너지
	final int MAX_HP;
	Unit2(int hp){
		this.MAX_HP = hp;
	}
}
//지상유닛 
class GroundUnit extends Unit2{
	GroundUnit(int hp){
		super(hp);
	}
}

//공중유닛
class AirUnit extends Unit2{
	public AirUnit(int hp) {
		super(hp);
	}
}


class CommandCenter implements Irepairable{ //Scv 충전 해서    //*****Irepairable 로 부모 만들어줌*****
	
}



class Tank2 extends GroundUnit implements Irepairable{
	Tank2(){
		super(50);
		this.hitpoint = this.MAX_HP;  //hipt 은 줄고 MAW로 채우고
	}
	@Override
	public String toString() {
		return "Tank2";
	}
}

class Marine2 extends GroundUnit {
	Marine2(){
		super(50);
		this.hitpoint = this.MAX_HP;  //hipt 은 줄고 MAW로 채우고
	}
	@Override
	public String toString() {
		return "Marine2";
	}
}

class Scv extends GroundUnit implements Irepairable{
	Scv(){
		super(60);
		this.hitpoint = this.MAX_HP;
	}
	@Override
	public String toString() {
		return "Scv";
	}
	//Scv 구체화, 특수화 고유한 기능
	//repair(수리하다)
	/*
	void repair(Tank2 tank) {
		if(tank.hitpoint != tank.MAX_HP) {
			tank.hitpoint += 5;
		}
	}
	
	void repair(Scv scv){
		if(scv.hitpoint != scv.MAX_HP) {
			scv.hitpoint += 5;
		}
	}
	/*
	 
	 Scv repair  할수있는 Unit이 증가하면.....Unit 개수만큼 repair 함수 추가
	 고민 : 하나의 repair함수가 모든 repair 가능한 Unit 을 수리할수 없을까?
	 다형성....상속관계에서 부모타입은 자식객체의 주소를 가질 수 있다. 전자제품 매장 
	 우리가 가지고 있는 모든 Unit 은 repair 의 대상은 아니다. 
	  
	 */
	
//	엮어서 치료 해보려고 이것저것 해보는 중
//	void repair(GroundUnit unit) { //Scv >> Tank, Scv(0), Marine(X)
//		void repair(GroundUnit unit) {  //공중유닛이 포함되어서 안된다.
//	void repair(GroundUnit unit) {
//		if(unit.hitpoint != unit.MAX_HP) {
//			unit.hitpoint += 5;
//		}
//	}
	
	//야그럼 결국에는 서로 연관성이 없네
	//CommandCenter
	//Marine
	//Tank
	//Scv 
	
	//해결사  : Interface
	
	//1.서로 연관성이 없는 클래스에 대해서 하나로 묶는 기능제공(상위 부모로서의 역할을 갖는다)
	//  인터페이스도 결국에는 하나의 타입이다....
	//implements Irepairable{  } 를 부모로 줘서 하나로 묶어준다.
//	class CommandCenter implements Irepairable
//	class Tank2 
//	class Scv
	
	void repair(Irepairable repairunit) {
		//repairunit 변수는 어떤 객체의 주소를 받을수 있나?   :Tank2, CommandCenter ,Scv
		
		//repair 하는 대상이 CommandCenter 올 수 있는 데 Unit 아니다
		//충전방식이 다르다
		
		//repairunit 은 자기것이 아무것도 없는 상태이다.
		//부모는 자식의 것만
		
		//Unit2 >> hitpoint ,Max_up
		
		//(Irepairable repairunit) >> Tank2
		//downcasting -> Tank2 tank = (Tank2)repairunit    //상위 타입을 하위타입으로 내려준 
		//downcasting -> Scv tank = (Scv)repairunit    //상위 타입을 하위타입으로 내려준다
		
		//요약
		//Tank2 > GroundUnit > Unit2
		//Scv >  GroundUnit > Unit2
		//공통점 : Unit2
		
		//CommandCenter > Unit2(x)
		//수리가능한 유닛만 parameter 로 받는데..
		// 그 parameter는 다른 충전 방식도 존재한다...
		
		if(repairunit instanceof Unit2) {     //repairunit Tank,Scv   //상속간의 타입을 물어보는 연산자.
 //			객체        intstanceof   타입  
			Unit2 unit = (Unit2)repairunit; //down casting 후 좌항에 접근 가능.   최상위인 인터페이스를 내려준거다...
			//rep가 uni2의 인스턴스니? 라고 묻는거다.
			//Tank2 tank = (Tank2)unit;  //이런식으로 다운 캐스팅 해야한다.  
			if(unit.hitpoint != unit.MAX_HP) {
				unit.hitpoint =unit.MAX_HP;
			}
		}else {  //Unit2를 부모로 가지고 있지 않으면
			     //코드 구현
			     System.out.println("unit2가 아니에요.. 다른 방식으로 repair 합니다.");
			
		}
		
	}
}



public class Ex04_Interface {

	public static void main(String[] args) {
		Tank2 tank = new Tank2();
		Marine2 marine = new Marine2();
		Scv scv = new Scv();
		
		
		//전투
		tank.hitpoint -= 20;
		System.out.println("탱크: "+ tank.hitpoint);
		System.out.println("Scv 수리요청");
		scv.repair(tank);  //marine 은 들어올수없음 리페어러블을 구현하지 않았고 리페어러블이 부모고있지도 않다.
		System.out.println("탱크: "+ tank.hitpoint);
		
		CommandCenter center = new CommandCenter();
		scv.repair(center); //unit2가 아니에요.. 다른 방식으로 repair 합니다.
	}

}
