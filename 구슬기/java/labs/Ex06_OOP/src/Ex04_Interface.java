//���� �ٸ� Ŭ������ �ϳ��� �θ�� �����ִ� ����
//���� �ƴ� ������ ���ֵ�� ��ġ���Ѻ��� �׳��� �����ϱ� ����. ���ӿ��� �������� �翬�� ����.  �������� �����尡 �� ��ƴ�....
//�������̰� ��θ�(�������̽� )����� ����... 
//

//

interface Irepairable{ //�����Ҽ��ִ� 
	
	
}


class Unit2{
	int hitpoint; //�⺻������
	final int MAX_HP;
	Unit2(int hp){
		this.MAX_HP = hp;
	}
}
//�������� 
class GroundUnit extends Unit2{
	GroundUnit(int hp){
		super(hp);
	}
}

//��������
class AirUnit extends Unit2{
	public AirUnit(int hp) {
		super(hp);
	}
}


class CommandCenter implements Irepairable{ //Scv ���� �ؼ�    //*****Irepairable �� �θ� �������*****
	
}



class Tank2 extends GroundUnit implements Irepairable{
	Tank2(){
		super(50);
		this.hitpoint = this.MAX_HP;  //hipt �� �ٰ� MAW�� ä���
	}
	@Override
	public String toString() {
		return "Tank2";
	}
}

class Marine2 extends GroundUnit {
	Marine2(){
		super(50);
		this.hitpoint = this.MAX_HP;  //hipt �� �ٰ� MAW�� ä���
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
	//Scv ��üȭ, Ư��ȭ ������ ���
	//repair(�����ϴ�)
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
	 
	 Scv repair  �Ҽ��ִ� Unit�� �����ϸ�.....Unit ������ŭ repair �Լ� �߰�
	 ��� : �ϳ��� repair�Լ��� ��� repair ������ Unit �� �����Ҽ� ������?
	 ������....��Ӱ��迡�� �θ�Ÿ���� �ڽİ�ü�� �ּҸ� ���� �� �ִ�. ������ǰ ���� 
	 �츮�� ������ �ִ� ��� Unit �� repair �� ����� �ƴϴ�. 
	  
	 */
	
//	��� ġ�� �غ����� �̰����� �غ��� ��
//	void repair(GroundUnit unit) { //Scv >> Tank, Scv(0), Marine(X)
//		void repair(GroundUnit unit) {  //���������� ���ԵǾ �ȵȴ�.
//	void repair(GroundUnit unit) {
//		if(unit.hitpoint != unit.MAX_HP) {
//			unit.hitpoint += 5;
//		}
//	}
	
	//�߱׷� �ᱹ���� ���� �������� ����
	//CommandCenter
	//Marine
	//Tank
	//Scv 
	
	//�ذ��  : Interface
	
	//1.���� �������� ���� Ŭ������ ���ؼ� �ϳ��� ���� �������(���� �θ�μ��� ������ ���´�)
	//  �������̽��� �ᱹ���� �ϳ��� Ÿ���̴�....
	//implements Irepairable{  } �� �θ�� �༭ �ϳ��� �����ش�.
//	class CommandCenter implements Irepairable
//	class Tank2 
//	class Scv
	
	void repair(Irepairable repairunit) {
		//repairunit ������ � ��ü�� �ּҸ� ������ �ֳ�?   :Tank2, CommandCenter ,Scv
		
		//repair �ϴ� ����� CommandCenter �� �� �ִ� �� Unit �ƴϴ�
		//��������� �ٸ���
		
		//repairunit �� �ڱ���� �ƹ��͵� ���� �����̴�.
		//�θ�� �ڽ��� �͸�
		
		//Unit2 >> hitpoint ,Max_up
		
		//(Irepairable repairunit) >> Tank2
		//downcasting -> Tank2 tank = (Tank2)repairunit    //���� Ÿ���� ����Ÿ������ ������ 
		//downcasting -> Scv tank = (Scv)repairunit    //���� Ÿ���� ����Ÿ������ �����ش�
		
		//���
		//Tank2 > GroundUnit > Unit2
		//Scv >  GroundUnit > Unit2
		//������ : Unit2
		
		//CommandCenter > Unit2(x)
		//���������� ���ָ� parameter �� �޴µ�..
		// �� parameter�� �ٸ� ���� ��ĵ� �����Ѵ�...
		
		if(repairunit instanceof Unit2) {     //repairunit Tank,Scv   //��Ӱ��� Ÿ���� ����� ������.
 //			��ü        intstanceof   Ÿ��  
			Unit2 unit = (Unit2)repairunit; //down casting �� ���׿� ���� ����.   �ֻ����� �������̽��� �����ذŴ�...
			//rep�� uni2�� �ν��Ͻ���? ��� ���°Ŵ�.
			//Tank2 tank = (Tank2)unit;  //�̷������� �ٿ� ĳ���� �ؾ��Ѵ�.  
			if(unit.hitpoint != unit.MAX_HP) {
				unit.hitpoint =unit.MAX_HP;
			}
		}else {  //Unit2�� �θ�� ������ ���� ������
			     //�ڵ� ����
			     System.out.println("unit2�� �ƴϿ���.. �ٸ� ������� repair �մϴ�.");
			
		}
		
	}
}



public class Ex04_Interface {

	public static void main(String[] args) {
		Tank2 tank = new Tank2();
		Marine2 marine = new Marine2();
		Scv scv = new Scv();
		
		
		//����
		tank.hitpoint -= 20;
		System.out.println("��ũ: "+ tank.hitpoint);
		System.out.println("Scv ������û");
		scv.repair(tank);  //marine �� ���ü����� �������� �������� �ʾҰ� �������� �θ�������� �ʴ�.
		System.out.println("��ũ: "+ tank.hitpoint);
		
		CommandCenter center = new CommandCenter();
		scv.repair(center); //unit2�� �ƴϿ���.. �ٸ� ������� repair �մϴ�.
	}

}
