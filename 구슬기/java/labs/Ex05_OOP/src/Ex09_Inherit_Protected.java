import kr.or.bit.Bird;

//protected ������ ��Ӱ��迡����
//���� : ��Ӱ��迡�� ������...
//����� ���� ����Ѵٸ� �� �ڿ�(�Լ�)�� ������ ���������پ�. �ƴԸ��� �䷱�ǵ�?
//protected �� Ÿ�������� �ܿ���.
//��
class Ostrich extends Bird{  //Ostrich is a Bird.
	//��üȭ, Ư��ȭ
	//Ÿ���� �ٴϱ�
	void run() {
		System.out.println("run ^^");
	}

	@Override
	protected void moveFast() {
		//super.moveFast();
		run();  //������ flying ������ �޷��� �����Ŵϱ� ��
	}
}
class Bi extends Bird{
	@Override
	protected void moveFast() {
		super.moveFast();
	}
	
}

public class Ex09_Inherit_Protected {

	public static void main(String[] args) {
		Ostrich ost =new Ostrich(); //Ÿ�� �޷��� ����
		ost.run();
		ost.moveFast();
		
		Bi bi = new Bi(); //�� ���Ƽ� ����
		bi.fly();
		bi.moveFast();  //��� �������ߴµ� super�� ����Ŭ���� �޼ҵ� ����
		
		//bi Ŭ���� ���� ������ ���� �ʰ� �����Լ����� ��ü�� �����ϰ� �Ǹ� 
		//protected �� �Ⱥ��δ�. 
		//protected �Լ��� �״�� ���� �ʹٸ� . bi Ŭ������ �� ����㿡 super �� ���� �ϴ��� �������̵� �ϴ���.
		//public �Լ��� �ٲٴ���.
		//�׷��� ������ �ٸ� ��Ű�� �� �Ⱥ��δ�.
		
		
	}

}
