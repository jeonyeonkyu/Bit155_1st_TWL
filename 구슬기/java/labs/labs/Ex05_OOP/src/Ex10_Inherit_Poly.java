/*
  ������ - (��Ӱ��迡�� ����)    final����� ��Ӱ��迡�� �����Ѵ�.
  ������ : �������� ����(����)�� ���� �� �ִ� �ɷ� . ������ ������ �ǹ�
  
  C#: ������(overloading, override) �ɷ����� ����.
  
  JAVA : [��Ӱ���]���� [�ϳ��� ��������]�� [�������� Ÿ��]�� ���� �� �ִ� �ɷ��� "������" �̶�� �Ѵ�.
       ��!!!!!!! �ϳ��� ���������� [�θ�Ÿ��] �̾�� �մϴ�.
  �θ� Ŭ���� Ÿ���� ���������� �������� �ڽ�Ŭ���� ��ü�� ���� �� ���ִ�. (�θ�� �ڽ��� ǰ�� �� �ִ�. �����̸� ������)
  
 -- ������ : ���Ǽ���� �ݴ�ȴ�. ? ���Ǽ��� - �θ�� �ڽĿ��� ���Ǿ��� �ش�. 
                                                                �ڹ� - �ڽ��� �θ𿡰� ���Ǿ��� �帰��.      
  
 */
class Tv2{ //�θ�Ÿ��(�Ϲ�ȭ, �߻�ȭ) �����ڿ�
	boolean power;
	int ch;
	
	void power() {
		this.power = !this.power;
	}
	void chUp() {
		this.ch++;
	}
	void chDown() {
		this.ch--;
	}
}

class CapTv extends Tv2{ //CapTv Ư��ȭ, ��üȭ, ������ ǥ��   ...�ڸ� �޸��� Tv
	String text;
	String captionText() {
		return this.text = "���� �ڸ� ó����.....";
	}
}

public class Ex10_Inherit_Poly {

	public static void main(String[] args) {
		CapTv captv =new CapTv();
		captv.power();
		System.out.println("���� : "+ captv.power);
		
		captv.chUp();
		System.out.println("ä������: "+ captv.ch);
		System.out.println("�ڸ�ó��: "+ captv.captionText());
		//���������������
		//���� Ÿ�Գ����� �Ҵ��� �����ߴ�. ���±�����
		//Car c = new Car();
		//Car c2 = c;
		
		Tv2 tv2 = captv;  
		//��Ӱ��迡�� �θ�Ÿ���� �ڽ�Ÿ���� �ּҸ� ���� �� �ִ�.(�̰� ������)
		//�� �θ�� �ڽ��� ��ü�� �� �� �ֵ�.
		//�� �����Ǹ� �����ϰ�....
		//Tv2 tv = new Tv2(); �̷��� ���� �ʴ� ����. ���� ���� �ö� �޸𸮸� �����ϱ� ���ؼ�.  �� �����ϱ� �Ⱦ!
		System.out.println(tv2==captv);   //���� �ּҰ� ����.
		System.out.println(tv2.toString());
		System.out.println(captv.toString());
		// tv2.captionText() �ȳ��� �ڽĲ���>> �ڽ��� ��ü�� >> �ڽ��� �ڿ� ���� �а�
		
		
	}

}
