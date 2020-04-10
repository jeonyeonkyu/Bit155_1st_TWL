import kr.or.bit.Pclass;

/*
 
 public, default, private, ��Ӱ��� >> protected(������־�� �ִ� ������)
 
 ��鼺: ����(default, public)
>> ����� ���� Ŭ���� �ȿ��� protected �����ڴ� default �� ����.
>> ��? ����� ���� ��Ȳ������ protected �����ڴ� �ǹ̰� ����.

����� ���� ���� Ŭ������ ����Ѵٸ� ����� ������������ ���ھ�==�ǵ�
�ۺ��� �ص��ǰ� ���ص���
������Ƽ��� �������ϸ� ���ڴµ� ���ص���..�䷱����.

��Ӱ��迡���� ������Ƽ��.
�ڽ�Ŭ�������� ����Ŭ������ ���ٰ����ϰ�. �������������� ���� �Ұ����Ұ�?
��Ӱ��迡���� �������̵�. 

 */
class Dclass {
	public int j;
	private int o;
	int p; // default.. �Ƚᵵ �����ϱ� ������� �ʴ´�.
	protected int k;
}

class Child2 extends Pclass {
	void method() {
		this.k = 1000; // ��Ӱ��迡�� �ڽ��� �θ��� protected ������ �ڿ��� publicó�� ��밡���ϴ�.(��Ӱ��迡����)
		System.out.println(this.k);
	}
}

public class Ex08_Inherit_Protected {
	public static void main(String[] args) {
		Dclass dc = new Dclass();
		// dc.j ok(���ٰ����ϴٴ¶�)>> public
		// dc.p ok >> default (���������������� �� �����ش�.)
		// dc.k ok >> (protected ���� ���� �ȿ��� default)
		// dc.o >> private (x) ���� Ŭ������ ���ٰ���
		// �ᱹ protected ��Ӱ��迡���� ���ȴ�!!

		// �ٸ� ����(package)
		Pclass pc = new Pclass();
		// pc.j public �길 ����.
		// pc.p
		// pc.k
		// pc.o
		Child2 ch = new Child2();
		ch.method();

	}

}
