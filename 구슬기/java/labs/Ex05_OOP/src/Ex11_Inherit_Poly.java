/*
  �ڹ� ������(���)
  
 */

class Pbase{ //�ڵ����� Ʋ
	int p = 100;
}
class Cbase extends Pbase{ //�ѱ�Ÿ�̾�
	int c = 200;
}
class Dbase extends Pbase{ //�̽��� �� �̷��� ����.
	
}


public class Ex11_Inherit_Poly {

	public static void main(String[] args) {
		Cbase cbase = new Cbase();
		System.out.println(cbase.toString());
		
		Pbase p = cbase; //������ .. �̷��� ��ü�������� �̹� �����Ǿ��ִ� ��ü��, cbase�� �ּҸ� �Ѱܹ޴´�. 
		//�θ�Ÿ���� �������� p �� �ڽ�Ÿ���� �������� cbase�� ������ �ּҰ��� ���� �� �ִ�.
		//��,  �θ�Ÿ���� �������� p �� ������ �θ�ü (heap�� �ִ°�ü)���� ���� �����ϰ� �ڽİ�ü�� ���� �Ұ�
		
		Dbase dbase = new Dbase();
		
		p = dbase;  //�ѱ�Ÿ�̾� �̽��� Ÿ�̾� �ּ� �ΰ� �� ����
		//�θ�Ÿ�� p�� �ڽ�Ÿ�� [cbase �� �ּ�]�� ������, [dbase �� �ּ�]�� ���� �� �ִ�.
		//p�� ��Ӱ��迡�� �������� �ڽ� Ÿ���� �ּ� ���� �����ϴ�.
		
		
	}

}
