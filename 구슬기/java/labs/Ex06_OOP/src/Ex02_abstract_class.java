//���� : unit( ����)

//unit ������( �̵���ǥ, �̵�, �����)
//unit �̵� ����� �ٸ���. (�̵������ unit ���� ������ ����),,, ����..�ϰ� �ʹ�?
//abstract class �̸� {abstract �̵�();}

abstract class Unit{
	int x, y;
	void stop() {
		System.out.println("Unit stop");
	}
	 
	
	//�̵� (������ �������̵�(
	abstract void move(int x, int y);  //�̰� �߻��ڿ�
	
}
//Tank
class Tank extends Unit{

	
	
	@Override
	void move(int x, int y) {
		this.x = x;
		this.y = y;
		
		System.out.println("Tank �̵�: "+ this.x + ","+ this.y);
	}

	
	
	//Tank�� ������ Ư���ϰ� ��üȭ��  ������ ���
	void changeMode() {
		System.out.println("��ũ ��ȯ ���");
	}
	



	
	
}

//Marine
class Marine extends Unit{

	@Override
	void move(int x, int y) {
		this.x = x;
		this.y = y;
		System.out.println("Marine �̵�: "+ this.x + ","+ this.y);
		
	}
	//Ư��ȭ ,��üȭ
	void stimpack() {
		System.out.println("�����ѱ��");
	}
	
}
//Dropship
class Dropship extends Unit{

	@Override
	void move(int x, int y) {
		this.x = x;
		this.y = y;
		System.out.println("Dropship �̵�: "+ this.x + ","+ this.y);
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
		
		//1.��ũ 3�븦 ����� ���� ��ǥ�� �̵���Ű����(33.44)                        ///////////�̰Ų� �ٽ� �غ�����. 
		
		Tank[] tanklist = {new Tank(),new Tank(),new Tank()};
		for(Tank tank : tanklist) {
			tank.move(33, 44);
		}
		

		//2.�������� Unit(Tank 1, Marine 1, Dropship 1)�� ���� ��ǥ�� �̵���Ű����. 
		//hint ������ǰ����.....
		Unit[] unitlist = {new Tank(),new Marine(),new Dropship()}; //���� �ڽĵ��� �ּҸ� �޾Ҵ�.�θ�� �ڽ�Ÿ�Կ� ������ �Ұ������� �������̵� �ȰŶ� ����������.  move ���ڽ��� ���� �ִ� move ��. 
		for(Unit unit :unitlist ) {
			unit.move(111, 222); //�θ�Ÿ������ �����ϴ��� move�� ������ �Ǿ������ϱ� 
		}
		
		

	}

}
