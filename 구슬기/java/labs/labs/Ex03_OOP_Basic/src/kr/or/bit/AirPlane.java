package kr.or.bit;
/*
 �츮 ȸ��� ����⸦ �ֹ� ���� �Ǹ��ϴ� ȸ���Դϴ�
 �츮ȸ��� ����⸦ �����ϴ� ���赵�� �ۼ��Ϸ��� �մϴ�
 
 �䱸����
 1. ����⸦ �����ϰ� ������� �̸��� ��ȣ�� �ο��ؾ� �մϴ�.
 2. ����Ⱑ ����Ǹ� ������� �̸��� ��ȣ �°� �ο��Ǿ������� Ȯ�� �ϴ� �۾��� �ʿ��մϴ�. (������� Ȯ��)
 3.�������� ������� ������� ������� �Ѵ��(����)�� Ȯ�� �� �� �ֽ��ϴ�.
 
 
AirPlane air = new AirPlane();
AirPlane air2 = new AirPlane();
AirPlane air3 = new AirPlane();

��Ȯ�ϰ� �ϸ� �Ʒ� �ڵ�� 50�� >> ������..���� �ʾҴ�.
�׷��� ���ݱ��� ��� �ڵ�� ���� 99��>> �Լ� ���

2~3 �� �ڿ� �Ʒ��ڵ带 ���� ¥���� �ٲ� ����

���� ����Ŵ� total ���� ������ ������ �����ϸ� �ٽ� �غ���

Ʋ���� �ִ� ������ �ִ� �ڵ带 ¥�°� ���� ���� �ڵ��.

 
public class AirPlane {
	private int airnum;
	private String airname;
	private static int total; //����
	
	
	public void makeAirPlane(int num, String name) {
		airnum = num;
		airname = name;
		//����
		total ++;
	 System.out.printf("��ȣ:[%d], �̸�:[%s]\n",airnum,airname);
	}
	
	public void airPlaneTotalcount() {
		System.out.printf("�� ����� ���� �� ��:[%d]\n",total);
	}
*/
//�̰ſ� �� �͵�.
//ĸ��ȭ
//����ƽ
//��簴ü�� �����ϴ� �ڿ� ����ƽ
//�����ε��� ����Ʈ���͸� ���� �ʱ�ȭ ����
//�� �� �Ἥ �������� �����ش�.
//method
//printf    


//�̰� ������ �Լ��� �����.
//90��  >>  this ���� �ʾƼ�....
//this �����ؼ� 100��

public class AirPlane {
	private int airnum;
	private String airname;
	private static int total;
	
	public AirPlane(int airnum, String airname){ //����� ����⸦ ������� ����� �ݵ�� ��ȣ, �̸��� �־�� �մϴ�.
		this.airname = airname;
		this.airnum = airnum;
		total ++;
		System.out.printf("��ȣ:[%d], �̸�:[%s]\n",airnum,airname);
	}

	
	public void airPlaneTotalcount() {
		System.out.printf("�� ����� ���� �� ��:[%d]\n",total);
	
	
	}
}
