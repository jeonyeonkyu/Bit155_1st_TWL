import kr.or.bit.common.Car;

/*
 Ŭ���� ==���赵 ==Ÿ��
 
 Ŭ���� ���� ��� : [�ʵ� + �Լ�]+ ������
 *�ʵ�(field)>> �������� , �������� , ����(��ǰ)���� �ڿ� >> ����
 *�Լ�(function) >>���(���� ����)
 *�߰� ������ >> �ʵ��� �ʱ�ȭ�� �������� �ϴ� �Լ�
 *
 *
 *Ŭ���� , �ʵ� ,������ ,�Լ� : �ڽ��� ����(����)�� �־ �����ؾ��� (������, ������, ������)
 *>> public, private, default ,protected ....
 *
 *
 1. public class Test{}

 2. class Test{} >> �����Ϸ��� ���������� default �����ڸ� �ٿ��� ���
 >>���������� �����Ϸ��� �����ϴ� �ڵ� : default class Test{}
 >>default ��� �����ڴ� �����ڰ� ���� �������� �ʴ´�..
 >>** default �����ڴ�: [���� ����(package)���� ���� ���� ], [�ٸ� ������ ������ ���� ���� �Ұ�]
 >>** default �����ڴ�: ���� ���� (package)������ [���� ����]����  

 3. �ϳ��� �������� �ڹ������� �������� Ŭ������ ���� �� �ִ�.(Test.java) (0)
    �� public �ϳ��� ����..�������� default 
 
 
 �ǽ�
 Src ���� >> Ex01_main
 kr.or.bit.common >> public Bitmain
 kr.or.bit.common >> public Car
 kr.or.bit.common >> (default) Car  //�տ� �ۺ��� ���°� ���� ����. �ȿ����� ���� ��ž� �ϴ°Ŷ� �Ȱ�������
 
 
 	//������Ʈ�� ù��°�� �䱸������ �ľ��ؾ���
 	 * 1.�䱸���� ���Ǽ�(�޴�,�Խ��� �α��ε�)
 	 * 2.�䱸���� ��
 	 * �����۾��ϴ� �ɷµ� �ʿ��ϴ�!
 	 * 
 	 * �̷��� �ľ��ϴٺ��� ���� �����ϴ� ������, ����,�����ϴ� �뺯�� , �츰 Ŭ���̾�Ʈ�� ��� �����ؼ�  �������Ѵ�.
 	 * �ϳ��� ������ �������� ������ class Frame{}, Cpu cpu;������ ����.
 	 * �ٵ� Frame frame;������ Ÿ���� ������ Cpu cpu;������Ÿ���� ������ �̷��� ���־����.
 
 */
//������ �տ� default ���� �Ǿ� �ִ�... ���� ����(��Ű��)�������� ���� ����, �ٸ� ���������� ���� �Ұ�.

class Test{  //default test >>���� ������������ ��밡��
	int d_iv; //�����Ϸ��� �ڵ����� default int d_iv �� �ؼ���
	public int p_iv; //��𿡼��� ��������
	private int pri_iv; //�������� ���߾��� ����
}

public class Ex_01main {

	public static void main(String[] args) {
		Car car =new Car();
		//car.door= 10; �� kr.or.bit.common�� �ִ� ī ���� door ������ ������ �ȵɱ�. default ���� �̱⶧���� �ȵ� 
		//kr.or.bit.common.Person p = new Person();
		
		Test t = new Test();
		t.d_iv = 100; //default
		t.p_iv = 200; //public
		//private �ڿ����� �Ұ�
		
		
	}

}
